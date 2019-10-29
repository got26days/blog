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

            $item->click = $item->scopeGetClickAttribute($firstdate, $seconddate);
            $item->view =  $item->scopeGetViewAttribute($firstdate, $seconddate);
            $item->ctr = $item->scopeGetCtrAttribute($firstdate, $seconddate);

        }
        $items = collect($items);

        $items = $items->sortByDesc('ctr')->values();

        return $items;
    }
}
