<?php

namespace App\DataFixtures;

use App\Entity\Todo;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class TodoFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        $faker = \Faker\Factory::create('fr_FR');

        for ($i = 0; $i < 10; $i++) {
            $todo = new Todo();
            $todo->setTitle($faker->sentence(3));
            $todo->setDone($faker->boolean);
            $manager->persist($todo);
        }

        $manager->flush();
    }
}