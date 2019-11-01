<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Item;
use App\Click;
use Carbon\Carbon;

class ViewerController extends Controller
{
    public function index()
    {
        return view('pages.viewer');
    }

    public function getdata(Request $request)
    {
        $items = Item::with('clicks')->get();
        

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

        $items = $items->sortByDesc(function($item) {
            return sprintf('%-12s%s', $item->market, $item->ctr);
        })->values()->all();

        return $items;
    }
}
