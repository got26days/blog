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

    
            $soloid = $request['gid3'];
     
            $solo = Item::where('id', '=', $soloid)->first();

            $this->newclick($solo);
    
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

    public function newclick($post)
    {
        if($post->click == null){
            $post->click = 0;
        }

        if($post->view == null){
            $post->view = 0;
        }

        $post->click = $post->click + 1;
        $post->view = $post->view + 1;

        if($post->view == 0){
            $nns = 1;
        } else {
            $nns = $post->view;
        }
        
        $str = floatval($post->click)/floatval($nns);
        $post->result = number_format((float)$str * 100, 4, '.', '');
        $post->save();

        $super_click = Click::whereDate('created_at', Carbon::today())->where('item_id', '=', $post->id)->first();
        if(!$super_click){
            $super_click = new Click;
            $super_click->item_id = $post->id;
            $super_click->click = 1;
            $super_click->view = 1;
            $super_click->result = 88;
            $super_click->save();
        } else {
            $super_click->item_id = $post->id;
            $super_click->click = $super_click->click + 1;
            $super_click->view = $super_click->view + 1;
            $super_click->result = 999;
            $super_click->save();
        }

    }

}
