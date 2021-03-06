<?php
/**
 * 会员类
 * Created by PhpStorm.
 * User: 小宝
 * Date: 2017年9月11日
 * Time: 14:40
 */
namespace app\admin\controller;

use think\Db;
use \app\common\controller\AdminBase;

class User extends AdminBase{

    //初始化
    public function _initialize(){
        parent::_initialize(); // TODO: Change the autogenerated stub
    }

    /**
     * 添加会员接口
     * 1、验证数据格式是否正确
     *  1.1 数据格式错误 返回提示
     * 2、获取管理员信息
     *  2.1 管理员信息不存在 返回提示
     * 3、检查用户权限
     *  3.1 没有权限直接返回提示
     * 4、验证确认密码与密码是否一致
     *  4.1 不一致返回提示
     * 5、邮箱是否已被注册
     *  5.1 有 返回提示
     * 6、入库
     * @param $email   邮箱 即  用户账号
     * @param $name  用户名称
     * @param $password   用户密码
     * @param $repassword  确认密码
     */
    public function addUser(){
        $data = $this->request->only([ 'email','name','password','repassword']);

        //验证空值
        $res_require = $this->validate($data,'User.user_add');
        if($res_require !== true)
            return json(['data' =>[],'code' => '201','msg' => $res_require]);

        //校验当前账户是否有效
        if(!is_int(self::$res_key))
            return self::$res_key;

        //校验权限
        if(!is_bool(self::$res_auth))
            return self::$res_auth;

        //验证密码与确认密码是否一致
        if($data['repassword'] !== $data['password'])
            return json(['data' =>[],'code' => '202','msg' => '确认密码与密码不一致']);

        //验证用户账号即邮箱是否存在
        $res_email = db('user_info')->where('email',$data['email'])->find();
        if($res_email)
            return json(['data' =>[],'code' => '203','msg' => '此邮箱已注册过']);

        //处理密码  (md5加密)
        $data['password'] = md5($data['password']);


        Db::startTrans();
        //入库
        $data['creat_time']   = date('Y-m-d H:i:s',time());
        $data['admin_id']   = self::$admin_id;
        $data['ip'] = $this->request->ip();

        //筛选去除repassword
        unset($data['repassword']);

        if($res = db('user_info')->insert($data))
            return json(['data' => [],'code' => '200','msg' => '添加成功']);
        Db::rollback();
        return json(['data' => [],'code' => '201','msg' => '添加失败']);
    }

    /**
     * 修改用户信息接口
     * 1、接收用户id
     *  1.1 为空返回提示
     * 2、验证数据管理员权限
     *  2.1 返回提示
     * 3、验证数据是否存在
     *  3.1 不存在返回提示
     * 4、验证修改后的邮箱是否存在
     *  4.1 存在返回提示
     *
     * 4、修改数据
     */
    public function updateUser(){
        $data = $this->request->only(['email', 'name','city','sex','id']);

        //验证空值
        $res_require = $this->validate($data,'User.user_update');
        if($res_require !== true)
            return json(['data' =>[],'code' => '201','msg' => $res_require]);

        //校验当前账户是否有效
        if(!is_int(self::$res_key))
            return self::$res_key;

        //校验权限
        if(!is_bool(self::$res_auth))
            return self::$res_auth;

        //验证用户账号即邮箱是否存在
        $res_email = db('user_info')->where('email',$data['email'])->find();
        if($res_email)
            return json(['data' =>[],'code' => '203','msg' => '此邮箱已被注册']);

        //更新
        $temp['id']  = $data['id'];
        $data['admin_id'] = self::$admin_id;
        $data['update_time'] = date('Y-m-d H:i:s',time());
        $data['ip'] = $this->request->ip();
        $res = db('user_info')->where($temp)->update($data);
        if(!$res)
            return json(['data' => [],'code' => '201','msg' => '修改失败']);
        return json(['data' => [],'code' => '200','msg' => '修改成功']);
    }

