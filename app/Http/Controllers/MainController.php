<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Item;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Facades\Voyager;
use App\Link;

class MainController extends Controller
{

    public function getdata($position, $last)
    {
        if($last == 0){
            $mainnews = Item::orderBy('id', 'DESC')->where('position', '=', $position)
            // ->where('area9', '=', 0)
            // ->where('area10', '=', 0)
            ->limit(12)->get();
          
                // unset($mainnews[0]);
                // unset($mainnews[1]);
           

        } else {
            $mainnews = Item::orderBy('id', 'DESC')->where('id', '<', $last)
            // ->where('area9', '=', 0)
            // ->where('area10', '=', 0)
            ->where('position', '=', $position)->limit(12)->get();
        }

        foreach($mainnews as $post){
            $post->image = $post->thumbnail('cropped', 'image');
            $post->link = '/post' . $post->id;
        }

        

        return  response()->json($mainnews);
    }

    public function getposts($ops)
    {

        $posts =  Item::where('loader', '=', true)->orderBy(DB::raw('RAND()'))->where('position', '=', $ops)->limit(11)->get();

        foreach($posts as $post){
            $post->image = Voyager::image($post->thumbnail('cropped','image'));

            if($post->link != 0) {
                $link = Link::where('option', '=', $post->link)->latest()->first();
                if($link){
                    $post->link = '/' .  $link->slug .  $link['utm'];
                } else {
                    $post->link = '/post' . $post->id;
                }
            } else {
                $post->link = '/post' . $post->id;
            }
        }

        

        return  response()->json($posts);
    }

    public function getLinks($array)
    {

        foreach($array as $post){
            $post->link = '/post' . $post->id;
        }

        return $array;

    }

    public function index()
    {

        for($i = 0; $i <= 5; $i++){

            ${'pos' . $i} = Item::latest()->where('position', '=', $i)
            // ->where('area10', '=', 1)
            ->orderBy(DB::raw('RAND()'))->limit(3)->get();

            foreach(${'pos' . $i} as $post){
                $post->image = $post->thumbnail('small', 'image');
                $post->link = '/post' . $post->id;
            }

        }

        $position = 0;

        $mainnews = Item::latest()
        ->where('position', '=', 0)
        // ->where('area9', '=', 1)
        ->limit(2)->get();
        $lastop = 0;
        foreach($mainnews as $post){
            $post->link = '/post' . $post->id;

            $lastop =  $post->id;
        }

        
        
        return view('pages.index', compact('pos0', 'pos1', 'pos2', 'pos3', 'pos4', 'pos5', 'mainnews', 'position', 'lastop'));
    }

    public function politika()
    {
        for($i = 0; $i <= 5; $i++){
            ${'pos' . $i} = Item::latest()
            ->where('position', '=', $i)
            // ->where('area10', '=', 1)
            ->orderBy(DB::raw('RAND()'))
            ->limit(3)
            ->get();

            foreach(${'pos' . $i} as $post){
                $post->image = $post->thumbnail('small', 'image');
                $post->link = '/post' . $post->id;
            }
        }
        $position = 1;

        $mainnews = Item::latest()
        // ->where('area9', '=', 1)
        ->where('position', '=', 1)
        ->limit(2)
        ->get();

        $lastop = 0;
        foreach($mainnews as $post){
            $post->link = '/post' . $post->id;

            $lastop =  $post->id;
        }
        
        return view('pages.index', compact('pos0', 
        'pos1', 'pos2', 'pos3', 'pos4', 'pos5', 'mainnews', 'position', 'lastop'));
    }

    public function novosti()
    {
        for($i = 0; $i <= 5; $i++){
            ${'pos' . $i} = Item::latest()
            ->where('position', '=', $i)
            ->orderBy(DB::raw('RAND()'))
            // ->where('area10', '=', 1)
            ->limit(3)
            ->get();

            foreach(${'pos' . $i} as $post){
                $post->image = $post->thumbnail('small', 'image');
                $post->link = '/post' . $post->id;
            }
        }
        $position = 2;

        $mainnews = Item::latest()
        // ->where('area9', '=', 1)
        ->where('position', '=', 2)
        ->limit(2)
        ->get();
        $lastop = 0;
        foreach($mainnews as $post){
            $post->link = '/post' . $post->id;

            $lastop =  $post->id;
        }
        
        return view('pages.index', compact('pos0', 
        'pos1', 'pos2', 'pos3', 'pos4', 'pos5', 'mainnews', 'position', 'lastop'));
    }

    
    public function oborona()
    {
        for($i = 0; $i <= 5; $i++){
            ${'pos' . $i} = Item::latest()
            ->where('position', '=', $i)
            ->orderBy(DB::raw('RAND()'))
            // ->where('area10', '=', 1)
            ->limit(3)
            ->get();

            foreach(${'pos' . $i} as $post){
                $post->image = $post->thumbnail('small', 'image');
                $post->link = '/post' . $post->id;
            }
        }
        $position = 3;

        $mainnews = Item::latest()
        // ->where('area9', '=', 1)
        ->where('position', '=', 3)
        ->limit(2)
        ->get();
        $lastop = 0;
        foreach($mainnews as $post){
            $post->link = '/post' . $post->id;

            $lastop =  $post->id;
        }
        
        return view('pages.index', compact('pos0', 
        'pos1', 'pos2', 'pos3', 'pos4', 'pos5', 'mainnews', 'position', 'lastop'));
    }

