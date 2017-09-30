<?php
namespace app\admin\validate;

use think\Validate;

/**
 * 用户等级验证
 * Class Login
 * @package app\api\validate
 */
class Level extends Validate {

    protected $rule = [
        //用户等级
        'name' => 'require',
        'range_min' => 'require',
        'range_max'   => 'require',
        'id' => 'require',
        'page' => 'require',
        'limit' => 'require',

    ];

    protected $message = [
        'name.require' => '名称不能为空',
        'range_min.require' => '最小范围值不能为空',
        'range_max.require'  => '最大范围值不能为空',
        'id.require' => 'id 不能为空',
        'page.require' => '页数不能为空',
        'limit.require' => '条数不能为空',

    ];

    protected $scene = [
        'level_add'   =>  ['name','range_min','range_max'],
        'level_update'   =>  ['id','name','range_min','range_max'],
        'level_list'   =>  ['page','limit'],
        'level_del'   =>  ['id'],
    ];
}