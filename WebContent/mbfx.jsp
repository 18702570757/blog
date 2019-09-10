<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.blog.entity.*,com.blog.servicesImpl.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta charset="gb2312">
<title>一个站在web设计之路的技术员个人博客网站</title>
<meta name="keywords" content="个人博客,杨青个人博客,个人博客模板,杨青" />
<meta name="description" content="杨青个人博客，是一个站在web前端设计之路的女程序员个人网站，提供个人博客模板免费资源下载的个人原创网站。" />
<link href="css/base.css" rel="stylesheet">
<link href="css/share.css" rel="stylesheet">
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/jquery.cookie.js" type="text/javascript"></script>
<script src="js/changeskin.js" type="text/javascript"></script>
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
<script src="js/scrollReveal.js"></script>
</head>

<body>
<!-- <header>
  <div class="logo" data-scroll-reveal="enter right over 1s"><a href="/"><img src="images/logo.png"></a></div>
  <nav class="topnav" data-scroll-reveal="enter bottom over 1s after 1s"><a href="index.jsp"><span>首页</span><span class="en">Home</span></a><a href="about.jsp"><span>关于我</span><span class="en">About</span></a><a href="manshenghuo.jsp"><span>慢生活</span><span class="en">Life</span></a><a href="learn.jsp"><span>碎言碎语</span><span class="en">Doing</span></a><a href="mbfx.jsp"><span>模板分享</span><span class="en">Share</span></a><a href="learn.jsp"><span>学无止境</span><span class="en">Learn</span></a><a href="gbook.jsp"><span>留言</span><span class="en">Saying</span></a></nav>
</header> -->
<%@include file="header.jsp" %>
<article>
  <div class="container">
     <h2 class="ctitle"><b>文章分类</b> <span>好咖啡要和朋友一起品尝，好“模板”也要和同样喜欢它的人一起分享。</span></h2>
     <c:if test="${sessionScope.tlist==null}"><%response.sendRedirect("ArticleServlet?flag=getAllByType");%> </c:if>
       <div class="blog" data-scroll-reveal="enter top" >
     <div class="mnav">
      <ul >
    <c:forEach var="tr" items="${sessionScope.tlist}">
        <li><a href="ArticleServlet?flag=getAllByTid&id=${tr.t_id}">${tr.t_name}</a></li>
    </c:forEach>
      </ul>
      </div>
     
     <p style="clear:both"></p>
   
   
     <c:forEach var="ar" items="${sessionScope.alist}">
      <figure>
         <a href="ArticleServlet?flag=all&id=${ar.aid}"><img src="images/t01.jpg"><span>${ar.atitle}</span></a>
        <p><a href="ArticleServlet?flag=all&id=${ar.aid}">${ar.atitle}</a></p>
        <figcaption>${ar.asummary}</figcaption>
      </figure>
     </c:forEach>
   
    </div>
    <div class="page"><a title="Total record"><b>107</b> </a><b>1</b><a href="/news/index_2.html">2</a><a href="/news/index_3.html">3</a><a href="/news/index_4.html">4</a><a href="/news/index_5.html">5</a><a href="/news/index_2.html">&gt;</a><a href="/news/index_5.html">&gt;&gt;</a></div>
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
</body>
</html>