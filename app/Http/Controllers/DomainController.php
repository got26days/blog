<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Link;
use App\Item;
use App\Click;

class DomainController extends Controller
{
    public function prod1($slug, Request $request)
    {

        if($request['gid3']){

            $click = new Click;
            $click->item_id = $request['gid3'];
            $click->click = 1;
            $click->view = 0;
            $click->result = 0;
            $click->save(); 
            
            $solo_id = $request['gid_3'];
            
            $solo = Item::where('id', '=', $request['gid_3'])->first();

            return $solo;
        
            if($solo->click == null){
                $solo->click = 0;
            }
    
            if($solo->view == null){
                $post->view = 0;
            }
    
    
            $solo->click = ++$solo->click;
            $solo->view = ++$solo->view;
    
            if($solo->view == 0){
                $nns = 1;
            } else {
                $nns = $solo->view;
            }
            $str = floatval($solo->click)/floatval($nns);
            $solo->result = number_format((float)$str * 100, 4, '.', '');
    
            $solo->save();

            return $solo;
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
