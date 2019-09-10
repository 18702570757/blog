<%@page import="com.blog.servicesImpl.UserServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.dao.UserDAO"%>
<%@page import="com.blog.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/style.css" />
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript"
	src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript"
	src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<title>用户管理</title>
</head>
<body>
	<%
		String  id=request.getParameter("id");
	    
	%>
	<!-- 模糊查询 -->
	<script type="text/javascript">
		$(function() {
			$(".input-text").keyup(
					function() {
						var keyword = $("#username").val();

						$('.text-c').hide()//将原有的内容隐藏
						//然后将含有keyword的li进行渐变显示
						$("td").filter(":Contains(" + keyword + ")").parents(
								'.text-c').fadeIn(2000)
					})
		})
	</script>
	<!-- 批量删除 -->

	<script type="text/javascript">
		$(function() {
			//全选，全不选
			$(".se").click(function() {
				if ($(".se").is(":checked")) {
					for (var i = 0; i < $(".cselect").length; i++)
						$(".cselect").attr("checked", true);
				} else {
					for (var i = 0; i < $(".cselect").length; i++)
						$(".cselect").attr("checked", false);
				}
			})
		})
		var ids = "";
		//批量删除
		$(function() {
			$("#delete")
					.click(
							function() {

								$(".cselect:checked").each(
										function() {
											var id = $(this).parent().siblings(
													":first").text();
											ids = ids + id + ",";
										});
										
										$.ajax({
											type : "POST",
											url : "User",
											data : "action=deleteAll&ids="
													+ ids,
											success : function(data) {
												
												//var json = JSON.parse(data);
												/* $.each($.parseJSON(data),function(i ,n){
													alert(n.userid);
												}) */
												//data =JSON.stringify(data);
												//var json=JSON.parse(data);
								
												var json=JSON.parse(data);
											
												
												var st="";
												for (var i = 0; i < json.length; i++) {

													st = st+ "<tr class='text-c'><td><input type='checkbox' value='1' class='cselect'></td>";
													st = st + "<td>"+ json[i].userid+ "</td>";
															
									
													st = st + "<td>"+ json[i].username+ "</td>";
															
															
													st = st + "<td>"+ json[i].password+ "</td>";
															
															
													st = st + "<td>"+ json[i].intro+ "</td>";
															
															
													st = st + "<td>"+ json[i].headImg+ "</td>";
															
															
													st = st+ "<td><a style='text-decoration: none' class='ml-5' href='User?userid="+json[i].userid+"&action=toupdate' title='编辑'><i class='Hui-iconfont'>&#xe6df;</i></a> <a style='text-decoration: none' class='ml-5' href='User?userid="+json[i].userid+"&action=delete' title='删除'> <i class='Hui-iconfont'>&#xe6e2;</i></a></td></tr>";
												}
												$("#tbc").html(st);

											}
										});

							})

		})
		$(function() {

		})
	</script>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		用户中心 <span class="c-gray en">&gt;</span> 用户管理 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="pd-20">

		<div class="text-b">
		
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<button id="delete" class="btn btn-danger radius">批量删除</button>
			<!-- <span class="l"><a id="allDelete"
				class="btn btn-danger radius"><i class="icon-trash"></i> 批量删除</a> -->
				 <a
				href="user-add.jsp"
				onclick="user_add('550','','添加用户','user-add.jsp')"
				class="btn btn-primary radius"><i class="icon-plus"></i> 添加用户</a></span>
			<!-- <span class="r">共有数据：<strong>88</strong> 条 -->
			</span>
			<input type="text" class="input-text" style="width: 500px;"
				placeholder="输入搜索的关键字" id="username" name="searchname">
				
		</div>
		<table
			class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr class="text-b">
					<th width="25"><input type="checkbox" class="se" value=""></th>
					<th width="80">用户id</th>
					<th width="100">用户名</th>
					<th width="40">用户密码</th>
					<th width="90">用户简介</th>
					<th width="150">用户头像</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody id="tbc">
				
				<c:forEach var="user" items="${requestScope.list}">
					<tr class="text-c">
						<td><input type="checkbox" value="1" name="" class="cselect"></td>
						<td>${user.userid}</td>
						<td>${user.username}</td>
						<td>${user.password}</td>
						<td>${user.intro}</td>
						<td>${user.headImg}</td>

						<td><a style="text-decoration: none" class="ml-5" onClick=""
							href="User?userid=${user.userid}&action=toupdate" title="编辑">
								<i class="Hui-iconfont">&#xe6df;</i>
						</a> <a style="text-decoration: none" class="ml-5"
							href="User?userid=${user.userid}&action=delete" title="删除"> <i
								class="Hui-iconfont">&#xe6e2;</i></a></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="pageNav" class="pageNav">
		
			
		<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="page">
	<tr>
		<td width="50%" align="left">共条${requestScope.totalCount }记录，<span style="font-family:宋体; font-size:9.0pt; color:black; ">第</span><span style="font-family:Tahoma; font-size:9.0pt; color:black; ">${requestScope.iPageNo }/${requestScope.totalPage}</span><span style="font-family:宋体; font-size:9.0pt; color:black; ">页</span></td>
		<td width="50%" align="right"><a href=" User?pageNo=1&action=page">首页</a> <c:if test="${requestScope.iPageNo-1>0 }"><a href="User?pageNo=${requestScope.iPageNo-1 }&action=page">上一页</a> </c:if><c:if test="${requestScope.iPageNo+1 <=requestScope.totalPage}"><a href="User?pageNo=${requestScope.iPageNo+1 }&action=page">下一页</a></c:if> <a href="User?pageNo=${requestScope.totalPage}&action=page">末页</a></td>
		</tr>
		</table>
		</div>
		</div>
			

</body>
</html>