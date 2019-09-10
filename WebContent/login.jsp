<!DOCTYPE html>
<%@page import="com.blog.utils.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户中心</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_ay4w4j5c2tke29.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body class="login-page">
<%
String error=request.getParameter("tag");

if(error != null && "1".equals(error)){
	out.print("<font color=red>用户名密码错误</font>");
}
%>

<%
Cookie[] cookies = request.getCookies();
for(Cookie cookie : cookies){
	if(cookie.getName().equals("userid"))
		response.sendRedirect("admin/index.jsp");
}
%>
<div class="login-box">
    <div class="login-logo">
        <a href="index.htm">了解一下</a>
    </div>

    <div class="row login-box-body">
        <div class="row" style="margin-bottom: 20px;">
            <div class="col-xs-6 logo-tip">
                <i class="iconfont icon-icon053"></i> <span>登录</span>
            </div>
            <div class="col-xs-6" style="text-align: right">
                <a href="reg.jsp">注册</a>
            </div>
        </div>
        <!-- Nav tabs -->
        <ul class="tabs-menu">
            <li class="active"><a href="#email" data-toggle="tab" style="align:center" >用戶登录</a></li>
            
            
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane active" id="email">
                <div class="login-box-body">

                    <form  action="LoginServlet?action=login" method="post">
                        <div class="form-group has-feedback">
                            <input type="email" class="form-control" name="username" placeholder="用戶名">
                            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="password" class="form-control" name="password" placeholder="登录密码">
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="checkbox icheck">
                                    <label>
                                        <input type="checkbox" name="rem"> 记住我
                                    </label>
                                </div>
                            </div>
                            <div class="col-xs-6" style="text-align: right">
                                <div class="checkbox icheck">
                                    <label>
                                        <a href="password.jsp">忘记密码？</a>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <!-- /.col -->
                            <div class="col-xs-12">
                                <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>
                </div>
            </div>
            <div class="tab-pane" id="phone">
                <div class="login-box-body">

                    <form>
                        <div class="form-group has-feedback">
                            <input type="email" class="form-control" placeholder="手机号">
                            <span class="glyphicon glyphicon-phone form-control-feedback"></span>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="form-group has-feedback">
                                    <input type="password" class="form-control" placeholder="短信验证码">
                                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <button type="submit" class="btn btn-primary btn-block btn-flat">获取验证码</button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="checkbox icheck">
                                    <label>
                                        <input type="checkbox"> 记住我
                                    </label>
                                </div>
                            </div>
                            <div class="col-xs-6" style="text-align: right">
                                <div class="checkbox icheck">
                                    <label>
                                        <a href="password.jsp">忘记密码？</a>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <!-- /.col -->
                            <div class="col-xs-12">
                                <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>

                </div>
                <!-- /.login-box-body -->
            </div>
        </div>

        
        </div>
        <!-- /.social-auth-links -->

    </div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>