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
        $mainnews = Item::orderBy('id', 'DESC')->where('id', '<', $last)
            ->where('area2', '=', 1)
            ->where('position', '=', $position)
            ->limit(12)->get();

        foreach($mainnews as $post){
            $post->image = $post->thumbnail('cropped', 'image');
            $post->link = '/post' . $post->id;
        }

        return  response()->json($mainnews);
    }

    public function getposts($ops)
    {

        $posts =  Item::where('area2', '=', 0)
        ->orderBy(DB::raw('RAND()'))
        // ->where('position', '=', $ops)
        ->limit(11)->get();

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

    public function getRight()
    {
        for($i = 0; $i <= 5; $i++){

            ${'pos' . $i} = Item::latest()->where('position', '=', $i)
            ->where('area2', '=', 1)
            ->orderBy(DB::raw('RAND()'))->limit(3)->get();

            foreach(${'pos' . $i} as $post){
                $post->image = $post->thumbnail('small', 'image');
                $post->link = '/post' . $post->id;
            }

        }

        return array($pos0, $pos1, $pos2, $pos3, $pos4, $pos5);
    }

    public function getMainNews($position)
    {

        $mainnews = Item::where('position', '=', $position)->orderBy('id', 'DESC')
        ->where('area2', '=', 1)
        ->limit(2)->get();

        return $mainnews;
    }

    public function index()
    {

        $lastop = 0;
        $position = 0;

        $pos = $this->getRight();
        $mainnews = $this->getMainNews($position);

        foreach($mainnews as $post){
            $post->link = '/post' . $post->id;
            $lastop =  $post->id;
        }
        
        return view('pages.index', compact('pos', 'mainnews', 'position', 'lastop'));
    }

    public function politika()
    {
        $lastop = 0;
        $position = 1;

        $pos = $this->getRight();
        $mainnews = $this->getMainNews($position);

        foreach($mainnews as $post){
            $post->link = '/post' . $post->id;
            $lastop =  $post->id;
        }
        
        return view('pages.index', compact('pos', 'mainnews', 'position', 'lastop'));
    }

    public function novosti()
    {
        $lastop = 0;
        $position = 2;

        $pos = $this->getRight();
        $mainnews = $this->getMainNews($position);

        foreach($mainnews as $post){
            $post->link = '/post' . $post->id;
            $lastop =  $post->id;
        }
        
        return view('pages.index', compact('pos', 'mainnews', 'position', 'lastop'));
    }

    
    public function oborona()
    {
        $lastop = 0;
        $position = 3;

        $pos = $this->getRight();
        $mainnews = $this->getMainNews($position);

        foreach($mainnews as $post){
            $post->link = '/post' . $post->id;
            $lastop =  $post->id;
        }
        
        return view('pages.index', compact('pos', 'mainnews', 'position', 'lastop'));
    }

    public function zdorovie()
    {
        $lastop = 0;
        $position = 4;

        $pos = $this->getRight();
        $mainnews = $this->getMainNews($position);

        foreach($mainnews as $post){
            $post->link = '/post' . $post->id;
            $lastop =  $post->id;
        }
        
        return view('pages.index', compact('pos', 'mainnews', 'position', 'lastop'));
    }

    public function kuhniy()
    {
        $lastop = 0;
        $position = 5;

        $pos = $this->getRight();
        $mainnews = $this->getMainNews($position);

        foreach($mainnews as $post){
            $post->link = '/post' . $post->id;
            $lastop =  $post->id;
        }
        
        return view('pages.index', compact('pos', 'mainnews', 'position', 'lastop'));
    }

    public function teaserlink($teaser)
    {
        $lastop = 0;
        $position = 5;

        $pos = $this->getRight();
        $mainnews = $this->getMainNews($position);

        foreach($mainnews as $post){
            $post->link = '/post' . $post->id;
            $lastop =  $post->id;
        }
        
        return view('pages.index', compact('pos', 'mainnews', 'position', 'lastop'));

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

        $massarea = Item::where('area2', '=', 0)
        // where('position', '=', $ops)
        // ->where('area2', '=', 0)
        ->orderBy(DB::raw('RAND()'))->get();

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
        $area9 = $massarea->slice(24,3);

        $area8 = $this->slic($area8);
        $area7 = $this->slic($area7);
        $area6 = $this->slic($area6);
        $area5 = $this->slic($area5);
        

        


        return view('pages.solo', compact('solo', 
        'teaser1', 'teaser2', 'teaser3', 
        'area2', 'area3', 'area4', 'area5', 'area6', 'area7', 'area8', 'area4', 'area9', 'ops'));
    }

    public function slic($array)
    {
        foreach($array as $post)
        {
            $post->image = Voyager::image($post->thumbnail('cropped','image'));
        }

        return $array;

    }

    public function article()
    {
        // sd
        return view('pages.article');
    }
}
