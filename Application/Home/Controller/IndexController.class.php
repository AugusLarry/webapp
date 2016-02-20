<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use OT\DataDictionary;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends HomeController {

	//系统首页
    public function index(){

        $category = D('Category')->getTree();
        $lists    = D('Document')->lists(null);

        $this->assign('category',$category);//栏目
        $this->assign('lists',$lists);//列表
        $this->assign('page',D('Document')->page);//分页

                 
        $this->display();
    }

    //评论页
    public function comment(){
        $this->display();
    }

    //品牌历程
    public function history(){
        $content = D("DocumentArticle")->where(['id' => 10])->getField("content");
        $category = [
            'title' => '品牌历程',
            'description' => '',
            'content' => $content
        ];
        $this->assign('category',$category);
        $this->display();
    }

    //来院路线
    public function map(){
        $content = D("DocumentArticle")->where(['id' => 11])->getField("content");
        $category = [
            'title' => '来院路线',
            'description' => '',
            'content' => $content
        ];
        $this->assign('category',$category);
        $this->display();
    }

}