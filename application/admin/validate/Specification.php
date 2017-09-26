<?php
namespace app\admin\validate;

use think\Validate;

/**
 * 产品规格验证
 * Class Login
 * @package app\api\validate
 */
class Specification extends Validate {

    protected $rule = [
        //产品规格
        'spec_name' => 'require',
        'cate_id' => 'require',
        'stock'   => 'require',
        'id' => 'require',
        'page' => 'require',
        'limit' => 'require',

    ];

    protected $message = [
        'spec_name.require' => '规格名称不能为空',
        'cate_id.require' => '分类id 不能为空',
        'stock.require'  => '商品库存不能为空',
        'id.require' => 'id 不能为空',
        'page.require' => '页数不能为空',
        'limit.require' => '条数不能为空',

    ];

    protected $scene = [
        'spec_add'   =>  ['spec_name'],
        'spec_update'   =>  ['spec_name','id'],
        'spec_list'   =>  ['page','limit'],
        'spec_del'   =>  ['id'],
    ];
}