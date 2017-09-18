<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017年8月30日
 * Time: 11:45
 */
namespace app\api\validate;

use think\Validate;

/*
        * 验证器规则
        */
class User extends Validate
{
    /*
     * 验证器规则
     * 1.openid不能为空
     * 2.headimgurl不能为空且只能为url格式
     * 3.name不能为空
     * 4.sex只能是数字且只能为1和2
     */
    protected $rule = [
        'openid' => 'require',
        'headimgurl' => 'require|url',
        'name' => 'require',
        'sex' => 'in:1,2|number',

    ];

    protected $message=[
        'openid.require'=>'请输入openid',
        'headimgurl.require'=>'请输入头像链接',
        'headimgurl.url'=>'头像链接必须为URL格式',
        'name.require'=>'请输入名称',
        'sex.in'=>'性别代码必须是1或者2',
        'sex.number'=>'性别代码必须是数字',
    ];
}