<?php

namespace app\admin\model\system;

use tools\traits\ModelTrait;
use tools\basic\BaseModel;

/**
 * Class Express
 * @package app\admin\model\system
 */
class Express extends BaseModel
{

    /**
     * 数据表主键
     * @var string
     */
    protected $pk = 'id';

    /**
     * 模型名称
     * @var string
     */
    protected $name = 'express';

    use ModelTrait;

    public static function systemPage($params)
    {
        $model = new self;
        if($params['keyword'] !== '') $model = $model->where('name|code','LIKE',"%$params[keyword]%");
        $model = $model->order('sort DESC,id DESC');
        return self::page($model,$params);
    }
}