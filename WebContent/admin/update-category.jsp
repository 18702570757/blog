<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.blog.servicesImpl.*,java.util.*,com.blog.entity.*"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>修改类别 - 别爱我博客管理系统</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="images/icon/icon.png">
<link rel="shortcut icon" href="images/icon/favicon.ico">
<script src="js/jquery-2.1.4.min.js"></script>
<!--[if gte IE 9]>
  <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
  <script src="js/html5shiv.min.js" type="text/javascript"></script>
  <script src="js/respond.min.js" type="text/javascript"></script>
  <script src="js/selectivizr-min.js" type="text/javascript"></script>
<![endif]-->
<!--[if lt IE 9]>
  <script>window.location.href='upgrade-browser.html';</script>
<![endif]-->
</head>

<body class="user-select">

    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
      <h1 class="page-header">修改类别</h1>
      <form action="/Category/update" method="post">
        <div class="form-group">
          <label for="category-name">类别名称</label>
          <input type="text" id="category-name" name="name" value="前端技术" class="form-control" placeholder="在此处输入栏目名称" required autocomplete="off">
          <span class="prompt-text">这将是它在站点上显示的名字。</span> </div>
        <div class="form-group">
          <label for="category-describe">描述</label>
          <textarea class="form-control" id="category-describe" name="describe" rows="4" autocomplete="off">这是类别的描述</textarea>
          <span class="prompt-text">描述会出现在网页的description属性中。</span> </div>
        <button class="btn btn-primary" type="submit" name="submit">更新</button>
      </form>
    </div>
  </div>
</section>
<script src="js/bootstrap.min.js"></script> 
<script src="js/admin-scripts.js"></script>
</body>
</html>
