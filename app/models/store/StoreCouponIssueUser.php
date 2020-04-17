<?php

namespace app\models\store;


use tools\basic\BaseModel;
use tools\traits\ModelTrait;

/**
 * TODO 优惠券前台用户领取Model
 * Class StoreCouponIssueUser
 * @package app\models\store
 */
class StoreCouponIssueUser extends BaseModel
{
    /**
     * 模型名称
     * @var string
     */
    protected $name = 'store_coupon_issue_user';

    use ModelTrait;

    public static function addUserIssue($uid,$issue_coupon_id)
    {
        $add_time = time();
        return self::create(compact('uid','issue_coupon_id','add_time'));
    }
}