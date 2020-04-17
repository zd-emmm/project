<?php

namespace app;

use tools\utils\Json;
use think\facade\Db;
use think\Service;

class AppService extends Service
{

    public $bind = [
        'json' => Json::class
    ];

    public function boot()
    {

    }
}
