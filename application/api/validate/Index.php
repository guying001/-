<?php
namespace app\api\validate;

use think\Validate;

/**
 * 前端首页验证
 * Class Login
 * @package app\api\validate
 */
class Index extends Validate {

    protected $rule = [
        //前端首页
        'parent_id' => 'require',
    ];

    protected $message = [
        'parent_id.require' => '父级id 不能为空',
    ];

    protected $scene = [
        'index_banner'   =>  ['parent_id'],
    ];
}