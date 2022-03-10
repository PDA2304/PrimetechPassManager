<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class RegController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function reg()
    {
        return view('reg');
    }
    public function login()
    {
        return view('login');
    }
    public function main()
    {
        return view('main');
    }
}
