<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Link;
use App\Item;

class DomainController extends Controller
{
    public function prod1($slug, Request $request)
    {

        if($request['gid_4']){
            $solo_id = $request['gid_4'];
            $solo = Item::find($request['gid_4']);

            if($solo->click == null){
                $solo->click = 0;
            }
    
            if($solo->view == null){
                $post->view = 0;
            }
    
    
            $solo->click = ++$solo->click;
            // $solo->view = ++$solo->view;
            $str = $solo->click/$solo->view;
            $solo->result = round((float)$str * 100 );
            $solo->save();
        } 

        $link = Link::where('slug', '=', $slug)->first();

        if(!$link){
            abort(404);
        } else
        {
            return view('prod' .  $link->option . '.index');
        }


        return view('prod1.index');
    }

    // public function prod2()
    // {
    //     return view('prod2.index');
    // }

    // public function prod3()
    // {
    //     return view('prod3.index');
    // }

    // public function prod4()
    // {
    //     return view('prod4.index');
    // }

    // public function prod5()
    // {
    //     return view('prod5.index');
    // }
    // public function prod6()
    // {
    //     return view('prod6.index');
    // }
}
