<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Item;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Facades\Voyager;
use App\Link;
use Illuminate\Support\Facades\Route;
use Session;
use Illuminate\Support\Str;
use App\Key;
use App\Utm;

class MainController extends Controller
{

    public function __construct()
    {
        if(!Session::get("utm_data.gid1")){
            session(["utm_data.gid1" => (string) Str::uuid()]);
        }

        $arrut = [];
        $modelUtms = Utm::latest()->get();
        foreach($modelUtms as $mutm){
            $arrut[] = $mutm->utm;
        }
        $this->utms = $arrut;

        // $strkey = Key::latest()->first();

        // if(!$strkey['var']){
        //     $strkey['var'] = 'keykeykey'; 
        // }

        // session(["utm_data.key" => $strkey['var']]);

    }

    public function test($id)
    {

  
        $ops = 2;
     

        $checkers = $this->checkUtm();
        $newstring = $this->getUtmFor($checkers);

        $posts =  Item::orderBy('result', 'desc')
        // ->where('position', '=', $ops)
        ->get();

        $solo = Item::find($id);

        foreach($posts as $key=>$post){

            if($key % 2 === 0){{
                $post->cols = true;
            }}

            $post->image = Voyager::image($post->thumbnail('cropped','image'));

            if($post->link != 0) {
                $link = Link::where('option', '=', $post->link)->latest()->first();
                if($link){

                    $ovgid5 = '&gid5=' . $link['option'];

                    $post->link = '/' .  $link->slug  . $newstring . 'gid2=' . $solo['id'] . '&gid3=' . $post['id'] .'&gid4=' . $post['position'] . $ovgid5. "&key=" . $link['utm'];
                } else {
                    $post->link = '/post' . $post->id . $newstring . 'gid2=' . $solo['id'] . '&gid3=' . $post['id'] .'&gid4=' . $post['position'];
                }
            } else {
                $post->link = '/post' . $post->id . $newstring . 'gid2=' . $solo['id'] . '&gid3=' . $post['id'] .'&gid4=' . $post['position'];
            }
        }

        return  response()->json($posts);


    }

    public function getdata($position, $last)
    {
        $checkers = $this->checkUtm();
        $newstring = $this->getUtmFor($checkers);

        $mainnews = Item::orderBy('id', 'DESC')->where('id', '<', $last)
            ->where('area2', '=', 1)
            ->where('position', '=', $position)
            ->limit(12)->get();

        foreach($mainnews as $post){
            $post->image = $post->thumbnail('cropped', 'image');
            $post->link = '/post' . $post->id . $newstring;
        }

        return  response()->json($mainnews);
    }

    public function getposts($ops, $id)
    {
        if($ops == null){
            $ops = 0;
        }

        $checkers = $this->checkUtm();
        $newstring = $this->getUtmFor($checkers);

        $posts =  Item::where('area2', '=', 0)
        ->orderBy(DB::raw('RAND()'))
        // ->where('position', '=', $ops)
        ->limit(11)->get();

        $solo = Item::find($id);

        foreach($posts as $key=>$post){

            if($key % 2 === 0){{
                $post->cols = true;
            }}

            $post->image = Voyager::image($post->thumbnail('cropped','image'));

            if($post->link != 0) {
                $link = Link::where('option', '=', $post->link)->latest()->first();
                if($link){

                    $ovgid5 = '&gid5=' . $link['option'];

                    $post->link = '/' .  $link->slug  . $newstring . 'gid2=' . $solo['id'] . '&gid3=' . $post['id'] .'&gid4=' . $post['position'] . $ovgid5. "&key=" . $link['utm'];
                } else {
                    $post->link = '/post' . $post->id . $newstring . 'gid2=' . $solo['id'] . '&gid3=' . $post['id'] .'&gid4=' . $post['position'];
                }
            } else {
                $post->link = '/post' . $post->id . $newstring . 'gid2=' . $solo['id'] . '&gid3=' . $post['id'] .'&gid4=' . $post['position'];
            }
        }

        return  response()->json($posts);
    }


    public function getRight($newstring)
    {
        
        for($i = 0; $i <= 5; $i++){

            ${'pos' . $i} = Item::latest()->where('position', '=', $i)
            ->where('area2', '=', 1)
            ->orderBy(DB::raw('RAND()'))->limit(3)->get();

            foreach(${'pos' . $i} as $post){
                $post->image = $post->thumbnail('small', 'image');
                $post->link = '/post' . $post->id . $newstring ;
            }

        }

        return array($pos0, $pos1, $pos2, $pos3, $pos4);
    }

