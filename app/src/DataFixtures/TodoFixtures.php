<?php

namespace App\DataFixtures;

use App\Entity\Todo;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class TodoFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        $todo = new Todo();
        $todo->setTitle('First todo');
        $todo->setDone(false);
        $manager->persist($todo);

        $todo = new Todo();
        $todo->setTitle('Second todo');
        $todo->setDone(true);
        $manager->persist($todo);

        $manager->flush();
    }
}
