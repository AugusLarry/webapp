<?php if (!defined('THINK_PATH')) exit();?><style>
	.demo-card-header-pic .card-header {
		height: 128px;
		background-size: cover;
		background-position: center;
	}
	.card-content-inner p {
		margin: .3em 0;
	}
</style>
<div class="card-box">
	<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><div class="card demo-card-header-pic">
			<div style="background-image:url(<?php echo (get_cover($data["cover_id"],'path')); ?>)" valign="bottom" class="card-header color-white no-border"><?php echo ($data["title"]); ?></div>
			<div class="card-content">
				<div class="card-content-inner">
					<p>时间：<b class="color-red"><?php echo (date("Y-m-d", $data["create_time"])); ?></b></p>
					<p>地点：<span class="color-gray"><?php echo (get_field($data["id"],"address", "Gallery")); ?></span></p>
					<p class="color-gray"><span class="color-black">合作单位：</span><?php echo ($data["description"]); ?></p>
				</div>
			</div>
			<div class="card-footer">
				<a href="javascript:void(0);">受众人数（<?php echo (get_field($data["id"],"population", "Gallery")); ?>）</a>
				<a href="<?php echo U('Article/detail?id='.$data['id']);?>" class="link">查看详情</a>
			</div>
		</div><?php endforeach; endif; else: echo "" ;endif; ?>
</div>