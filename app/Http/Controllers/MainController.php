<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MainController extends Controller
{
    public function index()
    {
        return view('pages.index');
    }

    public function shou()
    {
        return view('pages.solo');
    }

    public function article()
    {
        return view('pages.article');
    }
}
