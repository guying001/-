<?php
namespace app\api\validate;

use think\Validate;

/**
 * 微信接口验证
 * Class Wechat
 * @package app\api\validate
 */
class Wechat extends Validate {

    protected $rule = [
        'openid' => 'require',
        //微信红包
        'money_hb' => 'require|number|between:1,200',
        //微信转账
        'money_zh' => 'require|number|between:0.01,20000',

        //微信充值
        'money' => 'require|number|between:0.01,20000',

    ];

    protected $message = [

    ];

    protected $scene = [
        'sendHb'   =>  ['openid','money_hb'],
        'sendZH'   =>  ['openid','money_zh'],
        'payment'   =>  ['openid','money'],
    ];
}