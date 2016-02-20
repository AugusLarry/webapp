<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Widget;
use Think\Controller;

/**
 * 分类widget
 * 用于动态调用分类信息
 */

class CategoryWidget extends Controller{
	
	/* 显示指定分类的同级分类或子分类列表 */
	public function lists($cate, $child = false){
		$field = 'id,name,pid,title,link_id';
		if($child){
			$category = D('Category')->getTree($cate, $field);
			$category = $category['_'];
		} else {
			$category = D('Category')->getSameLevel($cate, $field);
		}
		$this->assign('category', $category);
		$this->assign('current', $cate);
		$this->display('Category/lists');
	}

	/* 显示toolbar顶级分类 */
	public function toolbar() {
		$field = 'id,name,pid,title,link_id,icon,template_index';
		$category = D('Category')->getSameLevel(1, $field);
		$this->assign('category', $category);
		$this->display('Category/toolbar');
	}

	/* 显示二级分类 */
	public function secondcate() {
		$field = 'id,name,pid,title,link_id,icon,template_index,meta_title,description';
		//当前父分类id
		$cate = D("Category")->Info(I("get.category"), "id");
		//获取当前分类所有一层下级分类
		$category = D('Category')->getSonLevel($cate['id'], $field);
		$this->assign('category', $category);
		$this->display('Category/secondcate');
	}

	/* 疾病查询下级分类 */
	public function diseases() {
		$field = 'id,name,title,icon,template_index';
		//当前父分类id
		$cate = D("Category")->Info(I("get.category"), "id");
		//获取当前分类所有一层下级分类
		$category = D('Category')->getSonLevel($cate['id'], $field);
		$this->assign('category', $category);
		$this->display('Category/diseases');
	}

	/* 普通文章列表 */
	public function defalutlists(){
		$field = 'id,name,pid,title,link_id';
		//当前父分类id
		$cate = D("Category")->Info(I("get.category"), "id");
		//获取当前分类所有一层下级分类
		$category = D('Category')->getSonLevel($cate['id'], $field);
		$this->assign('category', $category);
		$this->display('Category/defalutlists');
	}

	/* 优惠活动文章列表 */
	public function activity(){
		$category = D("Category")->Info(I("get.category"));

		/* 获取当前分类列表 */
		$Document = D('Document');
		$list = $Document->page($p, $category['list_row'])->lists($category['id']);
		if(false === $list){
			$this->error('获取列表数据失败！');
		}

		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		$this->assign('list', $list);
		$this->display('Category/activity');
	}

	/* 知名专家文章列表 */
	public function expert() {
		$category = D("Category")->Info(I("get.category"));

		/* 获取当前分类列表 */
		$Document = D('Document');
		$list = $Document->page($p, $category['list_row'])->lists($category['id']);
		if(false === $list){
			$this->error('获取列表数据失败！');
		}

		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		$this->assign('list', $list);
		$this->display('Category/expert');
	}

	/* 慈善义诊文章列表 */
	public function clinic() {
		$category = D("Category")->Info(I("get.category"));

		/* 获取当前分类列表 */
		$Document = D('Document');
		$list = $Document->page($p, $category['list_row'])->lists($category['id']);
		if(false === $list){
			$this->error('获取列表数据失败！');
		}

		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		$this->assign('list', $list);
		$this->display('Category/clinic');
	}
}
