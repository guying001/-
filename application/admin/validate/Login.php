<?php
namespace app\admin\validate;

use think\Validate;

/**
 * 后台登录验证
 * Class Login
 * @package app\admin\validate
 */
class Login extends Validate {

    protected $rule = [
        //登录
        'username' => 'require',
        'password' => 'require',
        'verify'   => 'require|captcha',

        //验证码
        'fontsize'  => 'number',
        'length'   => 'number',
        'useNoise'   => 'boolean',
        'imageW'   => 'number',
        'imageH'   => 'number',
    ];

    protected $message = [
        'username.require' => '请输入用户名',
        'password.require' => '请输入密码',
        'verify.require'   => '请输入验证码',
        'verify.captcha'   => '验证码不正确'
    ];

    protected $scene = [
        'login'   =>  ['name','password','verify'],
        'verify'  =>  ['fontsize','length','useNoise','imageW','imageH'],
    ];
}