    public function change()
    {
        Session::flush();
        session(['utm' => false]);


        $arrays = [
            "utm_source",
            "utm_tid",
            "utm_campaign",
            "utm_gid",
            "utm_content",
            "utm_catid",
            "utm_addphrase",
            "clickid",
            "cost",
            "age",
            "tid",
            "utm_content",
            "gender",
            "geo",
            "impression_hour",
            "user_timezone",
            "placement",
            "campid",
            "creative",
            "adg",
        ];

        // foreach($arrays as $row){
        //     $new = new Utm;
        //     $new->utm = $row;
        //     $new->save();
        // }


    }



    public function getMainNews($position)
    {
        $mainnews = Item::where('position', '=', $position)->orderBy('id', 'DESC')
        ->where('area2', '=', 1)
        ->limit(2)->get();

        return $mainnews;
    }

    private $utms;

    public function setUtm($request)
    {   
        foreach($this->utms as $utm){
            if(($utm == 'gid1') || ($utm == 'gid2') || ($utm == 'gid3') || ($utm == 'gid4') || ($utm == 'gid5') || ($utm == 'key')){

            } else {
                session(["utm_data.${utm}" => $request["${utm}"]]);
            }
        }
    }


    public function checkUtm()
    {


        $arrayUtm = [];
        foreach($this->utms as $utm){
            if(Session::get("utm_data.{$utm}")){
                $arrayUtm["{$utm}"] = Session::get("utm_data.{$utm}");
            } else {
                $arrayUtm["{$utm}"] = null;
            }
        }

        return $arrayUtm;
    }

    public function getUtmFor($checkers)
    {

        $string = '?';
        foreach($checkers as $val => $utm){
            if($utm === null) {

            } else {
                $string = $string . $val . '=' . $utm . '&';
            }
            
        }

        return $string;


    }

    public function index(Request $request)
    {
        $this->forget();

        $free = $this->setUtm($request);
        $checkers = $this->checkUtm();
        $newstring = $this->getUtmFor($checkers);
        
        $lastop = 0;
        $position = 0;

        $pos = $this->getRight($newstring);
        $mainnews = $this->getMainNews($position);

        foreach($mainnews as $post){
            $post->link = '/post' . $post->id . $newstring;
            $lastop =  $post->id;
        }
        
        return view('pages.index', compact('pos', 'mainnews', 'position', 'lastop', 'checkers'));
    }

    public function politika(Request $request)
    {
        $this->forget();

        $free = $this->setUtm($request);
        $checkers = $this->checkUtm();
        $newstring = $this->getUtmFor($checkers);

        $lastop = 0;
        $position = 1;

        $pos = $this->getRight($newstring);
        $mainnews = $this->getMainNews($position);

        foreach($mainnews as $post){
            $post->link = '/post' . $post->id . $newstring;
            $lastop =  $post->id;
        }
        
        return view('pages.index', compact('pos', 'mainnews', 'position', 'lastop', 'checkers'));
    }

    public function shoubiznes(Request $request)
    {
        $this->forget();

        $free = $this->setUtm($request);
        $checkers = $this->checkUtm();
        $newstring = $this->getUtmFor($checkers);

        $lastop = 0;
        $position = 2;

        $pos = $this->getRight($newstring);
        $mainnews = $this->getMainNews($position);

        foreach($mainnews as $post){
            $post->link = '/post' . $post->id . $newstring;
            $lastop =  $post->id;
        }
        
        return view('pages.index', compact('pos', 'mainnews', 'position', 'lastop', 'checkers'));
    }

    
    public function zdorove(Request $request)
    {
        $this->forget();

        $free = $this->setUtm($request);
        $checkers = $this->checkUtm();
        $newstring = $this->getUtmFor($checkers);

        $lastop = 0;
        $position = 3;

        $pos = $this->getRight($newstring);
        $mainnews = $this->getMainNews($position);

        foreach($mainnews as $post){
            $post->link = '/post' . $post->id . $newstring;
            $lastop =  $post->id;
        }
        
        return view('pages.index', compact('pos', 'mainnews', 'position', 'lastop', 'checkers'));
    }

    public function astrologiya(Request $request)
    {
        $this->forget();

        $free = $this->setUtm($request);
        $checkers = $this->checkUtm();
        $newstring = $this->getUtmFor($checkers);

        $lastop = 0;
        $position = 4;

        $pos = $this->getRight($newstring);
        $mainnews = $this->getMainNews($position);

        foreach($mainnews as $post){
            $post->link = '/post' . $post->id . $newstring;
            $lastop =  $post->id;
        }
        
        return view('pages.index', compact('pos', 'mainnews', 'position', 'lastop', 'checkers'));
    }


