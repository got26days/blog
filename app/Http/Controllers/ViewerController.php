<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Item;
use App\Click;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class ViewerController extends Controller
{
    public function index()
    {
        return view('pages.viewer');
    }

    public function getdata(Request $request)
    {
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

        if($request['area2'] != null){
            $items = $items->where('area2', $request['area2'])->all();
        }
        if($request['position'] != null){
            $items = $items->where('position', $request['position'])->all();
        }
        if($request['link'] != null){

            if($request['link'] == 0){
                $items = $items->where('link', '0')->all();
            } 

            if($request['link'] != 0){
                $items = $items->where('link', '!=', '0')->all();
            } 

            // $items = $items->where('position', $request['position'])->all();
        }

        if($request['sortkey']){
            $items = $items->sortByDesc($request['sortkey'])->values()->all();
        }
        

        return $items;
    }
}
