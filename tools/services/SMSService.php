<?php

namespace tools\services;

/**
 * 短信服务
 * Class SMSService
 * @package tools\services
 */
class SMSService
{
    // 短信账号
    private static $SMSAccount;
    // 短信token
    private static $SMSToken;

    public static $status;

    // 短信请求地址
    private static $SMSUrl = 'http://api.sms.cn/sms/?';

    //短信支付回调地址
    private static $payNotify;

    private static $publictemp = '[{"id":8,"templateid":"----","title":"通用验证码","content":"【趣来优购】您的验证码是：{$code}，有效期为1分钟。如非本人操作，可不用理会。","status":1,"type":1,"dataformat":2,"is_have":0},{"id":113,"templateid":"----","title":"支付成功提醒","content":"【趣来优购】您购买的商品已支付成功，支付金额{$pay_price}元，订单号{$order_id},感谢您的光临！","status":1,"type":2,"dataformat":2,"is_have":0},{"id":114,"templateid":"----","title":"发货提醒","content":"【趣来优购】亲爱的用户{$nickname}您的商品{$store_name}，订单号{$order_id}已发货，请注意查收","status":1,"type":2,"dataformat":2,"is_have":0},{"id":115,"templateid":"----","title":"确认收货提醒","content":"【趣来优购】亲，您的订单{$order_id},商品{$store_name}已确认收货,感谢您的光临！","status":1,"type":2,"dataformat":2,"is_have":0},{"id":116,"templateid":"----","title":"管理员下单提醒","content":"【趣来优购】{$admin_name}管理员，您有一笔已支付的订单待处理，订单号为{$order_id}！","status":1,"type":2,"dataformat":2,"is_have":0},{"id":117,"templateid":"----","title":"管理员支付成功通知","content":"【趣来优购】{$admin_name}管理员,您有一笔支付成功的订单待处理，订单号{$order_id}!","status":1,"type":2,"dataformat":2,"is_have":0},{"id":118,"templateid":"----","title":"管理员退款通知","content":"【趣来优购】{$admin_name}管理员,您有一笔退款订单待处理，订单号{$order_id}!","status":1,"type":2,"dataformat":2,"is_have":0},{"id":121,"templateid":"----","title":"管理员确认收货通知","content":"【趣来优购】{$admin_name}管理员,您有一笔订单已经确认收货，订单号{$order_id}!","status":1,"type":2,"dataformat":2,"is_have":0}]';

    const VERIFICATION_CODE = 100006;

    public function __construct()
    {
        self::$status = strlen(SystemConfigService::get('sms_account')) != 0 ?? false && strlen(SystemConfigService::get('sms_token')) != 0 ?? false;
    }

    private static function auto()
    {
        self::$SMSAccount = SystemConfigService::get('sms_account');
        self::$SMSToken = md5(SystemConfigService::get('sms_token') . self::$SMSAccount);
        self::$payNotify = SystemConfigService::get('site_url') . '/api/sms/pay/notify';
    }

    private static function getPublictemp()
    {
        $publictemp = json_decode(self::$publictemp, true);
        $siteName = SystemConfigService::get('site_name');
        if (!empty($siteName)) {
            foreach ($publictemp as &$v) {
                $v['content'] = str_replace("【趣来优购】", "【{$siteName}】", $v['content']);
            }
        }
        return $publictemp;
    }

    public static function getVerificationCode()
    {
        return SystemConfigService::get('sms_verification_code') ?: self::VERIFICATION_CODE;
    }


    /**
     * 短信注册
     * @param $account
     * @param $password
     * @param $url
     * @param $phone
     * @param $code
     * @param $sign
     * @return mixed
     */
    public static function register($account, $password, $url, $phone, $code, $sign)
    {
    }

    /**
     * 公共短信模板列表
     * @param array $data
     * @return mixed
     */
    public static function publictemp(array $data)
    {
        self::auto();
        $publictemp = self::getPublictemp();
        $data = [
            'status' => 200,
            'msg' => 'ok',
            'data' => ['count' => count($publictemp), 'data' => $publictemp]
        ];
        return $data;
    }

