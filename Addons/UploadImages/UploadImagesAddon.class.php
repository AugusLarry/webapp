<?php

namespace Addons\UploadImages;
use Common\Controller\Addon;

/**
 * 多图上传插件
 * @author larry
 */

class UploadImagesAddon extends Addon{

    public $info = array(
        'name'=>'UploadImages',
        'title'=>'多图上传',
        'description'=>'多图上传插件',
        'status'=>1,
        'author'=>'larry',
        'version'=>'0.1'
    );

    /**
     * 安装的时候需要新建一个图片集模型
     * @return bool
     */
    public function install(){
        $model = D();
        $db_prefix = C('DB_PREFIX');
        //模型类别表
        $model_table_name = "{$db_prefix}model";
        $sql =<<<MODEL
INSERT INTO `$model_table_name` (`name`, `title`, `extend`, `need_pk`, `list_row`, `create_time`, `update_time`, `status`, `engine_type`) VALUES ('gallery', '图片集', 1, 1, 10, unix_timestamp(now()), unix_timestamp(now()), 1, 'MyISAM');
MODEL;
        $model->execute($sql);
        $model_id = $model->getLastInsID();
        //字段属性表
        $attr_table_name = "{$db_prefix}attribute";
        $sql =<<<ATTR
INSERT INTO `$attr_table_name` (
`name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_time`, `validate_type`, `auto_time`, `auto_type`
) VALUES (
'gallery', '图片集', 'varchar(255) NOT NUL', 'gallery', '', 'json格式的图片路径集合', 1, '', $model_id, 0, 1, unix_timestamp(now()), unix_timestamp(now()), 3, 'regex', 3, 'function'
), (
'content', '图片内容', 'text NOT NULL', 'editor', '', '图片内容', 1, '', $model_id, 0, 1, unix_timestamp(now()), unix_timestamp(now()), 3, 'regex', 3, 'function'
), (
'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL', 'select', 0, '', 1, '0:html1:ubb2:markdown', $model_id, 0, 1, unix_timestamp(now()), unix_timestamp(now()), 3, 'regex', 3, 'function'
);
ATTR;
        $model->execute($sql);
        //扩展模型表
        $extend_table_name = "{$db_prefix}document_gallery";
        $sql =<<<EXTEND
CREATE TABLE IF NOT EXISTS `$extend_table_name` (
`id` INT(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`gallery` VARCHAR(255) NOT NULL COMMENT '图片集合',
`content` text NOT NULL COMMENT '图片内容',
`parse` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '内容解析类型',
PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT '文档模型图片集表';
EXTEND;
        $model->execute($sql);//执行sql语句
        return true;
    }

    /**
     * 卸载的时候需要删除图片集模型
     * @return bool
     */
    public function uninstall(){
        $model = D();
        $db_prefix = C('DB_PREFIX');
        $extend_table_name = "{$db_prefix}document_gallery";
        //获取model_id
        $model_id = M("Model")->where(['name' => "gallery"])->getField("id");
        //删除字段属性数据
        M('Attribute')->where(['model_id'=>$model_id])->delete();
        //删除模型数据
        M('Model')->delete($model_id);
        //删除扩展模型表
        $sql = "DROP TABLE IF EXISTS `" . $extend_table_name . "`;";
        $model->execute($sql);
        return true;
    }

    //实现的UploadImagesForm钩子方法
    public function UploadImagesForm($param){
        $this->assign('addons_data', $param);
        $this->assign('addons_config', $this->getConfig());
        $this->display('content');
    }

}