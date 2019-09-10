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
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
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
<title>文章</title>
</head>
<body>
	<%  
		ArticleServiceImpl ar = new ArticleServiceImpl();
		List<Article> alist = new ArrayList<>();
		alist = ar.selectAll(alist);		
	%>

	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 
		首页 <span class="c-gray en">&gt;</span>
		文章管理 <span class="c-gray en">&gt;</span> 
		文章列表 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新">
			<i class="Hui-iconfont">&#xe68f;</i>
		</a>
	</nav>
	
<div class="page-container">
</div>
		
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> 
			<a href="javascript:;" onclick="document.getElementById('f1').submit();"
				class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
				批量删除
			</a> 
			<a class="btn btn-primary radius" data-title="添加文章"
				href="article-add.jsp"> <i class="Hui-iconfont">&#xe600;</i>
				添加文章
			</a>
			</span> 
			<span class="r">共有数据：<strong><%=alist.size()%></strong> 条
			</span>
		</div>
		<div class="mt-20">
			
			<form action="../ArticleServlet" name="form1" id="f1" method="post" >
			<input type="hidden" name="flag" value="deleteAll"/>
			
			<table
				class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
				<thead>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="id" value=""></th>
						<th width="40">ID</th>
						<th width="250">标题</th>
						<th width="80">分类</th>
						<th width="120">更新时间</th>
						<th width="75">浏览次数</th>
						<th width="75">点赞次数</th>
						<th width="75">反赞次数</th>
						<th width="120">找回状态(0:不可找回/2:可找回)</th>
						<th width="120">操作</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Article a : alist) {
					%>
					<tr class="text-c">
						<td><input type="checkbox" value="<%=a.getAid()%>" name="id"></td>
						<td><%=a.getAid()%></td>
						<td><%=a.getAtitle()%></td>
						<td><%=a.getTid()%></td>
						<td><%=a.getAdate()%></td>
						<td><%=a.getVcount()%></td>
						<td><%=a.getCcount()%></td>
						<td><%=a.getCdiss()%></td>
						<td><%=a.getAtag()%></td>
						<td class="f-14 td-manage">
						<a style="text-decoration: none" class="ml-5"
							onClick="article_edit('文章编辑','article-modify.jsp?id=<%=a.getAid()%>','10001')"
							href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
						<a style="text-decoration: none" class="ml-5"
							href="../ArticleServlet?id=<%=a.getAid()%>&flag=delete"
							title="删除"> <i class="Hui-iconfont">&#xe6e2;</i></a>
								<a style="text-decoration: none" class="ml-5"
							href="../ArticleServlet?id=<%=a.getAid()%>&flag=undo"
							title="可找回"> <i class="Hui-iconfont">&#xe728;</i></a>
							</td>
					</tr>
					<%
						}
					%>

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
				"aTargets" : [ 0, 8 ]
			} // 不参与排序的列
			]
		});

		
		/*文章-编辑*/
		function article_edit(title, url, id, w, h) {
			var index = layer.open({
				type : 2,
				title : title,
				content : url
			});
			layer.full(index);
		}
		

		
	</script>
</body>
</html>