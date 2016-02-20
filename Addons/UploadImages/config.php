<?php
return array(
	'gallery_auto' => array(//配置在表单中的键名 ,这个会是config[random]
		'title' => '当文件被添加至上传队列时，是否自动上传:',//表单的文字
		'type' => 'radio',
		'options' => array(
			'true' => '开启',
			'false' => '关闭',
        ),
		'value' => 'false',//表单的默认值
    ),
	'gallery_buttonCursor' => [
		'title' => '鼠标经过上传按钮时，鼠标的形状:',
		'type' => 'radio',
		'options' => [
			'hand' => '手形',
			'arrow' => '箭头',
		],
		'value' => 'hand',
	],
	'gallery_fileSizeLimit' => [
		'title' => '上传文件大小限制:',
		'type' => 'text',
		'value' => '2MB',
		'tip' => '仅前端,允许使用 (B, KB, MB, 或 GB) 为单位,值为0时，表示不限制上传文件大小',
	],
	'gallery_height' => [
		'title' => '上传按钮的高度:',
		'type' => 'text',
		'value' => '30',
		'tip' => '单位：像素',
	],
	'gallery_width' => [
		'title' => '上传按钮的宽度:',
		'type' => 'text',
		'value' => '120',
		'tip' => '单位：像素',
	],
	'gallery_multi' => [
		'title' => '一次是否可以选中多个文件:',
		'type' => 'radio',
		'options' => [
			'true' => '是',
			'false' => '否',
		],
		'value' => 'true',
	],
	'gallery_progressData' => [
		'title' => '设置显示在上传进度条中的数据类型:',
		'type' => 'radio',
		'options' => [
			'percentage' => '百分比',
			'speed' => '速度',
		],
		'value' => 'speed',
	],
);
					