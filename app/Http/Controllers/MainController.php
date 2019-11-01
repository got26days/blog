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
use App\Click;
use Carbon\Carbon;

class MainController extends Controller
{

    public function prod7(Request $request)
    {
        
        $items = Item::whereDate('created_at', '<=', Carbon::now())->get();
        // return $items;
        return view('prod9.index');
    }

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

    }


    public function destpos()
    {
      
        $items = Click::truncate();
          
        $updatedData = [
            'result' => 0.0000, 'click' => 0, 'view' => 0
        ];
        $affected = DB::table('items')->update($updatedData);

        return back();
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

            if($post->link != '0') {
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

    // Запрос с главной страницы
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
            $post->link = '/short' . $post->id . $newstring;
        }

        return  response()->json($mainnews);
    }

    public function newview($post)
    {

        if($post->click == null){
            $post->click = 0;
        }

        if($post->view == null){
            $post->view = 0;
        }

        // $post->click = ++$post->click;
        $post->view = $post->view + 1;
        
        $str = floatval($post->click)/floatval($post->view);
        $post->result = number_format((float)$str * 100, 4, '.', '');
        $post->save();

        $super_click = Click::whereDate('created_at', Carbon::today())->where('item_id', '=', $post->id)->first();
        if(!$super_click){
            $super_click = new Click;
            $super_click->item_id = $post->id;
            $super_click->click = 0;
            $super_click->view = 1;
            $super_click->result = 77;
            $super_click->save();
        } else {
            $super_click->item_id = $post->id;
            $super_click->view = $super_click->view + 1;
            $super_click->click = $super_click->click;
            $super_click->result = 33333;
            $super_click->save();
        }

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
        
        $str = floatval($post->click)/floatval($post->view);
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



    public function getRight($newstring)
    { 

        $pos0 = Item::latest()->where('position', '=', '1')
        ->where('area2', '=', 1)
        ->orderBy(DB::raw('RAND()'))->limit(3)->get();

        foreach($pos0 as $post){
            $post->image = $post->thumbnail('small', 'image');
            $post->link = '/post' . $post->id . $newstring ;
        }

        $pos1 = Item::latest()->where('position', '=', '2')
        ->where('area2', '=', 1)
        ->orderBy(DB::raw('RAND()'))->limit(3)->get();

        foreach($pos1 as $post){
            $post->image = $post->thumbnail('small', 'image');
            $post->link = '/post' . $post->id . $newstring ;
        }

        $pos2 = Item::latest()->where('position', '=', '5')
        ->where('area2', '=', 1)
        ->orderBy(DB::raw('RAND()'))->limit(3)->get();

        foreach($pos2 as $post){
            $post->image = $post->thumbnail('small', 'image');
            $post->link = '/post' . $post->id . $newstring ;
        }

        return array($pos0, $pos1, $pos2);
    }

    public function backpage(Request $request)
    {

        $solo = Item::find($request['gid2']);

        if(!$solo){
            abort(404);
        }

        if($solo->position){
            $ops = $solo['position'];
        } else {
            $ops = 0;
        }

        $checkers = $this->checkUtm();


        return view('pages.backpage', compact('solo', 'ops', 'checkers'));
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
            $post->link = '/short' . $post->id . $newstring;
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


    public function proisshestviya(Request $request)
    {
        $this->forget();

        $free = $this->setUtm($request);
        $checkers = $this->checkUtm();
        $newstring = $this->getUtmFor($checkers);

        $lastop = 0;
        $position = 5;

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

        $free = $this->setUtm($request);
        $checkers = $this->checkUtm();
        $newstring = $this->getUtmFor($checkers);

        $solo = Item::find($id);
        if(!$solo){
            abort(404);
        }

        $this->newclick($solo);

        if($solo['market'] > 0){
            $solo->market = --$solo->market;
            $solo->save();
        }


        if($solo->position){
            $ops = $solo['position'];
        } else {
            $ops = 0;
        }
    

        $massarea = Item::where('area2', '=', 0)
        // ->where('area2', '=', 0)
        ->orderBy('market', 'desc')
        ->orderBy('result', 'desc')
        ->get();

        return $massarea;
        

        foreach($massarea  as $key=>$post){

            $this->newview($post);

            if($post['market'] > 0){
                $post->market = --$post->market;
                $post->save();
            }

            // colors
            if($key % 2 === 0){
                $post->color = "backeven";
            }

            $checkers = $this->checkUtm();
            $newstring = $this->getUtmFor($checkers);

            if($post->link != '0') {
                $link = Link::where('option', '=', $post->link)->latest()->first();
                if($link){

                    $ovgid5 = '&gid5=' . $link['option'];

                    $domain = env("SECOND_DOMAIN", "http://news24hours.org");

                    $post->link = $domain . '/' .  $link->slug  . $newstring . 'gid2=' . $solo['id'] . '&gid3=' . $post['id'] .'&gid4=' . $post['position'] . $ovgid5 . "&key=" . $link['utm'];
                } else {
                    $post->link = '/post' . $post->id . $newstring . 'gid2=' . $solo['id'] . '&gid3=' . $post['id'] .'&gid4=' . $post['position'];
                }
            } else {
                $post->link = '/post' . $post->id . $newstring . 'gid2=' . $solo['id'] . '&gid3=' . $post['id'] .'&gid4=' . $post['position'];
            }

            if($post->another_site != null) {
                $post->link = $post->another_site;
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
                if($post->another_site != null) {
                    $post->link = $post->another_site;
                }
            }
    

        $area9 = $massarea->slice(3,3);

        if(!$area9->isEmpty()){

            foreach($area9 as $key => $post){
                $post->link = $post->link . '&bid1=2' . '&bid2=' . ++$key2;
                if($post->another_site != null) {
                    $post->link = $post->another_site;
                }
            }
        }
     

        $area4 = $massarea->slice(6,5);

        if(!$area4->isEmpty()){

            foreach($area4 as $key => $post){
                $post->link = $post->link . '&bid1=3' . '&bid2=' . ++$key3;
                if($post->another_site != null) {
                    $post->link = $post->another_site;
                }
            }
    
        }

        $area5 = $massarea->slice(11,2);

        if(!$area5->isEmpty()){
            foreach($area5 as $key => $post){
                $post->link = $post->link . '&bid1=4' . '&bid2=' . ++$key4;
                if($post->another_site != null) {
                    $post->link = $post->another_site;
                }
            }
        }

        $area2 = $massarea->slice(13,3);

        if(!$area2->isEmpty()){

            foreach($area2 as $key => $post){
                $post->link = $post->link . '&bid1=5' . '&bid2=' . ++$key5;
                if($post->another_site != null) {
                    $post->link = $post->another_site;
                }
            }
        }

        $area6 = $massarea->slice(16,5);

        if(!$area6->isEmpty()){
      
            foreach($area6 as $key => $post){
                $post->link = $post->link . '&bid1=6' . '&bid2=' . ++$key6;
                if($post->another_site != null) {
                    $post->link = $post->another_site;
                }
            }
        }



        $area7 = $massarea->slice(21,3);

        if(!$area7->isEmpty()){

            foreach($area7 as $key => $post){
                $post->link = $post->link . '&bid1=7' . '&bid2=' . ++$key7;
                if($post->another_site != null) {
                    $post->link = $post->another_site;
                }
            }    
        }


        $area8 = $massarea->slice(24,3);

        if(!$area8->isEmpty()){
  
            foreach($area8 as $key => $post){
                $post->link = $post->link . '&bid1=8' . '&bid2=' . ++$key8;
                if($post->another_site != null) {
                    $post->link = $post->another_site;
                }
            }
        }


        $area8 = $this->slic($area8);
        $area7 = $this->slic($area7);
        $area6 = $this->slic($area6);
        $area5 = $this->slic($area5);
    
        // return $solo;

        return view('pages.solo', compact('solo', 
        'teaser1', 'teaser2', 'teaser3', 
        'area2', 'area3', 'area4', 'area5', 'area6', 'area7', 'area8', 'area4', 'area9',
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

    public function article($id, Request $request)
    {

        $free = $this->setUtm($request);
        $checkers = $this->checkUtm();
        $newstring = $this->getUtmFor($checkers);

        $solo = Item::find($id);
        $solo->link = '/post' . $solo->id . $newstring . '&gid3=' . $solo['id'] .'&gid4=' . $solo['position'];
   
        $this->newclick($solo);

        return view('pages.article', compact('solo', 'checkers'));
    }

    // запрос лоудера с самой новости
    public function getposts($id)
    {
        $checkers = $this->checkUtm();
        $newstring = $this->getUtmFor($checkers);

        $posts =  Item::where('area2', '=', 0)
        ->orderBy(DB::raw('RAND()'))
        ->limit(11)->get();

        $solo = Item::find($id);

        foreach($posts as $key=>$post){

            $this->newview($post);

            if($key % 2 === 0){{
                $post->cols = true;
            }}

            $post->image = Voyager::image($post->thumbnail('cropped','image'));

            if($post->link != '0') {
                $link = Link::where('option', '=', $post->link)->latest()->first();
                if($link){

                    $ovgid5 = '&gid5=' . $link['option'];

                    $domain = env("SECOND_DOMAIN", "http://news24hours.org");

                    $post->link = $domain . '/' .  $link->slug  . $newstring . 'gid2=' . $solo['id'] . '&gid3=' . $post['id'] .'&gid4=' . $post['position'] . $ovgid5. "&key=" . $link['utm'];
                } else {
                    $post->link = '/post' . $post->id . $newstring . 'gid2=' . $solo['id'] . '&gid3=' . $post['id'] .'&gid4=' . $post['position'];
                }
            } else {
                $post->link = '/post' . $post->id . $newstring . 'gid2=' . $solo['id'] . '&gid3=' . $post['id'] .'&gid4=' . $post['position'];
            }
            if($post->another_site != null) {
                $post->link = $post->another_site;
            }
        }

        foreach($posts as $key => $post){
            $post->link = $post->link . '&bid1=9';
            if($post->another_site != null) {
                $post->link = $post->another_site;
            }
        }

        return  response()->json($posts);
    }
    
    public function shortgetposts($id)
    {

        $checkers = $this->checkUtm();
        $newstring = $this->getUtmFor($checkers);

        $posts =  Item::where('area2', '=', 0)
        ->orderBy('market', 'desc')
        ->orderBy('result', 'desc')
        ->limit(16)->get();

        $solo = Item::find($id);

        foreach($posts as $key=>$post){

            $this->newview($post);

            if($key % 2 === 0){{
                $post->cols = true;
            }}

            $post->image = Voyager::image($post->thumbnail('cropped','image'));

            if($post->link != '0') {
                $link = Link::where('option', '=', $post->link)->latest()->first();
                if($link){

                    $ovgid5 = '&gid5=' . $link['option'];

                    $domain = env("SECOND_DOMAIN", "http://news24hours.org");

                    $post->link = $domain . '/' .  $link->slug  . $newstring . 'gid2=' . $solo['id'] . '&gid3=' . $post['id'] .'&gid4=' . $post['position'] . $ovgid5. "&key=" . $link['utm'];
                } else {
                    $post->link = '/post' . $post->id . $newstring . 'gid2=' . $solo['id'] . '&gid3=' . $post['id'] .'&gid4=' . $post['position'];
                }
            } else {
                $post->link = '/post' . $post->id . $newstring . 'gid2=' . $solo['id'] . '&gid3=' . $post['id'] .'&gid4=' . $post['position'];
            }
            if($post->another_site != null) {
                $post->link = $post->another_site;
            }
        }

        return  response()->json($posts);
    }

}
