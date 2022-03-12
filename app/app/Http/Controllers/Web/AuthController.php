<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Http\Requests\WebRegistrationRequest;
use App\Models\Employee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    public function indexReg()
    {
        return view('reg');
    }

    public function submitReg(WebRegistrationRequest $request)
    {
        $result = Employee::create([
            'user_name' => trim($request->user_name),
            'login' => trim($request->login),
            "token" => Str::random(100),
            'password' => Hash::make(trim($request->password)),
        ]);
        return redirect('/');
    }

    public function indexLogin()
    {
        return view('login');
    }

    public function submitLogin()
    {
    }
}
