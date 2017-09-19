<?php
namespace app\admin\validate;

use think\Validate;

/**
 * 产品分类验证
 * Class Login
 * @package app\api\validate
 */
class Banner extends Validate {

    protected $rule = [
        //产品分类
        'banner_name' => 'require',
        'parent_id' => 'require',
        'id' => 'require',
        'page' => 'require',
        'limit' => 'require',
        'file' => 'require',

    ];

    protected $message = [
        'banner_name.require' => '标题不能为空',
        'parent_id.require' => '父级id 不能为空',
        'id.require' => 'id 不能为空',
        'page.require' => '页数不能为空',
        'limit.require' => '条数不能为空',
        'file.require' => '请上传图片',

    ];

    protected $scene = [
        'banner_add'   =>  ['banner_name','parent_id','file'],
        'category_update'   =>  ['category_name','id'],
        'category_list'   =>  ['page','limit'],
        'category_del'   =>  ['id'],
    ];
}