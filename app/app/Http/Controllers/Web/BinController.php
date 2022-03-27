<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Data;
use Illuminate\Http\Request;

class BinController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function indexBin()
    {
        $result = Data::where("user_id", "=", auth()->user()->id)->where('logic_delete', "=", 1)->get();

        return view('bin', ['data' => $result, 'user' => auth()->user()]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function physicDelete($id)
    {
        Data::find($id)->delete();
        return redirect()->route('indexBin', ['user' => auth()->user()]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function physicRestore($id)
    {
        $user = Data::find($id);
        $user->logic_delete = false;
        $user->save();
        return redirect()->route('indexBin');
    }
}
