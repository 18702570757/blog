<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.blog.entity.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="gb2312">
<title>一个站在web设计之路的技术员个人博客网站</title>
<meta name="keywords" content="个人博客,杨青个人博客,个人博客模板,杨青" />
<meta name="description" content="杨青个人博客，是一个站在web前端设计之路的女程序员个人网站，提供个人博客模板免费资源下载的个人原创网站。" />
<link href="css/base.css" rel="stylesheet">
<link href="css/learn.css" rel="stylesheet">
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/jquery.cookie.js" type="text/javascript"></script>
<script src="js/changeskin.js" type="text/javascript"></script>
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
<script src="js/scrollReveal.js"></script>
</head>
<style>
#btn_cai{
background-image:url(images/icon_ty.gif);
background-repeat:no-repeat;
width:14px;
height:14px;
border-top-style: none;
border-right-style: none;
border-bottom-style: none;
border-left-style: none;
}

</style>

<script type="text/javascript" src="syntaxhighlighter/scripts/shCore.js"></script>
<script type="text/javascript" src="syntaxhighlighter/scripts/shBrushJava.js"></script>
<script src="syntaxhighlighter/scripts/shAutoloader.js"></script>
<link href="syntaxhighlighter/styles/shThemeDefault.css" rel="stylesheet" type="text/css" />
<link href="syntaxhighlighter/compass/shCore.scss" rel="stylesheet">
<!-- 用于对代码进行高亮绚烂 -->
<script type="text/javascript">
function path() {
    var args = arguments,
    result = [];
    for (var i = 0; i < args.length; i++)
        result.push(args[i].replace('$', 'syntaxhighlighter/scripts/'));
    return result
}
$(function () {
    SyntaxHighlighter.autoloader.apply(null, path(
        'applescript            $shBrushAppleScript.js',
        'actionscript3 as3      $shBrushAS3.js',
        'bash shell             $shBrushBash.js',
        'coldfusion cf          $shBrushColdFusion.js',
        'cpp c                  $shBrushCpp.js',
        'c# c-sharp csharp      $shBrushCSharp.js',
        'css                    $shBrushCss.js',
        'delphi pascal          $shBrushDelphi.js',
        'diff patch pas         $shBrushDiff.js',
        'erl erlang             $shBrushErlang.js',
        'groovy                 $shBrushGroovy.js',
        'java                   $shBrushJava.js',
        'jfx javafx             $shBrushJavaFX.js',
        'js jscript javascript  $shBrushJScript.js',
        'perl pl                $shBrushPerl.js',
        'php                    $shBrushPhp.js',
        'text plain             $shBrushPlain.js',
        'py python              $shBrushPython.js',
        'ruby rails ror rb      $shBrushRuby.js',
        'sass scss              $shBrushSass.js',
        'scala                  $shBrushScala.js',
        'sql                    $shBrushSql.js',
        'vb vbnet               $shBrushVb.js',
        'xml xhtml xslt html    $shBrushXml.js'
    ));
    SyntaxHighlighter.all();
});
</script>
<body>
<!-- <header>
  <div class="logo" data-scroll-reveal="enter right over 1s"><a href="/"><img src="images/logo.png"></a></div>
  <nav class="topnav" data-scroll-reveal="enter bottom over 1s after 1s"><a href="index.jsp"><span>首页</span><span class="en">Home</span></a><a href="about.jsp"><span>关于我</span><span class="en">About</span></a><a href="manshenghuo.jsp"><span>慢生活</span><span class="en">Life</span></a><a href="learn.jsp"><span>碎言碎语</span><span class="en">Doing</span></a><a href="mbfx.jsp"><span>模板分享</span><span class="en">Share</span></a><a href="learn.jsp"><span>学无止境</span><span class="en">Learn</span></a><a href="gbook.jsp"><span>留言</span><span class="en">Saying</span></a></nav>
