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
			<div class="left"><a href="#" class="back link"><i class="icon icon-back"></i><span>返回</span></a></div>
			<div class="center sliding"><?php echo ($category["title"]); ?></div>
			<div class="right">
				<a href="#" class="link icon-only open-panel"><i class="icon icon-bars"></i></a>
			</div>
		</div>
	</div>

		<!--主体-->
		
	<div class="pages navbar-through toolbar-through">
		<div data-page="clinic" class="page">
			<style>
				.swiper-custom {
					position:relative;
					height:100%;
				}
				.swiper-container {
					height: 100%;
				}
				.swiper-slide {
					background: #000;
					position: relative;
				}
				.swiper-slide img {
					position: absolute;
					left:50%;
					top:35%;
					max-width: 100%;
					max-height: 100%;
					-webkit-transform: translate(-50%, -50%);
					transform: translate(-50%, -50%);
				}
				.swiper-slide span {
					text-align:center;
					position: absolute;
					left:0;
					top:65%;
					max-width: 100%;
					max-height: 100%;
					display:block;
					color: #fff;
					padding: 0 10px;
				}
				.swiper-pagination-bullet {
					width: 10px;
					height: 10px;
					background: none;
					border:1px solid #aaa;
					border-radius: 0 0 0 0;
					opacity:1;
					cursor: pointer;
				}
				.swiper-pagination-bullet-active {
					background: #007aff;
					border-color: #007aff;
				}
				.swiper-button-next, .swiper-button-prev, .swiper-slide .preloader {
					top: 35%;
				}
				.pages .page-content {
					padding-bottom: 0;
				}
				.swiper-custom span.backtext {
					position: absolute;
					width: 30px;
					font-family: "微软雅黑";
					font-size:20px;
					line-height: 20px;
					top: 50%;
					right: 10px;
					color: #333;
				}
			</style>
			<div class="page-content hide-bars-on-scroll bg-white">
				<div class="swiper-custom">
					<div class="swiper-container">
						<div class="swiper-pagination color-white"></div>
						<div class="swiper-wrapper">
							<?php echo (get_gallery($info["gallery"],$info['id'])); ?>
						</div>
					</div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
					<span class="backtext">后面没有了</span>
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