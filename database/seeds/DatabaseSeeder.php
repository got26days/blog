<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);

        $count = (int)$this->command->ask('Как много новостей создать?', 10);

        $this->command->info("Создание {$count} сообщений.");

        $news = factory(App\Item::class, $count)->create();

        $this->command->info('Новости созданы!');
    }
}
