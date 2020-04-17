<?php

namespace tools\services;

use tools\traits\LogicTrait;

/** 模版消息类
 * Class Template
 * @package tools\services
 */
class Template
{
    use LogicTrait;

    protected  $providers=[
        'routine_two'=>ProgramTemplateService::class,
    ];

}