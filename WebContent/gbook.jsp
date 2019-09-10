<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gb2312">
<title>一个站在web设计之路的技术员个人博客网站</title>
<meta name="keywords" content="个人博客,杨青个人博客,个人博客模板,杨青" />
<meta name="description" content="杨青个人博客，是一个站在web前端设计之路的女程序员个人网站，提供个人博客模板免费资源下载的个人原创网站。" />
<link href="css/base.css" rel="stylesheet">
<link href="css/book.css" rel="stylesheet">
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
    <h2 class="ctitle"><b>留言板</b> <span>你，生命中最重要的过客，之所以是过客，因为你未曾为我停留。</span></h2>
    <div class="gbook">
      <div class="about">
        <div id="fountainG">
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
        </div>
<!-- 来必力City版安装代码 -->
<div id="lv-container" data-id="city" data-uid="MTAyMC80NTEzNS8yMTY1Mg==">
<script type="text/javascript">
   (function(d, s) {
       var j, e = d.getElementsByTagName(s)[0];

       if (typeof LivereTower === 'function') { return; }

       j = d.createElement(s);
       j.src = 'https://cdn-city.livere.com/js/embed.dist.js';
       j.async = true;

       e.parentNode.insertBefore(j, e);
   })(document, 'script');
</script>
<noscript>为正常使用来必力评论功能请激活JavaScript</noscript>
</div>
<!-- City版安装代码已完成 -->
        <!-- <div class="about_girl"><span><a href="/"><img src="images/girl.jpg"></a></span>
          <p>当您驻足停留过，从此便注定我们的缘分。站在时间的尽头，我们已是朋友，前端的路上我再也不用一个人独自行走。</p>
        </div> -->
      </div>
    </div>
  </div>
  </aside>
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