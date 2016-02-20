<?php if (!defined('THINK_PATH')) exit();?><div class="list-block media-list list-block-search searchbar-found">
	<ul>
		<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><li>
				<a href="<?php echo U('Article/detail?id='.$data['id']);?>" class="item-link item-content">
					<div class="item-inner">
						<div class="item-title-row">
							<div class="item-title"><?php echo ($data["title"]); ?></div>
							<div class="item-after"><?php echo (date('m-d',$data["create_time"])); ?></div>
						</div>
						<div class="item-text"><?php echo ($data["description"]); ?></div>
					</div>
				</a>
			</li><?php endforeach; endif; else: echo "" ;endif; ?>
	</ul>
</div>