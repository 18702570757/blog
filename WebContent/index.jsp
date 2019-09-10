<%@page import="com.blog.servicesImpl.ArticleServiceImpl"%>
<%@page import="com.blog.services.ArticleService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>一个站在web设计之路的技术员个人博客网站</title>
		<meta name="keywords" content="个人博客" />
		<meta name="description" content="个人博客，是一个站在web前端设计之路的程序员个人网站。" />
		<link href="css/base.css" rel="stylesheet">
		<link href="css/index.css" rel="stylesheet">
		<script src="js/scrollReveal.js"></script>
		<script src="js/jquery.min.js" type="text/javascript"></script>
		<script src="js/jquery.cookie.js" type="text/javascript"></script>
		<script src="js/changeskin.js" type="text/javascript"></script>
	</head>
	<body>
		<c:if test="${requestScope.idlist == null}"><%response.sendRedirect("IndexServlet?action=toindex"); %></c:if>
		<!--  <header>
			<div class="logo" data-scroll-reveal="enter right over 1s"><a href="/"><img src="images/logo.png"></a></div>
			<nav class="topnav" data-scroll-reveal="enter bottom over 1s after 1s"><a href="index.jsp"><span>首页</span><span
					 class="en">Home</span></a><a href="about.jsp"><span>关于我</span><span class="en">About</span></a><a href="IndexServlet?action=tomsh"><span>慢生活</span><span
					 class="en">Life</span></a><a href="learn.jsp"><span>碎言碎语</span><span class="en">Doing</span></a><a href="mbfx.jsp"><span>模板分享</span><span
					 class="en">Share</span></a><a href="learn.jsp"><span>学无止境</span><span class="en">Learn</span></a><a href="gbook.jsp"><span>留言</span><span
					 class="en">Saying</span></a></nav>
		</header>  -->
		<%@include file="header.jsp" %>
		<article>
			<div class="container">
				<div class="blog" data-scroll-reveal="enter top">
					<c:forEach items="${requestScope.hotarticle}" var="i">
					<figure>
						<ul>
							<a href="ArticleServlet?flag=all&id=${i.aid}"><img src="images/t0${i.aid % 3 + 1}.jpg"><span>访问人数：${i.vcount}</span></a>
						</ul>
						<p><a href="ArticleServlet?flag=all&id=${i.aid}">${i.atitle}</a></p>
						<figcaption>${i.asummary}</figcaption>
					</figure>
					</c:forEach>
				</div>
				<ul class="cbp_tmtimeline">
				<c:forEach var="i" items="${requestScope.idlist}">
					<li>
						<time class="cbp_tmtime"><span><fmt:formatDate value="${i.adate}" pattern="MM/dd"/></span> <span><fmt:formatDate value="${i.adate}" pattern="YYYY"/></span></time>
						<div class="cbp_tmicon"></div>
						<div class="cbp_tmlabel" data-scroll-reveal="enter right over 1s">
							<h2>${i.atitle}</h2>
							<p><span class="blogpic"><a href="/"><img src="images/t0${i.aid % 3 + 1}.jpg"></a></span>${i.asummary}</p>
							<a href="ArticleServlet?flag=all&id=${i.aid}"  class="readmore">阅读全文&gt;&gt;</a>
							<br />
							<p>posted@<fmt:formatDate value="${i.adate}" pattern="MM-dd HH:ss"/> ${i.tname} 阅读数(${i.vcount}) 评论(${i.ccount})</p>
						</div>
					</li>
				</c:forEach>
				</ul>
			</div>
		</article>
		<!-- <footer>
			Design by 别爱我，没结果团队
		</footer> -->
		<%@include file="footer.jsp" %>
		<script>
			if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
				(function() {
					window.scrollReveal = new scrollReveal({
						reset: true
					});
				})();
			};
		</script>
	</body>
</html>
