<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class CategoriesTableSedder extends Seeder
{
    public function run(): void
    {
        $faker = Faker::create();
        for($i=0;$i<10;$i++){
            DB::table('categories')->insert([
                'name' =>$faker->word,
                'description' => $faker->sentence,
            ]);
        }
    }
}
