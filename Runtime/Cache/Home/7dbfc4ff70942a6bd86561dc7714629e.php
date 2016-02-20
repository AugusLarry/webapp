<?php if (!defined('THINK_PATH')) exit();?><ul>
	<?php if(is_array($category)): $i = 0; $__LIST__ = $category;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate): $mod = ($i % 2 );++$i;?><li>
			<a href="<?php echo U('Article/'.$cate['template_index'].'?category='.$cate['name']);?>" class="item-link item-content">
				<div class="item-media"><img src="<?php echo (get_cover($cate["icon"],'path')); ?>" width="44"></div>
				<div class="item-inner">
					<div class="item-title-row">
						<div class="item-title"><?php echo ($cate["title"]); ?></div>
					</div>
					<div class="item-subtitle"><?php echo ($cate["description"]); ?></div>
				</div>
			</a>
		</li><?php endforeach; endif; else: echo "" ;endif; ?>
</ul>