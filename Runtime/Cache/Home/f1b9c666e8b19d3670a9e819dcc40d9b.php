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
			<div class="center sliding"><?php echo C('WEB_SITE_TITLE');?></div>
			<div class="right">
				<a href="#" class="link icon-only open-panel"><i class="icon icon-bars"></i></a>
			</div>
		</div>
	</div>

		<!--主体-->
		
	<div class="pages">
		<div data-page="message" class="page navbar-fixed toolbar-fixed">
			<div class="page-content messages-content">
				<div class="messages">
					<div class="messages-date">Sunday, Feb 9 <span>12:58</span></div>
					<div class="message message-sent">
						<div class="message-text">Hello</div>
					</div>
					<div class="message message-sent">
						<div class="message-text">How are you?</div>
					</div>
					<div class="message message-received">
						<div class="message-name">Kate</div>
						<div class="message-text">I am fine, thanks</div>
						<div style="background-image:url(http://lorempixel.com/output/people-q-c-100-100-9.jpg)" class="message-avatar"></div>
					</div>
					<div class="messages-date">Sunday, Feb 3 <span>11:58</span></div>
					<div class="message message-sent">
						<div class="message-text">Nice photo?</div>
					</div>
					<div class="message message-sent message-pic">
						<div class="message-text"><img src="http://lorempixel.com/300/300/"></div>
						<div class="message-label">Delivered</div>
					</div>
					<div class="message message-received">
						<div class="message-name">Kate</div>
						<div class="message-text">Wow, awesome!</div>
						<div style="background-image:url(http://lorempixel.com/output/people-q-c-100-100-9.jpg)" class="message-avatar"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

		<!--底部导航-->
		
	<div class="toolbar messagebar">
		<div class="toolbar-inner">
			<textarea placeholder="Message"></textarea><a href="#" class="link">Send</a>
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