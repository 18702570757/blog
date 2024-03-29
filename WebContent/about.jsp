<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>一个站在web设计之路的技术员个人博客网站</title>
<meta name="keywords" content="个人博客,杨青个人博客,个人博客模板,杨青" />
<meta name="description" content="杨青个人博客，是一个站在web前端设计之路的女程序员个人网站，提供个人博客模板免费资源下载的个人原创网站。" />
<link href="css/base.css" rel="stylesheet">
<link href="css/about.css" rel="stylesheet">
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
    <div class="banner">
      <p data-scroll-reveal="enter top over 2s">我们不停的翻弄着回忆，却再也找不回那时的自己</p>
      <p data-scroll-reveal="enter left over 2s after 1s">人生，是一场盛大的遇见。若你懂得，就请珍惜。</p>
      <p data-scroll-reveal="enter bottom over 2s after 2s">无论下多久的雨，最后都会有彩虹；无论你多么悲伤，要相信幸福在前方等候.</p>
    </div>
    <div class="memorial_day">
      <div class="time_axis"></div>
      <ul>
        <li class="n1"><a href="/">前端入行</a>
          <div class="dateview">2009</div>
        </li>
        <li class="n2"><a href="/">创建个人博客</a>
          <div class="dateview">2011-01-12</div>
        </li>
        <li class="n3"><a href="/">分享第一个博客模板</a>
          <div class="dateview">2013-06-08</div>
        </li>
        <li class="n4"><a href="/">制作第一个html5模板</a>
          <div class="dateview">2013-08-08</div>
        </li>
        <li class="n5"><a href="/">模板更换为时间轴</a>
          <div class="dateview">2017-09-08</div>
        </li>
      </ul>
    </div>
    <div class="about left">
  <h2>Just about me</h2>
 <%-- <c:if test="${sessionScope.about==null}"><%response.sendRedirect("/admin/User?action=user");%></c:if> --%>
    <ul> 
     <p>杨青，女，一个80后草根女站长！09年入行。从搬砖一样的生活方式换成了现在有“单”而居的日子。当然这个单不是单身的单，跟我的职业相比，爱情脱单并不是问题！虽然极尽苛刻的征婚条件但也远不及客户千奇百怪的要求。告别了朝九晚五，躲过了风吹日晒，虽然不再有阶梯式的工资，但是偶尔可以给自己放放假，挽着老公，一起轻装旅行。</p>
<p>
人生就是一个得与失的过程，而我却是一个幸运者，得到的永远比失去的多。生活的压力迫使我放弃了轻松的前台接待，放弃了体面的编辑，换来虽有些蓬头垢面的工作，但是我仍然很享受那些熬得只剩下黑眼圈的日子，因为我在学习使用Photoshop、Flash、Dreamweaver、ASP、PHP、JSP...中激发了兴趣，然后越走越远....</p>
<p>在这条路上，我要感谢三个人，第一个是我从事编辑的老板，是他给了我充分学习研究div的时间，第二个人是我的老师，如果不是街上的一次偶遇，如果不是因为我正缺钱，我不会去强迫自己做不会的事情，但是金钱的诱惑实在是抵挡不了，于是我选择了“接招”，东拼西凑的把一个网站做好了，当时还堪称佳作的网站至今已尘归尘土归土了。第三个人，我总说他是我的伯乐，因为我当初应聘技术员的时候，我说我什么都不会，但是他却给了我机会，而我就牢牢的把握了那次机会，直到现在如果不是我主动把域名和空间转出来，我会一直霸占着公司资源，免费下去（可我就偏偏不是喜欢爱占便宜的人，总感觉欠了就得还）...</p>
<p>
还要特别感谢一个人，是我的老公。他是我的百科，我不会的，他会，最后我还是不会。博客能做到今天这样，一半都有他的功劳。他不仅仅支持我的事业作为我有力的经济后盾，还毫无怨言的包容我所有工作、生活当中有理无理的坏脾气，曾经我是多么有自己原则的一个人，但是遇到他，打破了我自己毕生坚持的原则，喜欢一句话“冥冥中该来则来，无处可逃”。
</p>
    <!-- </ul>
    <h2>About my blog</h2>
    <p>域  名：www.yangqq.com 创建于2011年01月12日 </p>
    <p>服务器：阿里云服务器<a href="https://promotion.aliyun.com/ntms/act/ambassador/sharetouser.jsp?userCode=8smrzoqa&amp;productCode=vm" target="_blank" class="blog_link">购买空间</a><a href="/jstt/web/2014-01-18/644.html" target="_blank" class="blog_link">参考我的空间配置</a></p>
    <p>程  序：PHP 帝国CMS7.0</p> -->


</div>
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
