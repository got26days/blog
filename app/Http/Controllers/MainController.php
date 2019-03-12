<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Item;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Facades\Voyager;

class MainController extends Controller
{

    public function getdata($option, $last)
    {
        if($last == 0){
            $mainnews = Item::orderBy('id', 'DESC')->where('position', '=', $option)->limit(12)->get();
        } else {
            $mainnews = Item::orderBy('id', 'DESC')->where('id', '<', $last)->where('position', '=', $option)->limit(12)->get();
        }

        foreach($mainnews as $post){
            $post->image = $post->thumbnail('small', 'image');
        }

        

        return  response()->json($mainnews);
    }

    public function getposts()
    {

        $posts =  Item::where('loader', '=', true)->orderBy(DB::raw('RAND()'))->limit(11)->get();

        foreach($posts as $post){
            $post->image = $post->thumbnail('small', 'image');
        }

        return  response()->json($posts);
    }

    public function index()
    {

        for($i = 0; $i <= 5; $i++){

            ${'pos' . $i} = Item::latest()->where('position', '=', $i)->orderBy(DB::raw('RAND()'))->limit(3)->get();

            foreach(${'pos' . $i} as $post){
                $post->image = $post->thumbnail('small', 'image');
            }

        }

        $option = 0;

        $mainnews = Item::latest()->where('position', '=', 0)->limit(2)->get();
        
        return view('pages.index', compact('pos0', 'pos1', 'pos2', 'pos3', 'pos4', 'pos5', 'mainnews', 'option'));
    }

    public function politika()
    {
        for($i = 0; $i <= 5; $i++){
            ${'pos' . $i} = Item::latest()
            ->where('position', '=', $i)
            ->orderBy(DB::raw('RAND()'))
            ->limit(2)
            ->get();

            foreach(${'pos' . $i} as $post){
                $post->image = $post->thumbnail('small', 'image');
            }
        }
        $option = 1;

        $mainnews = Item::latest()
        ->where('position', '=', 1)
        ->limit(2)
        ->get();
        
        return view('pages.index', compact('pos0', 
        'pos1', 'pos2', 'pos3', 'pos4', 'pos5', 'mainnews', 'option'));
    }

    public function novosti()
    {
        for($i = 0; $i <= 5; $i++){
            ${'pos' . $i} = Item::latest()
            ->where('position', '=', $i)
            ->orderBy(DB::raw('RAND()'))
            ->limit(2)
            ->get();

            foreach(${'pos' . $i} as $post){
                $post->image = $post->thumbnail('small', 'image');
            }
        }
        $option = 2;

        $mainnews = Item::latest()
        ->where('position', '=', 2)
        ->limit(2)
        ->get();
        
        return view('pages.index', compact('pos0', 
        'pos1', 'pos2', 'pos3', 'pos4', 'pos5', 'mainnews', 'option'));
    }

    
    public function oborona()
    {
        for($i = 0; $i <= 5; $i++){
            ${'pos' . $i} = Item::latest()
            ->where('position', '=', $i)
            ->orderBy(DB::raw('RAND()'))
            ->limit(2)
            ->get();

            foreach(${'pos' . $i} as $post){
                $post->image = $post->thumbnail('small', 'image');
            }
        }
        $option = 3;

        $mainnews = Item::latest()
        ->where('position', '=', 3)
        ->limit(2)
        ->get();
        
        return view('pages.index', compact('pos0', 
        'pos1', 'pos2', 'pos3', 'pos4', 'pos5', 'mainnews', 'option'));
    }

    public function zdorovie()
    {
        for($i = 0; $i <= 5; $i++){
            ${'pos' . $i} = Item::latest()
            ->where('position', '=', $i)
            ->orderBy(DB::raw('RAND()'))
            ->limit(2)
            ->get();

            foreach(${'pos' . $i} as $post){
                $post->image = $post->thumbnail('small', 'image');
            }
        }
        $option = 4;

        $mainnews = Item::latest()
        ->where('position', '=', 4)
        ->limit(2)
        ->get();
        
        return view('pages.index', compact('pos0', 
        'pos1', 'pos2', 'pos3', 'pos4', 'pos5', 'mainnews', 'option'));
    }

    public function kuhniy()
    {
        for($i = 0; $i <= 5; $i++){
            ${'pos' . $i} = Item::latest()
            ->where('position', '=', $i)
            ->orderBy(DB::raw('RAND()'))
            ->limit(2)
            ->get();

            foreach(${'pos' . $i} as $post){
                $post->image = $post->thumbnail('small', 'image');
            }
        }
        $option = 5;

        $mainnews = Item::latest()
        ->where('position', '=', 5)
        ->limit(2)
        ->get();
        
        return view('pages.index', compact('pos0', 
        'pos1', 'pos2', 'pos3', 'pos4', 'pos5', 'mainnews', 'option'));
    }

    public function shou($id)
    {
        $solo = Item::find($id);

        if(!$solo){
            abort(404);
        }

        $teaser1 = Item::where('id', '=', $solo->teaser1)->first();
        $teaser2 = Item::where('id', '=', $solo->teaser2)->first();
        $teaser3 = Item::where('id', '=', $solo->teaser3)->first();

        $area2 = Item::where('area2', '=', true)->orderBy(DB::raw('RAND()'))->limit(3)->get();
        $area3 = Item::where('area3', '=', true)->orderBy(DB::raw('RAND()'))->limit(3)->get();
        $area4 = Item::where('area4', '=', true)->orderBy(DB::raw('RAND()'))->limit(5)->get();
        $area5 = Item::where('area5', '=', true)->orderBy(DB::raw('RAND()'))->limit(2)->get();
        $area6 = Item::where('area6', '=', true)->orderBy(DB::raw('RAND()'))->limit(5)->get();
        $area7 = Item::where('area7', '=', true)->orderBy(DB::raw('RAND()'))->limit(3)->get();
        $area8 = Item::where('area8', '=', true)->orderBy(DB::raw('RAND()'))->limit(3)->get();


        return view('pages.solo', compact('solo', 
        'teaser1', 'teaser2', 'teaser3', 
        'area2', 'area3', 'area4', 'area5', 'area6', 'area7', 'area8', 'area4'));
    }

    public function article()
    {
        
        return view('pages.article');
    }
}
