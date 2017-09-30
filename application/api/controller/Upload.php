<?php
namespace app\admin\controller;

use think\Controller;

class Upload extends Controller {
    protected function _initialize() {
        parent::_initialize();
    }

    /**
     * 上传一张图片
     * @param string $file 文件域name
     * @param string $size 文件大小 post null 1024
     * @param string $ext 文件后缀 post null jpg,png,gif
     * @param string $type 文件类型 post null wx
     * @return json
     */
    public function upload() {


        $file = $this->request->file('file');
        $size = input('size',2048000);
        $ext = input('ext','jpg,jpeg,png,bmp');
        $type = input('type','wx');
        $info = $file->validate(['size'=>$size,'ext'=>$ext])->move(ROOT_PATH . 'public' . DS . 'uploads' . DS .$type);

        if ($info) {
            $result = [
                'code' => 200,
                'msg'  => '上传成功',
                'data' => [
                    'src'   => '/public/uploads/admin/' . str_replace('\\', '/', $info->getSaveName()),
                    'title' => ''
                ]
            ];
        } else {
            $result = [
                'code' => 201,
                'msg'  => $file->getError()
            ];
        }

        return json($result);
    }

    /**
     * 上传图集
     * @param file $file 文件域name
     * @param string $size 文件大小 post null 1024
     * @param string $ext 文件后缀 post null jpg,png,gif
     * @param string $type 文件类型 post null wx
     * @return json
     */
    public function uploadPhoto() {
        $files  = request()->file('photo');
        $size = input('size',1024);
        $ext = input('ext','jpg,png,gif');
        $type = input('type','wx');
        $result = [];
        foreach ($files as $file) {
            $info = $file->validate(['size'=>$size,'ext'=>$ext])->move(ROOT_PATH . 'public' . DS . 'uploads' . DS .$type);
            if ($info) {
                $result[] = [
                    'code' => 0,
                    'msg'  => '上传成功',
                    'data' => [
                        'filename' => '/public/uploads/admin/' . str_replace('\\', '/', $info->getSaveName()),
                        'title'    => ''
                    ]
                ];
            } else {
                $result[] = [
                    'code' => -1,
                    'msg'  => $file->getError()
                ];
            }
        }

        return json($result);
    }
}