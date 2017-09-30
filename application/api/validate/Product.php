<?php
namespace app\api\validate;

use think\Validate;

/**
 * 产品验证
 * Class Login
 * @package app\api\validate
 */
class Product extends Validate {

    protected $rule = [
        //产品分类
        'pro_name' => 'require',
        'cate_id' => 'require',
        'stock'   => 'require',
        'id' => 'require',
        'page' => 'require',
        'limit' => 'require',
        'parent_id' => 'require',

    ];

    protected $message = [
        'pro_name.require' => '商品名称不能为空',
        'cate_id.require' => '分类id 不能为空',
        'stock.require'  => '商品库存不能为空',
        'id.require' => 'id 不能为空',
        'page.require' => '页数不能为空',
        'limit.require' => '条数不能为空',
        'parent_id.require' => '父级id不能为空',

    ];

    protected $scene = [
        'product_add'   =>  ['pro_name','cate_id','stock'],
        'product_update'   =>  ['pro_name','cate_id','stock','id'],
        'product_list'   =>  ['page','limit'],
        'product_del'   =>  ['id'],
        'product_cate'   =>  ['parent_id'],
    ];
}