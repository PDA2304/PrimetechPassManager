<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Http\Requests\WebAutorizationRequest;
use App\Http\Requests\WebRegistrationRequest;
use App\Models\Data;
use App\Models\Employee;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class AuthController extends Controller
{

    public function indexReg()
    {
        if (Auth::check()) {
            return redirect("main");
        }
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
        Auth::login($user);
        return redirect("main");
    }

    public function indexLogin()
    {
        if (Auth::check()) {
            return redirect("main");
        }
        return view('login');
    }

    public function submitLogin(WebAutorizationRequest $request)
    {
        $user = Employee::where('login', $request->login)->first();
        if (!Hash::check($request->password, $user->password)) {
            return redirect('/')->withErrors(['message' => 'Пароль неверный.']);
        } else {
            $user->token = Str::random(100);
            Auth::login($user);
            return redirect('main');
        }
    }

    public function indexMain()
    {
        $result = Data::where("user_id", "=", auth()->user()->id)->where('logic_delete', "=", 0)->get();

        return view('main', ['data' => $result, 'user' => auth()->user()]);
    }
    public function logout()
    {
        Auth::logout();
        return redirect("/");
    }
}
