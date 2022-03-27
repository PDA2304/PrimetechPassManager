<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Http\Requests\WebRegistrationRequest;
use App\Models\Data;
use App\Models\Employee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use phpDocumentor\Reflection\DocBlock\Tag;

class DataController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function createData()
    {
        return view("details");
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function addUserData(Request $request)
    {

        $user = Data::create([
            'name' => trim($request->name),
            'login' => trim($request->login),
            'password' => trim($request->password),
            "description" => trim($request->description),
            'user_id' => auth()->user()->id,
        ]);

        return redirect('main');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function deleteUserData($id)
    {
        $user = Data::find($id);
        $user->logic_delete = true;
        $user->save();
        return redirect()->route('main');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function updateData($id, Request $request)
    {
        $user = Data::find($id);

        return view("update", ['user' => $user]);
    }

    public function updateUserData($id, Request $request)
    {
        $user = Data::find($id)->update([
            'name' => trim($request->name),
            'login' => trim($request->login),
            'password' => trim($request->password),
            'description' => $request->description,
        ]);
        return redirect(route('main', $user));
        //  return view('main', $id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function indexBin()
    {
        $result = Data::where("user_id", "=", auth()->user()->id)->where('logic_delete', "=", 1)->get();

        return view('bin', ['data' => $result, 'user' => auth()->user()]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
