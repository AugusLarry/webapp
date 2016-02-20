<?php if (!defined('THINK_PATH')) exit();?><a href="/" class="tab-link external <?php if(CONTROLLER_NAME == "Index"): ?>active<?php endif; ?>">
	<i class="icon"><img src="/Uploads/Picture/2015-12-08/index.png" <?php if(CONTROLLER_NAME == "Index"): ?>class="bg-blue"<?php endif; ?> alt="首页" width="24"/></i>
	<span class="tabbar-label">首页</span>
</a>
<?php if(is_array($category)): $i = 0; $__LIST__ = array_slice($category,0,4,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate): $mod = ($i % 2 );++$i;?><a href="<?php echo U('Article/'.$cate['template_index'].'?category='.$cate['name']);?>" class="tab-link external <?php if($_GET['category']== $cate["name"]): ?>active<?php endif; ?>">
		<i class="icon"><img src="<?php echo (get_cover($cate["icon"],'path')); ?>" alt="<?php echo ($cate["title"]); ?>" <?php if($_GET['category']== $cate["name"]): ?>class="bg-blue"<?php endif; ?> width="24"/></i>
		<span class="tabbar-label"><?php echo ($cate["title"]); ?></span>
	</a><?php endforeach; endif; else: echo "" ;endif; ?>