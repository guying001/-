<?php
/**
 * 产品类
 * Created by PhpStorm.
 * User: 小宝
 * Date: 2017年9月11日
 * Time: 14:40
 */
namespace app\admin\controller;

use think\Db;
use \app\common\controller\AdminBase;

class Specification extends AdminBase{

    //初始化
    public function _initialize(){
        parent::_initialize(); // TODO: Change the autogenerated stub
    }

    /**
     * 添加产品规格接口
     * 1、验证数据格式是否正确
     *  1.1 数据格式错误 返回提示
     * 2、获取管理员信息
     *  2.1 管理员信息不存在 返回提示
     * 3、检查用户权限
     *  3.1 没有权限直接返回提示
     * 4、是否有上级分类
     *  4.1 没有 默认为0
     * 5、入库
     * @param $spec_name   规格名称
     * @param $sort  排序
     */
    public function addSpec(){
        $data = $this->request->only(['spec_name','sort']);
        //验证空值
        $res_require = $this->validate($data,'Specification.spec_add');
        if($res_require !== true)
            return json(['data' =>[],'code' => '201','msg' => $res_require]);

        //校验当前账户是否有效
        if(!is_int(self::$res_key))
            return self::$res_key;

        //校验权限
        if(!is_bool(self::$res_auth))
            return self::$res_auth;


        Db::startTrans();
        //入库
        $data['creat_time']   = date('Y-m-d H:i:s',time());
        $data['admin_id']   = self::$admin_id;
        if($res = db('spec')->insert($data))
            return json(['data' => [],'code' => '200','msg' => '添加成功']);
        Db::rollback();
        return json(['data' => [],'code' => '201','msg' => '添加失败']);
    }

    /**
     * 修改产品规格接口
     * 1、接收商品id
     *  1.1 为空返回提示
     * 2、验证数据管理员权限
     *  2.1 返回提示
     * 3、验证数据是否存在
     *  3.1 不存在返回提示
     * 4、修改数据
     */
    public function updateSpec(){
        $data = $this->request->only(['spec_name', 'sort','id']);

        //验证空值
        $this_val = [
            'spec_name'      => $data['spec_name'],
            'id'         => $data['id'],
        ];
        $res_require = $this->validate($this_val,'Specification.spec_update');
        if($res_require !== true)
            return json(['data' =>[],'code' => '201','msg' => $res_require]);

        //校验当前账户是否有效
        if(!is_int(self::$res_key))
            return self::$res_key;

        //校验权限
        if(!is_bool(self::$res_auth))
            return self::$res_auth;

        //验证目标数据是否存在
        $res_v = db('spec')->field('id')->where('id',$data['id'])->find();
        if(!$res_v)
            return json(['data' =>[],'code' => '202','msg' => '数据不存在']);
        if(isset($data['sort'])) {
            $sort = $data['sort'];
        }else{
            $sort = '0';
        }

        //更新
        $temp['id']  = $data['id'];
        $value = [
            'spec_name'    => $data['spec_name'],
            'sort'         => $sort,
            'admin_id'        => self::$admin_id
        ];

        $res = db('spec')->where($temp)->update($value);
        if(!$res)
            return json(['data' => [],'code' => '201','msg' => '修改失败']);
        return json(['data' => [],'code' => '200','msg' => '修改成功']);
    }

    /**
     * 删除商品规格
     * 根据接收到的id  进行数据库数据的删除处理
     * 1、验证空值
     *  1.1 为空返回提示
     * 2、验证数据是否存在
     *  2.1 不存在返回提示
     * 3、执行删除
     */
    public function delSpec(){
        $data = $this->request->only(['id']);

        //验证空值
        $result = $this->validate($data,'Specification.spec_del');
        if($result!==true)
            return json(['data' => [],'code' => '201','msg' => $result]);

        //校验当前账户是否有效
        if(!is_int(self::$res_key))
            return self::$res_key;

        //校验权限
        if(!is_bool(self::$res_auth))
            return self::$res_auth;

        //遍历数组
        $id_array = explode(',',$data['id']);
        if(is_array($id_array)){
            foreach($id_array as $k=>$v){
                //删除
                $this_data = db('spec')->delete($v);
            }
        }
        if($this_data!=0)
            return json(['data' => [],'code' => '200','msg' => '删除成功']);
        return json(['data' => [],'code' => '202','msg' => '删除失败']);
    }

    /**
     * 产品规格列表
     * 根据分页的页数与条数获取数据库相应的数据返回
     */
    public function listSpec(){
        $data = $this->request->only(['page','limit']);

        //验证空值
        $result = $this->validate($data,'Specification.spec_list');
        if($result!==true)
            return json(['data' => [],'code' => '201','msg' => $result]);

        //校验当前账户是否有效
        if(!is_int(self::$res_key))
            return self::$res_key;

        //校验权限
        if(!is_bool(self::$res_auth))
            return self::$res_auth;

        //获取数据
        $temp['status']  = '1';
        $cate_data = db('spec')->where($temp)->order('id desc')->page($data['page'],$data['limit'])->select();
        if(empty($cate_data))
            return json(['data' => [],'code' => '201','msg' => '数据为空']);

        return json(['data' => $cate_data,'code' => '201','msg' => '获取成功']);
    }

}