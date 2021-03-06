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

class Product extends AdminBase{

    //初始化
    public function _initialize(){
        parent::_initialize(); // TODO: Change the autogenerated stub
    }

    /**
     * 添加产品接口
     * 1、验证数据格式是否正确
     *  1.1 数据格式错误 返回提示
     * 2、获取管理员信息
     *  2.1 管理员信息不存在 返回提示
     * 3、检查用户权限
     *  3.1 没有权限直接返回提示
     * 4、是否有上级分类
     *  4.1 没有 默认为0
     * 5、入库
     * @param $pro_name   产品名称
     * @param $cate_id  分类id
     * @param $stock   产品库存
     * @param $market_price  商品市场价格
     * @param $price  商品实际价格
     * @param $spec_id  商品规格id
     * @param $sales   商品销量
     * @param $image   商品图片
     * @param  $content  商品详情
     * @param  $para    商品参数
     */
    public function addProduct(){
        $data = $this->request->only(['pro_name', 'cate_id','stock','market_price','price','spec_id','image','content','para']);

        //验证空值
        $this_val = [
            'pro_name'      => $data['pro_name'],
            'cate_id'       => $data['cate_id'],
            'stock'         => $data['stock'],
        ];
        $res_require = $this->validate($this_val,'Product.product_add');
        if($res_require !== true)
            return json(['data' =>[],'code' => '201','msg' => $res_require]);

        //校验当前账户是否有效
        if(!is_int(self::$res_key))
            return self::$res_key;

        //校验权限
        if(!is_bool(self::$res_auth))
            return self::$res_auth;

        //验证分类是否存在
        $res_p = db('category')->where('id', $data['cate_id'])->find();
            if (empty($res_p))
                return json(['data' => [], 'code' => '202', 'msg' => '所选分类不存在']);

        Db::startTrans();
        //入库
        $data['creat_time']   = date('Y-m-d H:i:s',time());
        $data['admin_id']   = self::$admin_id;
        if($res = db('product')->insert($data))
            return json(['data' => [],'code' => '200','msg' => '添加成功']);
        Db::rollback();
        return json(['data' => [],'code' => '201','msg' => '添加失败']);
    }

    /**
     * 修改产品接口
     * 1、接收商品id
     *  1.1 为空返回提示
     * 2、验证数据管理员权限
     *  2.1 返回提示
     * 3、验证数据是否存在
     *  3.1 不存在返回提示
     * 4、修改数据
     */
    public function updateProduct(){
        $data = $this->request->only(['pro_name', 'cate_id','stock','market_price','price','spec_id','image','content','para','id']);

        //验证空值
        $this_val = [
            'pro_name'      => $data['pro_name'],
            'cate_id'       => $data['cate_id'],
            'stock'         => $data['stock'],
            'id'         => $data['id'],
        ];
        $res_require = $this->validate($this_val,'Product.product_update');
        if($res_require !== true)
            return json(['data' =>[],'code' => '201','msg' => $res_require]);

        //校验当前账户是否有效
        if(!is_int(self::$res_key))
            return self::$res_key;

        //校验权限
        if(!is_bool(self::$res_auth))
            return self::$res_auth;

        //更新
        $temp['id']  = $data['id'];
        $value = [
            'pro_name'        => $data['pro_name'],
            'cate_id'         => $data['cate_id'],
            'stock'           => $data['stock'],
            'market_price'    => $data['market_price'],
            'price'           => $data['price'],
            'spec_id'         => $data['spec_id'],
            'image'           => $data['image'],
            'content'         => $data['content'],
            'para'            => $data['para'],
            'admin_id'        => self::$admin_id
        ];

        $res = db('product')->where($temp)->update($value);
        if(!$res)
            return json(['data' => [],'code' => '201','msg' => '修改失败']);
        return json(['data' => [],'code' => '200','msg' => '修改成功']);
    }

    /**
     * 删除商品
     * 根据接收到的id  进行数据库数据的删除处理
     * 1、验证空值
     *  1.1 为空返回提示
     * 2、验证数据是否存在
     *  2.1 不存在返回提示
     * 3、执行删除
     */
    public function delProduct(){
        $data = $this->request->only(['id']);

        //验证空值
        $result = $this->validate($data,'Product.product_del');
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
                $this_data = db('product')->delete($v);
            }
        }
        if($this_data!=0)
            return json(['data' => [],'code' => '200','msg' => '删除成功']);
        return json(['data' => [],'code' => '202','msg' => '删除失败']);
    }

    /**
     * 产品分类列表
     * 根据分页的页数与条数获取数据库相应的数据返回
     */
    public function listProduct(){
        $data = $this->request->only(['page','limit']);

        //验证空值
        $result = $this->validate($data,'Product.product_list');
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
        $cate_data = db('product')->where($temp)->order('id desc')->page($data['page'],$data['limit'])->select();
        if(empty($cate_data))
            return json(['data' => [],'code' => '201','msg' => '数据为空']);

        return json(['data' => $cate_data,'code' => '201','msg' => '获取成功']);
    }

}