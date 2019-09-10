<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="../kindeditor/plugins/code/prettify.css" />
<script type="text/javascript" src="js/jquery.min.js"></script> 
<script type="text/javascript" src="../kindeditor/kindeditor-all.js"></script>
<!-- <link rel="stylesheet" href="../kindeditor/themes/default/default.css" />
 <link rel="stylesheet" href="../kindeditor/themes/simple/simple.css"/>
 <link rel="stylesheet" href="../kindeditor/themes/qq/qq.css"/> -->
 
 


<!-- ajax获取后台的类别数据 -->
<script type="text/javascript">
	$(function(){
		$.post("../ArticleServlet",{
			flag:"beforeAdd"
		},function(data){
			var str="";
			
			 $.each(data,function(i,n){
				str=str+"<option value="+n.t_id+"> "+n.t_name+"</option>";
			});
			 $("#categorySelect").append(str);
			
		},"json")
	});
	
</script>

<!-- 创建富文本编辑器 -->
<script type="text/javascript">
	
	var editor=KindEditor.ready(function(K){
		window.editor=K.create("#editor",{
			width:"700px",
			height:"500px",
			pluginsPath:'../kindeditor/plugins',
			cssPath :'../kindeditor/plugins/code/prettify.css',
			//失去焦点时编辑器中的内容与文本框同步
			afterBlur:function(){
				this.sync()
				cutText();
				
			},
			//上传是处理的路劲
			uploadJson:"../KindEditorFileUploadServlet",
			allowPreviewEmoticons:true,
			//themePath:'default'
			langPath:'zh-CN',
			
			
		});
	});
	
	
	/*移除HTML标签代码*/
    function removeHTMLTag(str) {
            str = str.replace(/<\/?[^>]*>/g,""); //去除HTML tag
            str = str.replace(/[ | ]*\n/g,""); //去除行尾空白
            str = str.replace(/\n[\s| | ]*\r/g,""); //去除多余空行
            str=str.replace(/ /ig,'');//去掉 
            return str;
    }
    //转意符换成普通字符
    function escape2Html(str) { 
     var arrEntities={'lt':'<','gt':'>','nbsp':' ','amp':'&','quot':'"','emsp':""}; 
     return str.replace(/&(lt|gt|nbsp|amp|quot|emsp);/ig,function(all,t){return arrEntities[t];}); 
    }
 
	function cutText(){
		var sval=$("#summary");
		if(sval.val()==""){
			var text=editor.text();
			var stext=removeHTMLTag(text.substr(0,120));
			sval.val(escape2Html(stext));
		}
	}
</script>
<title>新增文章 - 资讯管理</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" action="../ArticleServlet?flag=add" method="post">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="atitle" name="atitle">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章类别：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="articletype" class="select" id="categorySelect">
					<option value="0">全部类别</option>
					
					
				</select>
				</span> </div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">文章摘要：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="abstracts" cols=""  id="summary" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="$.Huitextarealength(this,200)"></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
			</div>
		</div>
			
	
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">文章内容：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<textarea id="editor" name="context">
			
				</textarea>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
			 <!-- onClick="article_save_submit();" -->
				<button class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i>提交</button>
				<button onClick="" class="btn btn-default radius" type="reset">&nbsp;&nbsp;重置&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="js/jquery.min.js"></script> 
<script type="text/javascript" src="js/layer.js"></script>
<script type="text/javascript" src="js/H-ui.min.js"></script> 
<script type="text/javascript" src="js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="js/WdatePicker.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script> 
<script type="text/javascript" src="js/validate-methods.js"></script> 

<script type="text/javascript" src="js/messages_zh.js"></script>

<script type="text/javascript" src="js/webuploader.min.js"></script> 


<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	//表单验证
	$("#form-article-add").validate({
		rules:{
			articletitle:{
				required:true,
			},
			
			
			articletype:{
				required:true,
			},
			
			abstracts:{
				required:true,
			}
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			//$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			//parent.$('.btn-refresh').click();
			parent.layer.close(index);
		}
	});
	
	$list = $("#fileList"),
	$btn = $("#btn-star"),
	state = "pending",
	uploader;

	var uploader = WebUploader.create({
		auto: true,
		swf: 'lib/webuploader/0.1.5/Uploader.swf',
	
		// 文件接收服务端。
		server: 'fileupload.php',
	
		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick: '#filePicker',
	
		// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		resize: false,
		// 只允许选择图片文件。
		accept: {
			title: 'Images',
			extensions: 'gif,jpg,jpeg,bmp,png',
			mimeTypes: 'image/*'
		}
	});
	uploader.on( 'fileQueued', function( file ) {
		var $li = $(
			'<div id="' + file.id + '" class="item">' +
				'<div class="pic-box"><img></div>'+
				'<div class="info">' + file.name + '</div>' +
				'<p class="state">等待上传...</p>'+
			'</div>'
		),
		$img = $li.find('img');
		$list.append( $li );
	
		// 创建缩略图
		// 如果为非图片文件，可以不用调用此方法。
		// thumbnailWidth x thumbnailHeight 为 100 x 100
		uploader.makeThumb( file, function( error, src ) {
			if ( error ) {
				$img.replaceWith('<span>不能预览</span>');
				return;
			}
	
			$img.attr( 'src', src );
		}, thumbnailWidth, thumbnailHeight );
	});
	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
		var $li = $( '#'+file.id ),
			$percent = $li.find('.progress-box .sr-only');
	
		// 避免重复创建
		if ( !$percent.length ) {
			$percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo( $li ).find('.sr-only');
		}
		$li.find(".state").text("上传中");
		$percent.css( 'width', percentage * 100 + '%' );
	});
	
	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file ) {
		$( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
	});
	
	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
		$( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
	});
	
	// 完成上传完了，成功或者失败，先删除进度条。
	uploader.on( 'uploadComplete', function( file ) {
		$( '#'+file.id ).find('.progress-box').fadeOut();
	});
	uploader.on('all', function (type) {
        if (type === 'startUpload') {
            state = 'uploading';
        } else if (type === 'stopUpload') {
            state = 'paused';
        } else if (type === 'uploadFinished') {
            state = 'done';
        }

        if (state === 'uploading') {
            $btn.text('暂停上传');
        } else {
            $btn.text('开始上传');
        }
    });

    $btn.on('click', function () {
        if (state === 'uploading') {
            uploader.stop();
        } else {
            uploader.upload();
        }
    });
	
	var ue = UE.getEditor('editor');
	
});
</script>

</body>
</html>