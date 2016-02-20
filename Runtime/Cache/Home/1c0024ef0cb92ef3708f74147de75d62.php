<?php if (!defined('THINK_PATH')) exit();?><style>
	.demo-card-header-pic .card-header {
		height: 128px;
		background-size: cover;
		background-position: center;
	}
</style>
<div class="card-box">
	<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><div class="card demo-card-header-pic">
			<div style="background-image:url(<?php echo (get_cover($data["cover_id"],'path')); ?>)" valign="bottom" class="card-header color-white no-border"></div>
			<div class="card-content">
				<div class="card-content-inner">
					<p class="color-gray">
						<span>活动开始时间:<?php echo (date('Y-m-d',$data["create_time"])); ?></span><br/>
						<span>活动结束时间:<?php echo (date('Y-m-d',$data["deadline"])); ?></span>
					</p>
					<p><?php echo ($data["description"]); ?></p>
				</div>
			</div>
			<div class="card-footer">
				<a href="#">阅读（<?php echo ($data["view"]); ?>）</a>
				<a href="<?php echo U('Article/detail?id='.$data['id']);?>" class="link">查看详情</a>
			</div>
		</div><?php endforeach; endif; else: echo "" ;endif; ?>
</div>