<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function indexReg()
    {
        return view('reg');
    }

    public function submitReg()
    {
    }

    public function indexLogin()
    {
        return view('login');
    }

    public function submitLogin()
    {
    }
}