    /**
     * 删除用户
     * 根据接收到的id  进行数据库数据的删除处理
     * 1、验证空值
     *  1.1 为空返回提示
     * 2、验证数据是否存在
     *  2.1 不存在返回提示
     * 3、执行删除
     */
    public function delUser(){
        $data = $this->request->only(['id']);

        //验证空值
        $result = $this->validate($data,'User.user_del');
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
                $this_data = db('user_info')->delete($v);
            }
        }
        if($this_data!=0)
            return json(['data' => [],'code' => '200','msg' => '删除成功']);
        return json(['data' => [],'code' => '202','msg' => '删除失败']);
    }

    /**
     * 用户列表
     * 根据分页的页数与条数获取数据库相应的数据返回
     */
    public function listUser(){
        $data = $this->request->only(['page','limit','start_time','end_time','username']);

        //验证空值
        $result = $this->validate($data,'User.user_list');
        if($result!==true)
            return json(['data' => [],'code' => '201','msg' => $result]);

        //校验当前账户是否有效
        if(!is_int(self::$res_key))
            return self::$res_key;

        //校验权限
        if(!is_bool(self::$res_auth))
            return self::$res_auth;

        //关键字不为空
        if(!empty($data['username']))
            $temp['name'] =['like', '%'.$data['username'].'%'];

        //时间不为空
        if(!empty($data['start_time']) && !empty($data['end_time']))
            $temp['creat_time'] = [
              ['>=',$data['start_time']],
              ['<=',$data['end_time']],
            ];
        if(!empty($data['start_time']) && empty($data['end_time']))
            $temp['creat_time'] = [
                '>=',$data['start_time'],
            ];
        if(empty($data['start_time']) && !empty($data['end_time']))
            $temp['creat_time'] = [
                '<=',$data['end_time'],
            ];

        //状态  未停用 未删除
        $temp['status'] = 1;
        $temp['active'] = 1;

        $cate_data = db('user_info')->where($temp)->order('id desc')->page($data['page'],$data['limit'])->select();
        if(empty($cate_data))
            return json(['data' => [],'code' => '201','msg' => '数据为空']);

        return json(['data' => $cate_data,'code' => '201','msg' => '获取成功']);
    }

    /**
     * 查看用户详情接口
     * 单独点击用户  查看详情
     */
    public function showUserInfo(){
        $data = $this->request->only(['id']);

        //验证空值
        $res = $this->validate($data,'User.user_show');
        if($res !== true)
            return json(['data' => '','code' => '201','msg' => $res]);

        //校验当前账户是否有效
        if(!is_int(self::$res_key))
            return self::$res_key;

        //校验权限
        if(!is_bool(self::$res_auth))
            return self::$res_auth;

        //验证用户是否存在
        $res_id = db('user_info')->where('id',$data['id'])->find();
        if(!$res_id)
            return json(['data' =>[],'code' => '202','msg' => '用户不存在']);

        return json(['data' =>$res_id,'code' => '200','msg' => '查看成功']);
    }

    /**
     * 停用用户操作接口
     * 管理员点击用户停用操作
     * 接收用户id ->修改状态 设置为停用状态
     * @param $id 用户id
     */
    public function disabledUser(){
        $data = $this->request->only(['id']);

        //验证空值
        $res = $this->validate($data,'User.user_dias');
        if($res !== true)
            return json(['data' => '' ,'code' => '201', 'msg' => $res]);

        //校验当前账户是否有效
        if(!is_int(self::$res_key))
            return self::$res_key;

        //校验权限
        if(!is_bool(self::$res_auth))
            return self::$res_auth;

        //验证用户是否存在
        $res_id = db('user_info')->where('id',$data['id'])->find();
        if(!$res_id)
            return json(['data' =>[],'code' => '202','msg' => '用户不存在']);

        Db::startTrans();

        //停用操作
        $temp['id'] = $data['id'];
        $res = db('user_info')->where($temp)->setField('active','2');

        if($res==0) {
            Db::rollback();
            return json(['data' => [], 'code' => '203', 'msg' => '操作失败']);
        }else{
            return json(['data' =>[],'code' => '200','msg' => '操作成功']);
        }
    }

    /**
     * 修改用户密码
     * 1、接收用户id
     *  1.1 验证空值 返回提示
     * 2、验证原密码是否正确
     *  2.1 错误反回提示
     * 3、新密码与原密码是否相同
     *  3.1 相同返回提示不做修改
     * 4、新的确认密码与新密码是否相同
     *  4.1不相同返回提示
     * 5、修改密码
     * @param $id   用户id  string
     * @param $password  原密码
     * @param $newpassword  新密码
     * @param $repassword  确认密码
     */
    public function updateUserPassword(){
        $data = $this->request->only(['id','password','newpassword','repassword']);

        //验证空值
        $res = $this->validate($data,'User.user_updatePass');
        if($res !== true)
            return json(['data' => '','code' => '201','msg' => $res]);

        //校验当前账户是否有效
        if(!is_int(self::$res_key))
            return self::$res_key;

        //校验权限
        if(!is_bool(self::$res_auth))
            return self::$res_auth;

        //验证原密码是否正确
        $user_oldpass = db('user_info')->where('id',$data['id'])->value('password');
        if(md5($data['password']) != $user_oldpass)
            return json(['data' => '','code' => '202','msg' => '原密码错误']);

        //验证新的确认密码是否正确
        if($data['repassword'] !== $data['newpassword'])
            return json(['data' =>[],'code' => '202','msg' => '确认密码与密码不一致']);

        //验证新密码是否与原密码相同
        if($data['newpassword'] == $data['password'])
            return json(['data' =>[],'code' => '203','msg' => '新密码与原密码相同']);

        Db::startTrans();
        //修改密码
        $res_up = db('user_info')->where('id',$data['id'])->setField('password',md5($data['newpassword']));
        if($res_up==0) {
            Db::rollback();
            return json(['data' => '', 'code' => '204', 'msg' => '修改失败']);
        }else{
            return json(['data' => '','code' => '200' ,'msg' => '修改成功']);
        }
    }


}