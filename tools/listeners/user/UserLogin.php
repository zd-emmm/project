<?php


namespace tools\listeners\user;


use tools\interfaces\ListenerInterface;

class UserLogin implements ListenerInterface
{
    /**
     * 用户成功登录后
     * @param $event
     */
    public function handle($event): void
    {
        [$user, $token] = $event;

    }
}