    /**
     * 公共短信模板添加
     * @param $id
     * @param $tempId
     * @return mixed
     */
    public static function use($id, $tempId)
    {
        self::auto();
        $publictemp = self::getPublictemp();
        $publictemp = array_column($publictemp, null, 'id');
        if (!($temp = $publictemp[$id] ?? false)) {
            return ['status' => 400, 'msg' => '当前模板不存在'];
        }
        $data['ac'] = 'template';
        $data['uid'] = self::$SMSAccount;
        $data['pwd'] = self::$SMSToken;
        $data['title'] = $temp['title'];
        $data['content'] = $temp['content'];
        $data['type'] = $temp['type'];
        $data['dataformat'] = $temp['dataformat'];
        $res = HttpService::postRequest(self::$SMSUrl, $data);
        $resData = json_decode($res, true);
        if (isset($resData['stat']) && $resData['stat'] == 100) {
            return ['status' => 200, 'msg' => $resData['message'] ?? '添加成功'];
        } else {
            return ['status' => 400, 'msg' => $resData['message'] ?? '添加失败'];
        }
    }

    /**
     * 发送短信
     * @param $phone
     * @param $template
     * @param array $param
     * @return array
     */
    public static function send($phone, $template, array $param)
    {
        self::auto();
        $key = "messagecode:{$phone}_{$template}:counts";
        $counts = cache($key);
        if ($counts > 10) {
            return ['status' => 400, 'msg' => '验证码发送超过每日限制条数'];
        }
        $data['ac'] = 'send';
        $data['uid'] = self::$SMSAccount;
        $data['pwd'] = self::$SMSToken;
        $data['mobile'] = $phone;
        $data['content'] = json_encode($param);
        $data['template'] = $template;
        $res = HttpService::postRequest(self::$SMSUrl, $data);
        $resData = json_decode($res, true);
        if (isset($resData['stat']) && $resData['stat'] == 100) {
            cache($key, $counts + 1, strtotime(date("Y-m-d 23:59:59", time())) - time());
            return ['status' => 200, 'msg' => $resData['message'] ?? '发送成功'];
        } else {
            return ['status' => 400, 'msg' => $resData['message'] ?? '发送失败'];
        }
    }

    /**
     * 账号信息
     * @return mixed
     */
    public static function count()
    {
    }

    /**
     * 支付套餐
     * @param $page
     * @param $limit
     * @return mixed
     */
    public static function meal($page, $limit)
    {
    }

    /**
     * 支付码
     * @param $payType
     * @param $mealId
     * @param $price
     * @param $attach
     * @return mixed
     */
    public static function pay($payType, $mealId, $price, $attach)
    {
    }

    /**
     * 申请模板消息
     * @param $title
     * @param $content
     * @param $type
     * @return mixed
     */
    public static function apply($title, $content, $type)
    {
        self::auto();
        $data['ac'] = 'template';
        $data['uid'] = self::$SMSAccount;
        $data['pwd'] = self::$SMSToken;
        $data['title'] = $title;
        $data['content'] = $content;
        $data['type'] = $type;
        $res = HttpService::postRequest(self::$SMSUrl, $data);
        $resData = json_decode($res, true);
        if (isset($resData['stat']) && $resData['stat'] == 100) {
            return ['status' => 200, 'msg' => $resData['message'] ?? '添加成功'];
        } else {
            return ['status' => 400, 'msg' => $resData['message'] ?? '添加失败'];
        }
    }

    /**
     * 短信模板列表
     * @param $data
     * @return mixed
     */
    public static function template($data)
    {
        self::auto();
        list($page, $limit, $status, $title) = [$data['page'], $data['limit'], $data['status'], $data['title']];
        $data['ac'] = 'templatequery';
        $data['format'] = 'json';
        $data['uid'] = self::$SMSAccount;
        $data['pwd'] = self::$SMSToken;
        $data['page'] = $page;
        $data['page_size'] = $limit;
        $res = HttpService::postRequest(self::$SMSUrl, $data);
        $resData = json_decode($res, true);
        if (isset($resData['stat']) && $resData['stat'] == 100) {
            if (isset($resData['values']) && is_array($resData['values']) && count($resData['values']) > 0) {
                foreach ($resData['values'] as $k => $v) {
                    if ((!empty($status) && $v['status'] != $status) || (!empty($title) && $v['title'] != $title)) {
                        unset($resData['values'][$k]);
                        continue;
                    }
                    $resData['values'][$k]['id'] = $k + 1;
                    $resData['values'][$k]['add_time'] = $v['addtime'];
                }
            }
            return [
                'status' => 200,
                'msg' => $resData['message'] ?? '获取成功',
                'data' => [
                    'count' => $resData['total'] ?? 0,
                    'data' => $resData['values'] ?? []
                ]
            ];
        } else {
            return ['status' => 400, 'msg' => $resData['message'] ?? '获取失败'];
        }
    }
}