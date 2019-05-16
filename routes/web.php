<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/prod2', 'DomainController@prod2');
// Route::get('/prod3', 'DomainController@prod3');
// Route::get('/prod4', 'DomainController@prod4');
// Route::get('/prod5', 'DomainController@prod5');
// Route::get('/prod6', 'DomainController@prod6');

// Route::get('/test{id}', 'MainController@test');


$domain = env('FIRST_DOMAIN');
$subdomain = env('SECOND_DOMAIN');

// Route::get('/', 'MainController@index')->name('manepage');

Route::domain(((env('APP_ENV') == 'production') ? 'newsinfotoday.org' : 'blog.test'))->group(function () {
    // Route::get('/change', 'MainController@change');

    Route::get('/', 'MainController@index')->name('manepage');
    Route::get('/backpage', 'MainController@backpage');
    Route::get('/politika', 'MainController@politika')->name('politika');;
    Route::get('/shou-biznes', 'MainController@shoubiznes')->name('shou-biznes');;
    Route::get('/zdorove', 'MainController@zdorove')->name('zdorove');;
    Route::get('/astrologiya', 'MainController@astrologiya')->name('astrologiya');;
    Route::get('/post{id}', 'MainController@shou')->name('post');
    Route::get('/article', 'MainController@article');
    
    Route::group(['prefix' => 'admin'], function () {
        Voyager::routes();
    });

 });

Route::domain(((env('APP_ENV') == 'production') ? 'news24hours.org' : 'blog.test'))->group(function () {
    Route::get('/{slug}', 'DomainController@prod1');
});

// news24hours.org
// ch43944.tmweb.ru
// http://newsinfotoday.org/


