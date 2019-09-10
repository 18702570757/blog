<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gb2312">
<title>一个站在web前端设计之路的技术员个人博客网站</title>
<meta name="keywords" content="个人博客" />
<meta name="description" content="个人博客，是一个站在web前端设计之路的程序员个人网站。" />
<link href="css/base.css" rel="stylesheet">
<link href="css/msh.css" rel="stylesheet">
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
    <h2 class="ctitle"><b>慢生活</b> <span>“慢生活”不是懒惰，放慢速度不是拖延时间，而是让我们在生活中寻找到平衡。 </span></h2>
    <div class="photowall">
      <ul class="wall_a">
        <li><a href="/"><img src="images/p01.jpg">
          <figcaption>
            <h2>不再因为别人过得好而焦虑，在没有人看得到你的时候依旧能保持节奏 </h2>
          </figcaption>
          </a></li>
        <li><a href="/"><img src="images/p02.jpg">
          <figcaption>
            <h2>只会幻想而不行动的人，永远也体会不到收获果实时的喜悦。</h2>
          </figcaption>
          </a></li>
        <li><a href="/"><img src="images/p03.jpg">
          <figcaption>
            <h2>青春就像一只容器，装满了不安躁动青涩与偶尔的疯狂。</h2>
          </figcaption>
          </a></li>
        <li>
          <p class="text_a"><a href="/">一个人最好的模样大概是平静一点，坦然接受自己所有的弱点，不再因为别人过得好而焦虑，在没有人看得到你的时候依旧能保持节奏......</a></p>
        </li>
        <li><a href="/"><img src="images/p04.jpg">
          <figcaption>
            <h2>当走过了曾经隐忍的年月再回首时，我才发现，曾经觉得难以启齿的往事，都不过是沧海一粟，生命给予我的，不是那些艰难，而是成长，是学会举重若轻，是将曾经无法释怀的那些过往，统统放下。 </h2>
          </figcaption>
          </a></li>
        <li>
          <p class="text_b"><a href="/">逃避自己的人，最终只能导致自己世界的崩塌，而变得越来越没有安全感。</a></p>
        </li>
        <li><a href="/"><img src="images/p05.jpg">
          <figcaption>
            <h2>不再因为别人过得好而焦虑，在没有人看得到你的时候依旧能保持节奏 </h2>
          </figcaption>
          </a></li>
        <li><a href="/"><img src="images/p06.jpg">
          <figcaption>
            <h2>不再因为别人过得好而焦虑，在没有人看得到你的时候依旧能保持节奏 </h2>
          </figcaption>
          </a></li>
      </ul>
    </div>
    <ul class="cbp_tmtimeline">
    <c:if test="${requestScope.idlist == null}"><%response.sendRedirect("IndexServlet?action=toindex"); %></c:if>
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
    <div class="page">共<a title="Total record"><b>${sessionScope.totalCount}</b> </a>条记录<a href="IndexServlet?action=tomsh&pageIndex=${param.pageIndex - 1}">&lt;</a><c:forEach begin="${param.pageIndex > (param.pageIndex + 4) / 2 ? param.pageIndex : param.pageIndex - param.pageIndex + 1}" var="i" end="${sessionScope.totalPage > param.pageIndex + 4 ? param.pageIndex + 4 : sessionScope.totalPage}"><a href="IndexServlet?action=tomsh&pageIndex=${i}"><span <c:if test="${param.pageIndex == i}">style="color:red"</c:if> >${i}</span></a></c:forEach><a href="IndexServlet?action=tomsh&pageIndex=${param.pageIndex + 1}">&gt;</a></div>
  </div>
  </aside>
</article>
<!-- <footer>Design by 别爱我，没结果团队</footer> -->
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