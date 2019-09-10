<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.blog.servicesImpl.*,java.util.*,com.blog.entity.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<script type="text/javascript" src="js/jquery.min.js"></script>
<title>类别管理</title>
</head>
<body>
	<c:if test="${sessionScope.tlist == null}"><%response.sendRedirect("../TypeServlet"); %></c:if>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 
		首页 <span class="c-gray en">&gt;</span>
		类别管理 <span class="c-gray en">&gt;</span> 
		类别列表 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="../TypeServlet" title="刷新">
			<i class="Hui-iconfont">&#xe68f;</i>
		</a>
	</nav>
	
<div class="page-container">
	<div class="text-c">
	        <form action="../TypeServlet?flay=cx" method="post">
			<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜类别</button>
			<input type="text"  id="about" name="s" placeholder="类别名称" style="width:250px" class="input-text">
	        </form>
	</div>
</div>
		
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> 
			<a href=""  onclick="document.getElementById('plsc').submit();return false;"
				class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
				批量删除
			</a> 
			<a class="btn btn-primary radius" data-title="添加类别"
				href="type-add.jsp?flay=add"> <i class="Hui-iconfont">&#xe600;</i>
				添加类别
			</a>
			</span> 
			<span class="r">共有数据：<strong>${count}</strong> 条
			</span>
		</div>
		<div class="mt-20">
		<form action="../TypeServlet?flay=plscc" id="plsc" method="post">
			<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
				<thead>
					<tr class="text-c">
					<th width="25"><input type="checkbox" name="seleteAll" value="多余"></th>
					  <th width="60">ID</th>
					  <th width="100">类别名称</th>
					<th>类别简介</th>
					<th width="100">操作</th>
					</tr>
				</thead>
				
				<tbody>
				
						<c:forEach var="tlists" items="${sessionScope.tlist}" >
					<tr class="text-c">
					
				
			     	<td><input type="checkbox" value="${tlists.t_id}" name="seleteAll"></td>
					
						<td>${tlists.t_id}</td>
						<td>${tlists.t_name}</td>
						<td>${tlists.t_content}</td>
			
						<td class="f-14 td-manage">
						
						<a style="text-decoration: none" class="ml-5"
							onClick="article_edit('文章编辑','type-modify.jsp?id=${tlists.t_id}','10001')"
							href="../TypeServlet?id=${tlists.t_id}&flay=b" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
						<a style="text-decoration: none" class="ml-5"
							href="../TypeServlet?id=${tlists.t_id}&flay=s"
							title="删除"> <i class="Hui-iconfont">&#xe6e2;</i></a>
							</td>
					</tr>
					</c:forEach>
					
			
					

				</tbody>
					
				
			</table>
			
			</form>
		</div>
	
	
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	
	
	
	<script type="text/javascript">	
	$('.table-sort').dataTable({
			"aaSorting" : [ [ 1, "ASC" ] ],//默认第几个排序
			"bStateSave" : true,//状态保存
			"pading" : false,
			"aoColumnDefs" : [
			{
				"orderable" : false,
				"aTargets" : [ 0, 4 ]
			} // 不参与排序的列
			]
		});

	var form = document.getElementById('test_form');
	//再次修改input内容

	form.submit();
		/*标题-编辑*/
		
	</script>
</body>
</html>