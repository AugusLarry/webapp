<?php if (!defined('THINK_PATH')) exit();?><input type="file" name="upload_<?php echo ($addons_data["name"]); ?>" id="upload_<?php echo ($addons_data["name"]); ?>" />
<textarea name="<?php echo ($addons_data["name"]); ?>" id="hidden<?php echo ($addons_data["name"]); ?>"><?php if(!empty($addons_data["value"])): echo ($addons_data["value"]); endif; ?></textarea>
<!--文件队列区域-->
<ul id="<?php echo ($addons_data["name"]); ?>_Queue">
	<?php if(!empty($addons_data["value"])): echo (getGallery($addons_data["value"])); endif; ?>
</ul>
<div class="btn" onclick="javascript:$('#upload_<?php echo ($addons_data["name"]); ?>').uploadify('upload','*')">上传所有</div>
<div class="btn" onclick="javascript:$('#upload_<?php echo ($addons_data["name"]); ?>').uploadify('cancel','*')">取消所有上传</div>
<script type="text/javascript">
	//多图上传
	var html = '<li id="${fileID}" class="uploadify-queue-item">\
					<div class="galleryinfo">\
						<img src="/Public/static/bootstrap/img/default.jpg" alt="">\
						<div class="uploadify-progress">\
							<div class="uploadify-progress-bar"></div>\
							<span class="data"></span>\
						</div>\
					</div>\
					<span class="fileName">${fileName} (${fileSize})</span>\
					<a href="javascript:$(\'#${instanceID}\').uploadify(\'upload\', \'${fileID}\')">开始上传</a>\
					<a href="javascript:$(\'#${instanceID}\').uploadify(\'cancel\', \'${fileID}\')">取消上传</a>\
				</li>';
	/* 初始化上传插件 */
	$("#upload_<?php echo ($addons_data["name"]); ?>").uploadify({
		"auto" 			  : <?php echo ($addons_config["gallery_auto"]); ?>,
		"buttonCursor"    : "<?php echo ($addons_config["gallery_buttonCursor"]); ?>",
		"fileSizeLimit"   : "<?php echo ($addons_config["gallery_fileSizeLimit"]); ?>",
		"height" 		  : <?php echo ($addons_config["gallery_height"]); ?>,
		"width" 		  : <?php echo ($addons_config["gallery_width"]); ?>,
		"multi" 		  : <?php echo ($addons_config["gallery_multi"]); ?>,
		"progressData"    : "<?php echo ($addons_config["gallery_progressData"]); ?>",
		"swf"             : "/Public/static/uploadify/uploadify.swf",
		"fileObjName"     : "download",
		"buttonText"	  : "选择图片",
		"uploader"        : "<?php echo U('File/uploadPicture',array('session_id'=>session_id()));?>",
		'removeTimeout'	  : 60*60*24,
		'fileTypeExts'	  : '*.jpg; *.png; *.gif;',
		'queueID'		  : '<?php echo ($addons_data["name"]); ?>_Queue',
		"onUploadSuccess" : upload<?php echo ($addons_data["name"]); ?>,
		"itemTemplate"    : html,
		'onFallback'      : function() {
			alert('未检测到兼容版本的Flash.');
		},
		'onClearQueue'	  : function() {
			$("#hidden<?php echo ($addons_data["name"]); ?>").html("");
		}
	});
	function upload<?php echo ($addons_data["name"]); ?>(file, data){
		var data = $.parseJSON(data);
		var src = '';
		var onevalue = '';
		var galleryvalue = '';
		if(data.status){
			onevalue = "id:" + data.id + ";path:" + data.path + "|";
			var galleryvalue = $("#hidden<?php echo ($addons_data["name"]); ?>").val() + onevalue;
			$("#hidden<?php echo ($addons_data["name"]); ?>").html(galleryvalue);
			src = data.url || '' + data.path;
			$("#"+file.id).find("img").attr("src",src).parent().attr("onclick", 'magnifygallery("'+src+'")' ).addClass("magnify");
			$("#"+file.id).find("a").remove();
			$("#"+file.id).append("<a href='javascript:void(0);' onclick='removeGallery(this, \""+onevalue+"\")'>删除该图片</a>");
		} else {
			updateAlert(data.info);
			setTimeout(function(){
				$('#top-alert').find('button').click();
				$(that).removeClass('disabled').prop('disabled',false);
			},1500);
		}
	}
	/*上传完成后可以删除该图*/
	function removeGallery(objid, file) {
		if (confirm("确定要删除该图片吗?")) {
			console.log(objid);
			$(objid).parent().remove();
			var obj = $("#hidden<?php echo ($addons_data["name"]); ?>");
			var thisvalue = obj.val();
			obj.html(thisvalue.replace(file, ''));
		} else {
			return false;
		}
	}
	/*放大图片*/
	function magnifygallery(objid) {
		console.log(objid);
		var html = '<div id="mask" class="mask"><img src="'+objid+'" alt=""><a href="javascript:hidemask();">X</a></div>';
		$("body").append(html);
		$("#mask").show().css("left", ($(window ).width()-$("#mask").width())/2).css("top", ($(window).height()-$("#mask").height())/2);
	}
	function hidemask(){
		$("#mask").remove();
	}
</script>