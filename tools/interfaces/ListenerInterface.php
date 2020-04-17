<?php


namespace tools\interfaces;


interface ListenerInterface
{
    public function handle($event): void;
}