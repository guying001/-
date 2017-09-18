<?php
namespace app\admin\validate;

use think\Validate;

/**
 * 产品分类验证
 * Class Login
 * @package app\api\validate
 */
class Product extends Validate {

    protected $rule = [
        //产品分类
        'category_name' => 'require',
        'parent_id' => 'require',
        'id' => 'require',

    ];

    protected $message = [
        'category_name.require' => '分类名称不能为空',
        'parent_id.require' => '父级id 不能为空',
        'id.require' => 'id 不能为空',

    ];

    protected $scene = [
        'category_add'   =>  ['category_name','parent_id'],
        'category_update'   =>  ['category_name','id'],
    ];
}