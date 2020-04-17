<?php

namespace app\models\store;


use tools\basic\BaseModel;
use tools\traits\ModelTrait;

/**
 * TODO 优惠券Model
 * Class StoreCoupon
 * @package app\models\store
 */
class StoreCoupon extends BaseModel
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
    protected $name = 'store_coupon';

    use ModelTrait;
}