    public function zdorovie()
    {
        for($i = 0; $i <= 5; $i++){
            ${'pos' . $i} = Item::latest()
            ->where('position', '=', $i)
            ->orderBy(DB::raw('RAND()'))
            // ->where('area10', '=', 1)
            ->limit(3)
            ->get();

            foreach(${'pos' . $i} as $post){
                $post->image = $post->thumbnail('small', 'image');
                $post->link = '/post' . $post->id;
            }
        }
        $position = 4;

        $mainnews = Item::latest()
        // ->where('area9', '=', 1)
        ->where('position', '=', 4)
        ->limit(2)
        ->get();
        $lastop = 0;
        foreach($mainnews as $post){
            $post->link = '/post' . $post->id;

            $lastop =  $post->id;
        }
        
        return view('pages.index', compact('pos0', 
        'pos1', 'pos2', 'pos3', 'pos4', 'pos5', 'mainnews', 'position', 'lastop'));
    }

    public function kuhniy()
    {
        for($i = 0; $i <= 5; $i++){
            ${'pos' . $i} = Item::latest()
            ->where('position', '=', $i)
            ->orderBy(DB::raw('RAND()'))
            // ->where('area10', '=', 1)
            ->limit(3)
            ->get();

            foreach(${'pos' . $i} as $post){
                $post->image = $post->thumbnail('small', 'image');
                $post->link = '/post' . $post->id;
            }
        }
        $position = 5;

        $mainnews = Item::latest()
        // ->where('area9', '=', 1)
        ->where('position', '=', 5)
        // ->where('area10', '=', 1)
        ->limit(2)
        ->get();
        $lastop = 0;
        foreach($mainnews as $post){
            $post->link = '/post' . $post->id;

            $lastop =  $post->id;
        }
        
        return view('pages.index', compact('pos0', 
        'pos1', 'pos2', 'pos3', 'pos4', 'pos5', 'mainnews', 'position', 'lastop'));
    }

    public function teaserlink($teaser)
    {
        if($teaser->link != 0) {
            $link = Link::where('option', '=', $teaser->link)->latest()->first();
            if($link){
                $teaser->link = '/' .  $link->slug .  $link['utm'];
            } else {
                $teaser->link = '/post' . $teaser->id;
            }
        } else {
            $teaser->link = '/post' . $teaser->id;
        }

        return $teaser;

    }

    public function shou($id)
    {
        $solo = Item::find($id);

        if(!$solo){
            abort(404);
        }

        if($solo->position){
            $ops = $solo['position'];
        } else {
            $ops = 0;
        }

        if($solo->showt1){
            $teaser1 = Item::where('id', '=', $solo->teaser1)->where('position', '=', $ops)->first();

            if($teaser1){
                $teaser1 = $this->teaserlink($teaser1);
            }


        }
        if($solo->showt2){
            $teaser2 = Item::where('id', '=', $solo->teaser2)->where('position', '=', $ops)->first();

            if($teaser2){
                $teaser2 = $this->teaserlink($teaser2);
            }
        }
        if($solo->showt3){
            $teaser3 = Item::where('id', '=', $solo->teaser3)->where('position', '=', $ops)->first();

            if($teaser3){
                $teaser3 = $this->teaserlink($teaser3);
            }
        }


        $massarea = Item::where('position', '=', $ops)->orderBy(DB::raw('RAND()'))->get();

        foreach($massarea  as $post){
            if($post->link != 0) {
                $link = Link::where('option', '=', $post->link)->latest()->first();
                if($link){
                    $post->link = '/' .  $link->slug .  $link['utm'];
                } else {
                    $post->link = '/post' . $post->id;
                }
            } else {
                $post->link = '/post' . $post->id;
            }
        }

        $area2 = $massarea->slice(0,3);
        $area3 = $massarea->slice(3,3);
        $area4 = $massarea->slice(6,5);
        $area5 = $massarea->slice(11,2);
        $area6 = $massarea->slice(13,5);
        $area7 = $massarea->slice(18,3);
        $area8 = $massarea->slice(21,3);



        return view('pages.solo', compact('solo', 
        'teaser1', 'teaser2', 'teaser3', 
        'area2', 'area3', 'area4', 'area5', 'area6', 'area7', 'area8', 'area4', 'ops'));
    }

    public function article()
    {
        // sd
        return view('pages.article');
    }
}
