<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link type="text/css" rel="stylesheet" href="css/H-ui.css"/>
<link type="text/css" rel="stylesheet" href="css/H-ui.admin.css"/>
<link type="text/css" rel="stylesheet" href="font/font-awesome.min.css"/>
<title>修改用户</title>
</head>
<body>

<div class="pd-20">
  <div class="Huiform">
    <form action="User?action=update" method="POST">
    <input type="hidden" value="${user.userid}" name="userid">
      <table class="table table-bg">
        <tbody>
     <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 密码：</th>
            <td><input type="text" style="width:200px" class="input-text" value="${user.password }" placeholder="" id="user-pwd" name="password" datatype="*2-16" nullmsg="密码不能为空"></td>
          </tr>
          <tr>
            <th class="text-r">头像：</th>
            <td><input type="file" class="" name="headImg" multiple value="${user.headImg }"></td>
          </tr>
        
          <tr>
            <th class="text-r">简介：</th>
            <td><textarea class="input-text" name="intro" value="${user.intro }" id="user-info" style="height:100px;width:300px;"></textarea></td>
          </tr>
          <tr>
            <th></th>
            <td><button class="btn btn-success radius" type="submit"><i class="icon-ok">修改</i> </button>
            <button class="" type="submit" style="margin-left:100px;"><i class=""></i>取消</button></td>
          </tr>
    
        </tbody>
      </table>
    </form>
  </div>
</div>
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="js/Validform_v5.3.2_min.js"></script> 
<script type="text/javascript" src="js/H-ui.js"></script> 
<script type="text/javascript" src="js/H-ui.admin.js"></script> 
<script type="text/javascript">
$(".Huiform").Validform(); 
</script>
<script>
var _hmt = _hmt || [];
(function() { 
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F080836300300be57b7f34f4b3e97d911' type='text/javascript'%3E%3C/script%3E"));
</script>
</body>
</html>