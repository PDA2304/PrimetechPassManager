<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Http\Requests\WebAutorizationRequest;
use App\Http\Requests\WebRegistrationRequest;
use App\Models\Data;
use App\Models\Employee;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    public function show(Request $request, $id)
    {
    }

    public function indexReg()
    {
        return view('reg');
    }

    public function submitReg(WebRegistrationRequest $request)
    {
        $user = Employee::create([
            'user_name' => trim($request->user_name),
            'login' => trim($request->login),
            "token" => Str::random(100),
            'password' => Hash::make(trim($request->password)),
        ]);
        if ($user) {
            auth('web')->login($user);
            $request->session()->push('id', $user->id);
            $data = Data::where('user_id', $user->id)->get();
            return redirect(view('main', ['data' => $data]));
        }
    }

    public function indexLogin()
    {
        return view('login');
    }

    public function submitLogin(WebAutorizationRequest $request)
    {
        $user = Employee::where('login', $request->login)->first();
        if (!Hash::check($request->password, $user->password)) {
            return redirect('/')->withErrors(['message' => 'Пароль неверный.']);
        } else {
            $user->token = Str::random(100);
            $user->save();
            $request->session()->push('id', $user->id);
            $data = Data::where('user_id', $user->id)->get();
            return view('main', ['data' => $data]);
        }
    }

    public function indexMain()
    {
        return view('main');
    }
}
