<!DOCTYPE html>
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
<body class="register-page">
<div class="register-box">
    <div class="login-logo">
        <a href="#">了解一下</a>
    </div>

    <div class="row login-box-body">
        <div class="row" style="margin-bottom: 20px;">
            <div class="col-xs-6 logo-tip">
                <i class="iconfont icon-icon053"></i> <span>注册</span>
            </div>
            <div class="col-xs-6" style="text-align: right">
                <a href="login.jsp">已有账号？ 登录</a>
            </div>
        </div>
        <!-- Nav tabs -->
        <ul class="tabs-menu">
            <li class="active"><a href="#email" data-toggle="tab">邮箱注册</a></li>
            <li><a href="#phone" data-toggle="tab">手机注册</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane active" id="email">
                <div class="login-box-body">

                    <form>
                        <div class="form-group has-feedback">
                            <input type="email" class="form-control" placeholder="邮箱">
                            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="password" class="form-control" placeholder="登录密码">
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <div class="row">
                                <div class="col-xs-6">
                                    <input type="password" class="form-control" placeholder="验证码">
                                    <span class="glyphicon glyphicon-lock form-control-feedback" style="right: 15px;"></span>
                                </div>
                                <div class="col-xs-6" style="text-align: right">
                                    <img src="img/captcha.png" alt="" style="border: 1px solid #ccc; height: 34px;">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="checkbox icheck">
                                    <label>
                                        <input type="checkbox"> 已阅读并接受 <a href="">服务协议</a>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <!-- /.col -->
                            <div class="col-xs-12">
                                <button type="submit" class="btn btn-primary btn-block btn-flat">接受服务协议并注册</button>
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
                            <div class="col-xs-12">
                                <div class="checkbox icheck">
                                    <label>
                                        <input type="checkbox"> 已阅读并接受 <a href="">服务协议</a>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <!-- /.col -->
                            <div class="col-xs-12">
                                <button type="submit" class="btn btn-primary btn-block btn-flat">接受服务协议并注册</button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>
                </div>
                <!-- /.login-box-body -->
            </div>
        </div>

        <div class="social-auth-links">
            <p>- OR -</p>
            <a style="margin-left:0" href="#"><i class="iconfont icon-qq"></i></a>
            <a href="#"><i class="iconfont icon-weixin"></i></a>
            <a href="#"><i class="iconfont icon-weibo"></i></a>
            <a href="#"><i class="iconfont icon-github1"></i></a>
        </div>

    </div>
</div>
<!-- /.login-box -->

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

</body>
</html>