    public function forget()
    {
        session()->forget('utm_data.gid2');
        session()->forget('utm_data.gid3');
        session()->forget('utm_data.gid4');
        session()->forget('utm_data.gid5');
    }

    public function shou($id, Request $request)
    {


        $solo = Item::find($id);

        if($solo->click == null){
            $solo->click = 0;
        }

        if($solo->view == null){
            $solo->view = 0;
        }


        $solo->click = ++$solo->click;
        $solo->view = ++$solo->view;
        $str = $solo->click/$solo->view;
        $solo->result = round((float)$str * 100 );
        $solo->save();


        

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
        ->orderBy('market', 'desc')
        ->orderBy('result', 'desc')
        ->get();

        

        foreach($massarea  as $key=>$post){

            if($post->view == null){
                $post->view = 0;
            }

            $post->view = ++$post->view;
            $post->save();

            // colors
            if($key % 2 === 0){{
                $post->color = "backeven";
            }}

            $checkers = $this->checkUtm();
            $newstring = $this->getUtmFor($checkers);

            if($post->link != 0) {
                $link = Link::where('option', '=', $post->link)->latest()->first();
                if($link){

                    $ovgid5 = '&gid5=' . $link['option'];

                    $post->link = '/' .  $link->slug  . $newstring . 'gid2=' . $solo['id'] . '&gid3=' . $post['id'] .'&gid4=' . $post['position'] . $ovgid5 . "&key=" . $link['utm'];
                } else {
                    $post->link = '/post' . $post->id . $newstring . 'gid2=' . $solo['id'] . '&gid3=' . $post['id'] .'&gid4=' . $post['position'];
                }
            } else {
                $post->link = '/post' . $post->id . $newstring . 'gid2=' . $solo['id'] . '&gid3=' . $post['id'] .'&gid4=' . $post['position'];
            }


        }

        $key1 = 0;
        $key2 = 0;
        $key3 = 0;
        $key4 = 0;
        $key5 = 0;
        $key6 = 0;
        $key7 = 0;
        $key8 = 0;

        $area3 = $massarea->slice(0,3);

        if(!$area3->isEmpty())
     
            foreach($area3 as $key => $post){
                $post->link = $post->link . '&bid1=1' . '&bid2=' . ++$key1;
            }
    

        $area9 = $massarea->slice(3,3);

        if(!$area9->isEmpty()){

            foreach($area9 as $key => $post){
                $post->link = $post->link . '&bid1=2' . '&bid2=' . ++$key2;
            }
        }
     

        $area4 = $massarea->slice(6,5);

        if(!$area4->isEmpty()){

            foreach($area4 as $key => $post){
                $post->link = $post->link . '&bid1=3' . '&bid2=' . ++$key3;
            }
    
        }

        $area5 = $massarea->slice(11,2);

        if(!$area5->isEmpty()){
            foreach($area5 as $key => $post){
                $post->link = $post->link . '&bid1=4' . '&bid2=' . ++$key4;
            }
        }

        $area2 = $massarea->slice(13,3);

        if(!$area2->isEmpty()){

            foreach($area2 as $key => $post){
                $post->link = $post->link . '&bid1=5' . '&bid2=' . ++$key5;
            }
        }

        $area6 = $massarea->slice(16,5);

        if(!$area6->isEmpty()){
      
            foreach($area6 as $key => $post){
                $post->link = $post->link . '&bid1=6' . '&bid2=' . ++$key6;
            }
        }



        $area7 = $massarea->slice(21,3);

        if(!$area7->isEmpty()){

            foreach($area7 as $key => $post){
                $post->link = $post->link . '&bid1=7' . '&bid2=' . ++$key7;
            }    
        }


        $area8 = $massarea->slice(24,3);

        if(!$area8->isEmpty()){
  
            foreach($area8 as $key => $post){
                $post->link = $post->link . '&bid1=8' . '&bid2=' . ++$key8;
            }
        }


        $area8 = $this->slic($area8);
        $area7 = $this->slic($area7);
        $area6 = $this->slic($area6);
        $area5 = $this->slic($area5);
        


        return view('pages.solo', compact('solo', 
        'teaser1', 'teaser2', 'teaser3', 
        'area2', 'area3', 'area4', 'area5', 'area6', 'area7', 'area8', 'area4', 'area9', 'ops',
        'checkers'));
    }

    public function slic($array)
    {
        foreach($array as $post)
        {
            $post->image = $post->thumbnail('cropped','image');
        }

        return $array;

    }

}
