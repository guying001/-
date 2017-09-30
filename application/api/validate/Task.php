<?php
namespace app\api\validate;

use think\Validate;

/**
 * 发布任务验证
 * Class Login
 * @package app\admin\validate
 */
class Task extends Validate {

    protected $rule = [
        //发布任务
        'type_id' => 'require',
        'reward_money' => 'require',
        'content'   => 'require',
        'order_id_data' => 'require',
        'task_id' => 'require',
        'stock' => 'require|number',
    ];

    protected $message = [
        'type_id.require' => '请选择任务类型',
        'task_id.require' => '任务编号为空',
        'reward_money.require' => '请输入任务佣金',
        'content.require'   => '请输入任务内容描述',
        'order_id_data.require' => '订单id为空',
        'stock.number' => '数据格式不正确',
    ];

    protected $scene = [
        'task'   =>  ['type_id','reward_money','content','stock'],
        'task_order'   =>  ['task_id','order_id_data'],
    ];
}