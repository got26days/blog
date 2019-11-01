<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Resizable;
use Carbon\Carbon;
use App\Click;

class Item extends Model
{
     use Resizable;

     protected $fillable = [
          'firstdate',
          'seconddate',
          'id'
      ];


     public function clicks()
     {
         return $this->hasMany('App\Click');
     }

     function scopeGetClickAttribute($firstdate, $seconddate)
     {
          $clicks = Clicks::chank(200)->where('item_id', '=', $this->id)->where('created_at', '>=', $firstdate)
          ->where('created_at', '<=', $seconddate)->get();
          $collect = collect($clicks);
          $click  = $collect->sum('click');

          return $click;
     }

     public function scopeGetViewAttribute($firstdate, $seconddate)
     {
          $clicks = Clicks::chank(200)->where('item_id', '=', $this->id)->where('created_at', '>=', $firstdate)
          ->where('created_at', '<=', $seconddate)->get();
          $collect = collect($clicks);
          $click  = $collect->sum('view');

          return $click;
     }

     function scopeGetCtrAttribute($firstdate, $seconddate)
     {
          $clicks = $this->clicks->chunk(200)->where('created_at', '>=', $firstdate)
          ->where('created_at', '<=', $seconddate);

          $collect = collect($clicks);
            
          $click  = $collect->sum('click');
          $view =  $collect->sum('view');

          if($view == 0){
               $view = 1;
          }
          $result = floatval($click)/floatval($view);
          $result = number_format((float)$result * 100, 4, '.', '');
          return $result;
     }
}
