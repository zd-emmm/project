<?php

namespace app\admin\model\ump;

use tools\basic\BaseModel;
use tools\traits\ModelTrait;

class StoreCouponIssueUser extends BaseModel
{
    /**
     * 模型名称
     * @var string
     */
    protected $name = 'store_coupon_issue_user';

    use ModelTrait;

    public static function systemCouponIssuePage($issue_coupon_id)
    {
        $model = self::alias('A')->field('B.nickname,B.avatar,A.add_time')
        ->join('__user__ B','A.uid = B.uid')
        ->where('A.issue_coupon_id',$issue_coupon_id);
        return self::page($model,function($item){
            $item['add_time'] = $item['add_time'] == 0 ? '未知' : date('Y/m/d H:i',$item['add_time']);
            return $item;
        });
    }

}