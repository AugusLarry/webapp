<?php if (!defined('THINK_PATH')) exit(); if(!empty($list)): switch($type): case "activity": if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><div class="card demo-card-header-pic">
					<div style="background-image:url(<?php echo (get_cover($data["cover_id"],'path')); ?>)" valign="bottom" class="card-header color-white no-border"><?php echo ($data["title"]); ?></div>
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
				</div><?php endforeach; endif; else: echo "" ;endif; break;?>
		<?php case "defaultlist": if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><li>
					<a href="<?php echo U('Article/detail?id='.$data['id']);?>" class="item-link item-content">
						<div class="item-inner">
							<div class="item-title-row">
								<div class="item-title"><?php echo ($data["title"]); ?></div>
								<div class="item-after"><?php echo (date('m-d',$data["create_time"])); ?></div>
							</div>
							<div class="item-text"><?php echo ($data["description"]); ?></div>
						</div>
					</a>
				</li><?php endforeach; endif; else: echo "" ;endif; break;?>
		<?php case "clinic": if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><div class="card demo-card-header-pic">
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
				</div><?php endforeach; endif; else: echo "" ;endif; break; endswitch;?>
<?php else: ?>
	<p style="text-align: center;margin:0;padding:1em 0;">已经加载完毕了!</p><?php endif; ?>