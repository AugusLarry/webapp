<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

	<title><?php echo C('WEB_SITE_TITLE');?></title>
	<meta name="keywords" content="<?php echo C('WEB_SITE_KEYWORD');?>" />
	<meta name="description" content="<?php echo C('WEB_SITE_DESCRIPTION');?>" />

<link rel="stylesheet" href="/Public/static/framework7/css/framework7.ios.min.css">
<link rel="stylesheet" href="/Public/static/framework7/css/framework7.ios.colors.min.css">
<link rel="stylesheet" href="/Public/static/framework7/css/my-app.css">
<!-- 页面header钩子，一般用于加载插件CSS文件和代码 -->
<?php echo hook('pageHeader');?>
</head>
<!--IOS APP基本布局-->
<body>
<!--视图-->
<!--全屏化导航-->
<div class="statusbar-overlay"></div>
<!--面板覆盖-->
<div class="panel-overlay"></div>
<!--左侧导航面板-->
<div class="panel panel-left panel-reveal">
	<style>
	.thisnav ul {
		background-color: #2d2d2d;
	}
	.thisnav ul li div a {
		color: #ababab;
	}
	.logo {
		display: block;
		margin: 35px 0;
	}
	.logo img {
		display: block;
		max-width: 100%;
		margin: 0 auto;
	}
</style>
<a class="logo external panel-close" href="/">
	<img src="/Public/Home/images/logo.png" alt="">
</a>
<div class="list-block thisnav">
	<ul>
		<?php $__NAV__ = M('Channel')->field(true)->where("status=1")->order("sort")->select(); if(is_array($__NAV__)): $i = 0; $__LIST__ = $__NAV__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nav): $mod = ($i % 2 );++$i; if(($nav["pid"]) == "0"): ?><li class="item-content">
					<div class="item-inner">
						<div class="item-title"><a href="<?php echo (get_nav_url($nav["url"])); ?>" class="panel-close external" target="<?php if(($nav["target"]) == "1"): ?>_blank<?php else: ?>_self<?php endif; ?>"><?php echo ($nav["title"]); ?></a></div>
					</div>
				</li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
	</ul>
</div>
</div>
<div class="views">
	<div class="view view-main">
		<!--顶部导航-->
		
	<div class="navbar">
		<div class="navbar-inner">
			<?php if($category["name"] != 'clinic'): ?><div class="left"><a href="#" class="back link"><i class="icon icon-back"></i><span>返回</span></a></div><?php endif; ?>
			<div class="center sliding"><?php echo ($category["title"]); ?></div>
			<div class="right">
				<a href="#" class="link icon-only open-panel"><i class="icon icon-bars"></i></a>
			</div>
		</div>
	</div>

		<!--主体-->
		
	<div class="pages navbar-through toolbar-through">
		<div data-page="detail" class="page">
			<div class="page-content hide-bars-on-scroll bg-white">
				<div class="content-block">
					<div class="buttons-row">
						<a href="#tab1" class="tab-link active button">详细信息</a>
						<a href="#tab2" class="tab-link button">评论列表</a>
					</div>
				</div>
				<div class="tabs-animated-wrap">
					<div class="tabs">
						<div id="tab1" class="tab active">
							<style>
								.item-title {
									width: 84%;
								}
								.item-after {
									width: 16%;
								}
								.purpose .item-title {
									width: auto;
									white-space: inherit;
									text-overflow: inherit;
									font-size: 14px;
								}
								img {
									max-height: 200px;
								}
							</style>
							<h2 style="margin-top: 0;text-align: center;"><?php echo ($info["title"]); ?></h2>
							<?php echo ($info["content"]); ?>
						</div>
						<div id="tab2" class="tab">
							<iframe src="<?php echo U('Home/Index/comment');?>" width="100%" id="iframepage" frameborder="0" scrolling="no" marginheight="0" marginwidth="20"></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

		<!--底部导航-->
		
			<div class="toolbar tabbar tabbar-labels">
				<div class="toolbar-inner">
					<?php echo W('Category/toolbar');?>
				</div>
			</div>
		
	</div>
</div>
<!--底部JS及统计代码等隐藏内容-->

	<script type="text/javascript" src="/Public/static/framework7/js/framework7.min.js"></script>
	<script type="text/javascript" src="/Public/static/framework7/js/my-app.js"></script>

<?php echo hook('pageFooter', 'widget');?>
<div class="hidden"><!-- 用于加载统计代码等隐藏元素 -->
	
</div>
</body>
</html>