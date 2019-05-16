<?php

use Faker\Generator as Faker;

$factory->define(App\Item::class, function (Faker $faker) {

    $title = $faker->sentence;
    $slug = Str::slug($title);

    return [
        'title' => $title,
        'slug' => $slug,
        'image' => $faker->randomElement(['items/March2019/BMGrMjDf9IPWUzKjiEJY.jpg', 'items/March2019/SUpQvFPxIasSh5pSEWCX.jpg']),
        'link' => $faker->numberBetween(0,6),
        'position' => $faker->numberBetween(0,5),
        'body1' => $faker->paragraph(15),
        'body2' => $faker->paragraph(15),
        'body3' => $faker->paragraph(15),
        'teaser1' => function () {

            if(App\Item::inRandomOrder()->first()){
                return App\Item::inRandomOrder()->first()->id;
            } else {
                return 0;
            }

        },
        'teaser2' => function () {
            
            if(App\Item::inRandomOrder()->first()){
                return App\Item::inRandomOrder()->first()->id;
            } else {
                return 0;
            }
        },
        'teaser3' => function () {
            
            if(App\Item::inRandomOrder()->first()){
                return App\Item::inRandomOrder()->first()->id;
            } else {
                return 0;
            }
        },
        'showt1' => $faker->boolean(),
        'showt2' => $faker->boolean(),
        'showt3' => $faker->boolean(),
        'area2' => $faker->boolean(),
        'area3' => $faker->boolean(),
        'area4' => $faker->boolean(),
        'area5' => $faker->boolean(),
        'area6' => $faker->boolean(),
        'area7' => $faker->boolean(),
        'area8' => $faker->boolean(),
        'area9' => $faker->boolean(),
        'area10' => $faker->boolean(),
        'loader' => $faker->boolean(),


    ];
});
