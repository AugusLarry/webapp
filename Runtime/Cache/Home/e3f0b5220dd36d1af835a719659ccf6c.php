<?php if (!defined('THINK_PATH')) exit();?><style>
	.list-block .card-content .item-inner:after {
		height: 0;
	}
</style>
<div class="list-block media-list">
	<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><div class="card demo-card-header-pic">
			<div class="card-content">
				<a href="<?php echo U('Article/detail?id='.$data['id']);?>" class="item-link item-content">
					<div class="item-media">
						<img src="<?php echo (get_cover($data["cover_id"],'path')); ?>" alt="<?php echo ($data["title"]); ?>">
					</div>
					<div class="item-inner">
						<div class="item-title-row">
							<div class="item-title"><?php echo ($data["title"]); ?></div>
							<!--<div class="item-after"><?php echo (get_field($data["id"],"job", "Expert")); ?></div>-->
						</div>
						<div class="item-subtitle"><?php echo (get_field($data["id"],"job", "Expert")); ?></div>
						<div class="item-text"><?php echo (get_field($data["id"],"honor", "Expert")); ?></div>
					</div>
				</a>
			</div>
			<div class="card-footer">
				<sapn><b>擅长：</b><?php echo ($data["description"]); ?></sapn>
			</div>
		</div><?php endforeach; endif; else: echo "" ;endif; ?>
</div>