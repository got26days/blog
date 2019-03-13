<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DomainController extends Controller
{
    public function prod1()
    {
        return view('prod1.index');
    }

    public function prod2()
    {
        return view('prod2.index');
    }

    public function prod3()
    {
        return view('prod3.index');
    }

    public function prod4()
    {
        return view('prod4.index');
    }

    public function prod5()
    {
        return view('prod5.index');
    }
    public function prod6()
    {
        return view('prod6.index');
    }
}
