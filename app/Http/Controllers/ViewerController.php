<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Item;
use App\Click;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Facades\Voyager;

class ViewerController extends Controller
{
    public function index()
    {
        if (Auth::check()) {
            return view('pages.viewer');
        } else {
            abort(404);
        }
        
    }

    public function getdata(Request $request)
    {

        if (Auth::check()) {
            // return view('pages.viewer');
        } else {
            abort(404);
        }

        $items = Item::with('clicks')->get();

        // $items = DB::table('items');



        if($request['firstdate']){
            $firstdate = Carbon::parse($request['firstdate'])->startOfDay();
        } else {
            $firstdate = Carbon::now()->startOfCentury()->startOfDay();
        }

        if($request['seconddate']){
            $seconddate = Carbon::parse($request['seconddate'])->endOfDay();
        } else {
            $seconddate = Carbon::now()->endOfDay();
        }


        foreach($items as $item){

            $item->image = Voyager::image($item->thumbnail('cropped','image'));

            $clicks = Click::where('item_id', '=', $item->id)->where('created_at', '>=', $firstdate)
            ->where('created_at', '<=', $seconddate)->get();
            
            $collect = collect($clicks);

            $item->super_click = $collect->sum('click');
            $item->super_view =  $collect->sum('view');
            
            $click  = $item->super_click;
            $view =  $item->super_view;
  
            if($view == 0){
                 $view = 1;
            }
            $result = floatval($click)/floatval($view);
            $result = number_format((float)$result * 100, 4, '.', '');
            
            $item->ctr = $result;

            if($item->market == null){
                $item->market = 0;
            }

        }

        $items = collect($items);

        if($request['idsearch'] != null){
            $items = $items->where('id', $request['idsearch']);
        }
        

        if($request['area2'] != null){
            $items = $items->where('area2', $request['area2']);
        }
        if($request['position'] != null){
            $items = $items->where('position', $request['position']);
        }
        if($request['link'] != null){

            if($request['link'] == 0){
                $items = $items->where('link', '0');
            } 

            if($request['link'] != 0){
                $items = $items->where('link', '!=', '0')->where('link', '!=', null)->where('another_site', '=', null);
            } 
        }

        if($request['sortkey']){
            if($request['sort'] == '1'){
                $items = $items->sortByDesc($request['sortkey']);
            } else {
                $items = $items->sortBy($request['sortkey']);
            }
            
        } else{
            $items = $items;
        }


        $items = $items->forPage($request['page'], $request['pagval'])->values()->all();
        

        return $items;
    }
}