</header> -->
<%@include file="header.jsp" %>
	<article>
		<div class="container">
			<h2 class="ctitle">
				<b>博文详情</b> <span>不要轻易放弃。学习成长的路上，我们长路漫漫，只因学无止境。</span>
			</h2>
			<div class="container1">
				<div>
					<p style="font-size: 24px; text-align: center">${sessionScope.article.atitle}</p>
				</div>
				<div style="height: 30px; text-align: center; margin-left: 400px">${sessionScope.article.adate}</div>
				<div align="left">摘要：<span style="font-size: 15px; color: black;">${sessionScope.article.asummary}</span>
				</div>
				<p style="text-indent: 2em; font-size: 15px;color: black;">${sessionScope.article.acontent}</p>
				<div style="padding: 10px 0; margin-bottom: 10px; margin-top: 10px; margin-left: 780px; border: silver 0px dashed; font-size: 12px; width: 150px; text-align: center; height: 30px;">
					<button id="btnzan">点赞<span id="ccount">${sessionScope.article.ccount}</span></button>
					<button id="btncai">反对<span id="cdiss">${sessionScope.article.cdiss}</span></button>
					<input type="hidden" name="id" value="${sessionScope.article.aid}" />
				</div>
			
			<div id="cbody">
			<c:forEach var="info" items="${sessionScope.info}" >
				<div style="color:black;border:1px pink solid;">
			<input type="hidden" name="" value="1" />
			<span id="counts">#--&nbsp;&nbsp;</span><span id="ctitle">${info.cdate}&nbsp;&nbsp;--#</span>
			<div id="ccontent" style="padding:10px;">
				<pre>
  ${info.ccontent}
				</pre>
				</div>
				</div>
			</c:forEach>
		
		</div>

				<div align="left">
					<span style="text-align: left; color: black">发表评论</span> <br>
					<span style="text-align: left; color: black">昵称：</span>
					<form id="comment">
					<input type="hidden" name="pid" value=""/>
					<input type="hidden" name="aid" value="${sessionScope.article.aid}" />
					<input type="text" name="username" value="" /> <br>
					<textarea name="content" rows="" cols="" placeholder="请输入评论内容" style="width: 450px; height:200px"></textarea>
					<p style="margin-top:10px; line-height:20px ">
					<input type="button" onclick="mit()" value="提交评论">
					</p>
					</form>
				</div>
				
				<script type="text/javascript">
				
				function timeStamp2String(time){
				    var datetime = new Date();
				    datetime.setTime(time);
				    var year = datetime.getFullYear();
				    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
				    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
				    var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
				    var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
				    var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
				    return year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second;
				}
				
			function mit() {
				var c = {};
				var datas = $("#comment").serializeArray();
				$.each(datas, function() {
					c[this.name] = this.value;
				});
							
				$.post("CommentServlet?action=add",c,function(data,status){
					if(status == 'success') {
						$("<div/>")
						.appendTo("#cbody")
						.addClass("news")
						.attr("style","color: black;border: pink;")
						.end();
						console.log(c);
						$(".news").parent().append("<div class='news' style='color:black;border:1px pink solid'><input type='hidden' name='' value='1' />"+
								"<span>#--&nbsp;&nbsp;" + timeStamp2String(new Date().getTime()) + c.username + "&nbsp;&nbsp;--#</span>"+
								"<div style='padding:10px;'><pre>" + c.content + "</pre></div></div></div>");
						
						/* $("#cbody").delegate($(".news").children(":last-child").html("<input type='hidden' name='' value='1' />"+
								"<span>#--&nbsp;&nbsp;" + new Date() + c[2] + "&nbsp;&nbsp;--#</span>"+
								"<div style='padding:10px;'><pre>" + c[3] + "</pre></div></div>")); */
					}
				})
			}
		</script>
			
			</div>
			</div>

	</article>
	
	<!-- <footer> Design by DanceSmile <a href="/">蜀ICP备11002373号-1</a> </footer> -->
<%@include file="footer.jsp" %>
<script>
	if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
		(function(){
			window.scrollReveal = new scrollReveal({reset: true});
		})();
	};
</script> 
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#btnzan").click(function() {
			
			$("#btncai").attr("disabled", !$("#btncai").attr("disabled"));
			var c_count;
			if($("#btnzan").text().substr(0,2) == "点赞"){
				c_count = parseInt($("#ccount").text()) + 1;
				$("#btnzan").html("取消" + "<span id='ccount'>" + c_count + "</span>");
			}else if($("#btnzan").text().substr(0,2) == "取消"){
				c_count = parseInt($("#ccount").text()) - 1;
				$("#btnzan").html("点赞" + "<span id='ccount'>" + c_count + "</span>");
			}
			var id = $("input:hidden").val();
			$.get("IndexServlet", {
				count: c_count,
				a_id: id,
				action:"zan"
			}, function(data, status) {
				if(status == 'success') {
				}

			})
			
		})
		
		$("#btncai").click(function() {
			$("#btnzan").attr("disabled", !$("#btnzan").attr("disabled"));
			var c_diss;
			if($("#btncai").text().substr(0,2) == "反对"){
				c_diss = parseInt($("#cdiss").text()) + 1;
				$("#btncai").html("取消" + "<span id='cdiss'>" + c_diss + "</span>");
			}else if($("#btncai").text().substr(0,2) == "取消"){
				c_diss = parseInt($("#cdiss").text()) - 1;
				$("#btncai").html("反对" + "<span id='cdiss'>" + c_diss + "</span>");
			}
			var id = $("input:hidden").val();
			$.get("IndexServlet", {
				count: c_diss,
				a_id: id,
				action:"cai"
			}, function(data, status) {
				if(status == 'success') {
				}

			})
		})
	});
</script>
</body>
</html>
