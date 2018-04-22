<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="baidu-site-verification" content="2EGsKUN13v" />
<title>博客专区 - iyeeku</title>
<%@ include file="header.jspf" %>
	<style type="text/css">
	
	*{
		box-sizing: border-box;
	}

	body{
		background-color: #f5f5f5;
		font-family: "Pingfang SC", "STHeiti", "Lantinghei SC", "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei", "WenQuanYi Micro Hei", SimSun, sans-serif;
	}
	
	a,a:hover,a:visited,a:active,a:link{
		text-decoration: none;
	    color: #6a6a6a;
	}
	.vertical{
		display: flex;
	    -webkit-box-align: center;
	    -webkit-align-items: center;
	    -ms-grid-row-align: center;
	    -ms-flex-align: center;
	    align-items: center;
	}
	
	.question-head{
		width:100%;
		height: 70px;
		background:url(${pageContext.request.contextPath}/images/blog-header-banner.jpg);
	    background-repeat: no-repeat;
	    background-position: center;
	    background-size: cover;
	}
	.head-content,.nav-question{
		width:1200px;
		margin:auto;
	}
	.head-content{
		height:56px;
		position: relative;
	}
	.question-link .lfont{
		font-size: 2.5em;
	    font-weight: 900;
	    font-family: Microsoft JhengHei;
	}
	.question-link .rfont{
	    font-size: 1.8em;
    	font-family: STKaiti;
	    line-height: 30px;
	    background-color: #33b36d;
	    height: 30px;
	    border-radius: 3px;
	    width: 70px;
	    text-align: center;
	    color: #ffffff;
	    font-weight: 100;
	    margin-left: 5px;
	}
	.quiz{
	    font-size: 16px;
	    height: 22px;
	    padding: 0 14px;
	    position: relative;
	    color: #3db159!important;
	}
	.quiz-line:after{
	    position: absolute;
	    top: 10%;
	    right: 0;
	    width: 1px;
	    height: 80%;
	    content: '';
	    background: #3db159;
	}
	.question-search{
		float: right;
	    position: absolute;
	    right: 0px;
	    height: 56px;
	}
	.search-border{
		width: 282px;
		text-align:center;
	}
	.search-text{
		font-size: 1.5rem;
	    width: 280px;
	    height: 30px;
	    padding: 0 50px 0 14px;
	    color: #111;
	    border: none;
	    border-radius: 1.5em;
	    outline: 0;
	    background: #ffffff;
	}
	.search-button{
	    position: absolute;
    	top: 0;
	    right: 0;
	    width: 40px;
	    height: 30px;
	    padding: 0;
	    cursor: pointer;
	    transition: background .2s;
	    border: none;
	    border-top-right-radius: 1em;
	    border-bottom-right-radius: 1em;
	    outline: 0;
	    background: url(${pageContext.request.contextPath}/images/ic_search.svg) center center no-repeat;
	    background-size: 16px 16px;
	}
	.main-content{
	    overflow: hidden;
	    width: 900px;
	    padding: 20px 30px;
	    background-color: #fff;
	    float:left;
	}
	.other-content{
	    overflow: hidden;
	    width: 270px;
	    margin: 20px 0 0 30px;
	    float:right;
	}
	.tabs-menu{
		display: -webkit-box;
	    border-bottom:1px solid #ddd;
	}
	.tabs-menu .que-tab{
		font-size: 18px;
	  /*   font-weight: 700; */
	    line-height: 46px;
	    height: 46px;
	    display: block;
	    padding: 0 25px;
	    text-align: center;
	    color: #6a6a6a;
	}
	.tabActivited{
	    color: #4eaa4c;
	    border-bottom:2px solid #4eaa4c;
	}
	
	.blog-nav {
    	padding: 25px 0;
    	list-style: none;
	}
	
	.blog-nav li a {
		font-size:16px;
    	padding-left: 25px;
    	color: #111111;
    	display: block;
    	line-height: 44px;
    	cursor: pointer;
	}
	
	.blog-nav li a:HOVER{
		background-color: #fff;
	}
	
	.blog-nav .active{
		background: #fff;
	}
	
	
	/* blog */
	
	*, :after, :before {
    	box-sizing: border-box;
	}
	
	.vertical {
    	-webkit-box-align: center;
    	-webkit-align-items: center;
    	-ms-grid-row-align: center;
    	-ms-flex-align: center;
    	align-items: center;
	}

	.box {
    	display: -webkit-box;
    	display: -webkit-flex;
    	display: -ms-flexbox;
    	display: flex;
	}
	
	.blog-list .item {
    	margin: 18px 0 0;
    	padding: 12px 10px;
	}
	
	.box-fl {
    	transition: width .2s;
    	-ms-flex-order: 1;
    	-webkit-order: 1;
    	-webkit-box-ordinal-group: 2;
    	order: 1;
	}
	
	.box-aw {
    	min-width: 0;
    	-webkit-transition: width .2s;
    	transition: width .2s;
    	-ms-flex-order: 2;
    	-webkit-order: 2;
    	-webkit-box-ordinal-group: 3;
    	order: 2;
    	-webkit-box-flex: 1;
    	-webkit-flex: 1;
    	-ms-flex: 1;
    	flex: 1;
	}
	
	.blog-list .item .blog-author {
    	width: 50px;
    	height: 50px;
    	margin: 0 10px;
    	border-radius: 50%;
	}
	
	.box-aw img {
    	width: 100%;
    	max-width: intrinsic;
    	max-width: -moz-fit-content;
    	max-width: -webkit-fit-content;
    	height: auto;
	}
	
	[type=button], img {
    	border: none;
    	outline: 0;
	}
	
	.sc.overh {
    	overflow: hidden;
	}
	
	.sc.text-ellipsis {
    	overflow: hidden;
    	white-space: nowrap;
    	text-overflow: ellipsis;
	}
	
	.blog-list .item .blog-title-link {
    	display: block;
    	-webkit-flex-shrink: 1;
    	-ms-flex-negative: 1;
    	flex-shrink: 1;
	}
	
	.blog-list .item .blog-name {
    /* 	font-size: 1.125rem; */
    	font-weight: 400;
    	line-height: 26px;
    	height: 26px;
    	margin: 0 6px 0 0;
    	color: #000;
	}
	
	.blog-list .item .blog-tag {
    	/* font-size: .875em; */
    	line-height: 20px;
    	display: block;
    	width: 20px;
    	min-width: 20px;
    	margin: 0 3px;
    	text-align: center;
    	border-radius: 50%;
	}
	
	.blog-list .item .blog-tag.yuan {
    	color: #51bae3;
    	-webkit-box-shadow: inset 0 0 0 1px #51bae3;
    	box-shadow: inset 0 0 0 1px #51bae3;
	}
	.blog-list .item .blog-tag.jian {
    	color: #e35050;
    	-webkit-box-shadow: inset 0 0 0 1px #e35050;
    	box-shadow: inset 0 0 0 1px #e35050;
	}
	
	.blog-list .item .blog-brief {
    	font-size: 14px;
    	line-height: 20px;
    	overflow: hidden;
    	height: auto;
    	max-height: 40px;
    	margin: 4px 0 6px;
    	text-align: justify;
    	text-justify: inter-ideograph;
    	word-break: initial;
    	word-break: break-word;
    	color: #6a6a6a;
	}
	
	.sc .text-gradient {
    	position: relative;
    	overflow: hidden;
	}
	
	*, :after, :before {
    	box-sizing: border-box;
	}
	
	.blog-list .item .blog-brief:after {
    	position: absolute;
    	right: 0;
    	bottom: 0;
    	display: block;
    	width: 160px;
    	height: 20px;
    	content: '';
    	background: -webkit-linear-gradient(left,rgba(255,255,255,0),#fff 96%);
    	background: -webkit-gradient(linear,left top,right top,from(rgba(255,255,255,0)),color-stop(96%,#fff));
    	background: linear-gradient(to right,rgba(255,255,255,0),#fff 96%);
	}
	
	.blog-list .item .blog-footer-box {
    	/* font-size: .75rem; */
    	line-height: 20px;
    	color: #9d9d9d;
	}
	
	.blog-list .item .blog-footer-box span {
    	padding-right: .5em;
	}
	
	/* hot */
	.recommend-tops .toolbox {
    	height: 20px;
	}
	
	.recommend-tops .toolbox h1 {
    	/* font-size: 1.125rem; */
    	font-size :20px;
    	font-weight: 400;
    	line-height: 20px;
    	margin: 0;
    	color: #111;
	}
	
	.weekly h1 {
    	margin: 19px 0 15px;
	}
	
	.weekly h1 {
    	font-size: 20px;
    	font-weight: 400;
    	line-height: 38px;
    	color: #6a6a6a;
    	-webkit-box-shadow: inset 0 -1px 0 0 #ddd;
    	box-shadow: inset 0 -1px 0 0 #ddd;
	}
	
	.img-wrapper a {
    	margin-bottom: 10px;
    	-webkit-transition: all .3s;
    	transition: all .3s;
    	opacity: .85;
	}
	
	.box.justify {
    	-webkit-justify-content: space-between;
    	justify-content: space-between;
    	-ms-flex-pack: justify;
    	-moz-box-pack: justify;
    	-webkit-box-pack: justify;
	}
	
	.weekly img {
    	width: 48px;
    	height: 48px;
    	border-radius: 50%;
	}
	
	.weekly .img-wrapper .title {
    	/* font-size: 1rem; */
    	font-size : 16px;
    	overflow: hidden;
    	white-space: nowrap;
    	text-overflow: ellipsis;
    	color: #333;
	}
	
	.img-wrapper{
		padding-bottom: 15px;
	}
	
	.weekly .img-wrapper .post {
    	/* font-size: .875rem; */
    	color: #999;
	}
	
	.hide {
    	display: none;
    	opacity: 0;
	}
	
	.icon-svg{
	    vertical-align: middle;
	    display: inline-block;
	    background-size: contain!important;
   	}
	
	.ic-demo1{
   	    width: 20px;
  		height: 20px;
	    margin-right: 10px;
  		background: url(${pageContext.request.contextPath}/svg/demo1.svg) center no-repeat;
   	}
   	
   	.ic-demo2{
   	    width: 20px;
  		height: 20px;
	    margin-right: 10px;
  		background: url(${pageContext.request.contextPath}/svg/demo2.svg) center no-repeat;
   	}
   	
   	.ic-demo3{
   	    width: 20px;
  		height: 20px;
	    margin-right: 10px;
  		background: url(${pageContext.request.contextPath}/svg/demo3.svg) center no-repeat;
   	}
	
	
	.ic-demo4{
   	    width: 20px;
  		height: 20px;
	    margin-right: 10px;
  		background: url(${pageContext.request.contextPath}/svg/demo4.svg) center no-repeat;
   	}
   	
   	.ic-demo5{
   	    width: 20px;
  		height: 20px;
	    margin-right: 10px;
  		background: url(${pageContext.request.contextPath}/svg/demo5.svg) center no-repeat;
   	}
   	
   	.ic-demo6{
   	    width: 20px;
  		height: 20px;
	    margin-right: 10px;
  		background: url(${pageContext.request.contextPath}/svg/demo6.svg) center no-repeat;
   	}
   	
   	.ic-demo7{
   	    width: 20px;
  		height: 20px;
	    margin-right: 10px;
  		background: url(${pageContext.request.contextPath}/svg/demo7.svg) center no-repeat;
   	}
   	
   	.ic-demo8{
   	    width: 20px;
  		height: 20px;
	    margin-right: 10px;
  		background: url(${pageContext.request.contextPath}/svg/demo8.svg) center no-repeat;
   	}
   	
   	.ic-demo9{
   	    width: 20px;
  		height: 20px;
	    margin-right: 10px;
  		background: url(${pageContext.request.contextPath}/svg/demo9.svg) center no-repeat;
   	}
   	
   .ic-demo10{
   	    width: 20px;
  		height: 20px;
	    margin-right: 10px;
  		background: url(${pageContext.request.contextPath}/svg/demo10.svg) center no-repeat;
   	}
   	
    .ic-demo11{
   	    width: 20px;
  		height: 20px;
	    margin-right: 10px;
  		background: url(${pageContext.request.contextPath}/svg/demo11.svg) center no-repeat;
   	}
   	
   	.ic-demo12{
   	    width: 20px;
  		height: 20px;
	    margin-right: 10px;
  		background: url(${pageContext.request.contextPath}/svg/demo12.svg) center no-repeat;
   	}
   	
   	.ic-demo13{
   	    width: 20px;
  		height: 20px;
	    margin-right: 10px;
  		background: url(${pageContext.request.contextPath}/svg/demo13.svg) center no-repeat;
   	}
   	
   	.ic-demo14{
   	    width: 20px;
  		height: 20px;
	    margin-right: 10px;
  		background: url(${pageContext.request.contextPath}/svg/demo14.svg) center no-repeat;
   	}
   	
	</style>
	
	<script type="text/javascript">
		$(function(){
			
			$(".box.item").hover(function(){
				$(this).css({background:'#f4f4f4'});
			},function(){
				$(this).css({background:'#ffffff'});
			});
			
			
			$("#blog-content-switcher").children().click(function(){
				if(!$(this).hasClass("tabActivited")){
					$(this).addClass("tabActivited").siblings().removeClass("tabActivited");
					$(".blog-list").addClass("hide");
					var index = $(this).index();
 					switch(index){
						case 0: $("#topsOfRecommend").removeClass("hide");break;
						case 1: $("#topsOfToday").removeClass("hide");break;
						case 2: $("#topsOfWeek").removeClass("hide");break;
						case 3: $("#topsOfNew").removeClass("hide");break;
						case 4: $("#topsOfDaily").removeClass("hide");break;
						default:console.info("错误!");
					} 
				}
				
			});
			
			
		})
	
	
	</script>
	
</head>
<body>

<%@ include file="nav.jspf" %>

    <div style="width:100%;height: 100%;">
    	
    	<div class="vertical question-head">
    		<div class="vertical head-content">
    			<div class="vertical header-left">
    				<div style="float:left">
	    				<a class="vertical question-link" href="${pageContext.request.contextPath}/blog" style="cursor: pointer;">
		    				<label class="lfont" style="cursor: pointer;">开源</label>
		    				<label class="rfont" style="cursor: pointer;">博客</label>
	    				</a>
    				</div>
    			</div>
    			<div class="vertical question-search">
    				<div class="search-border" style="position: relative;">
	    				<input type="text" class="search-text" placeholder="在 43368 款开源软件中搜索" name="searchContent" />
	    				<button type="submit" class="search-button"></button>
    				</div>
    			</div>
    		</div>
    	</div>
    	
    	<div class="nav-question">
    		<div class="main-content">
    			<div class="recommend-tops" style="width: 100%;height: 275px;background-color: gray;margin-bottom: 30px;">
    				<div class="toolbox box vertical">
    					<div class="box-aw">
    						<h1>精彩阅读</h1>
    					</div>
    					
    					
    				</div>
    			</div>
    			<div class="tabs-menu" id="blog-content-switcher">
                    <a class="que-tab tabActivited" href="javascript:void(0);">最新推荐</a>
                    <a class="que-tab" href="javascript:void(0);">今日热门</a>
                    <a class="que-tab" href="javascript:void(0);">本周热门</a>
                    <a class="que-tab" href="javascript:void(0);">每日一搏</a>
                    <a class="que-tab" href="javascript:void(0);">最新文章</a>
    			</div>
    			
    			<div id="topsOfRecommend" class="blog-list">
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">CentOS  搭建Postfix+Dovecot简单邮件系统</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							搭建Postfix+Dovecot邮件收发系统
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>IamOkay</span>
    							<span>发布于</span>
    							<span>50分钟前</span>
    							<span>阅读 26</span>
    						</div>
    					</div>
    				</div>
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">Android启动页解决方案</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							&gt;转载请注明出处：https://my.oschina.net/landptf/blog/861937 启动页几乎成为了每个app的标配，有些商家在启动页中增加了开屏广告以此带来更多的收入。目前启动页的广告都有倒计时的功能，那么我们在倒计时的过程中能做些什么呢？ 这篇文章主要包括以下两方面内容 &gt; - 集成腾讯广告联盟的SDK - 启动页加载过程中，后台初始化数据 我们在设计启动页时的常规做法是建立一个Activity来加载开屏图片或者广告，作为程序的入口，那么在这个三到五秒时间内如果进行数据下载，当用户点击了跳过按钮或者计时结束了数据还没初始化完成，已经进入了主页面，而主界面刚好需要那些基础数据该如何？ ![随机广告与移动无关](http://upload-images.jianshu.io/upload_images/589909-4c0ecc57b96f38fa.gif?imageMogr2/auto-orient/strip) 因此，我们将启动页和主界面设计成两个Fragment，集成到MainActivity中。这样我们在启动页中加载广告，在主界面中下载数据，登陆等耗时操作,程序的结构如下: ![结构](http://upload-images.jianshu.io/upload_images/589909-37fbe8d67f0e3f51.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240) **01 activity_main.xml** ``` ``` 包含了两个f...
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">MongoDB 存储引擎说明</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							#MongoDB 存储引擎说明 &gt; MongoDB 存储引擎可以插件化（3.0开始提供插件化API），根据不同的场景选择不同的存储引擎，跟Mysql有点类似。 &gt; MongoDB 常用存储引擎：`WiredTiger`，`MMAPv1`，`In Memory` #MongoDB 存储引擎之WiredTiger &gt; 3.2版本开始WiredTiger已经是MongoDB的默认存储引擎。 &gt; WiredTiger支持文档级别的锁，检查点（checkpoint），压缩，等功能。企业版支持Rest加密。 ##WiredTiger 特性 ####并发模型 WiredTiger带来最显著的改进之一就是锁粒度的细化，它通过MVCC（通过copyOnWrite的方式实现的多版本并发控制）实现了文档级别的锁（多个客户端可以并发的修改一个集合中多个不同的文档），大大提高了并发读写的性能。 ####数据压缩 WiredTiger带来的另一个显著提升是：通过使用高效的压缩算法对数据进行压缩，数据占用磁盘空间大大减少（最大能压缩80%的空间）。 压缩是以CPU计算为代价而减少了存储量，不过相比压缩带来的好处，牺牲这点CPU时间是值得的。 MongoDb支持对所有集合和索引（前缀）进行压缩。默认情况，WiredTiger通过snappy压缩算法对所有集合进行块压缩并对所有索引进行前缀压缩。Journal默认也会压缩。 ####内存使用 MongoDB不仅利用Wired...
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>花_现</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 24</span>
    							<span>点赞 1</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">[喵咪MQ(2)]RabbitMQ单机模式使用</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							哈喽!本周我们又见面了,今天呢我们接着说MQ软件RabbitMQ的故事,在上小节以及成功的安装了RabbitMQ也配置了开机启动,那么我们应该要开始的真正的接触并且使用它来管理使用解决业务问题,请紧张的往下看…
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>喵了_个咪</span>
    							<span>发布于</span>
    							<span>6小时前</span>
    							<span>阅读 14</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">【源资讯 第19期】苹果拒绝“热更新”， iOS 11 抛弃 32 位应用……程序界的与时俱进？！</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							【一周源资讯（2017.3.10-2017.3.17）】苹果发通谍拒绝“热更新”； iOS 11 将彻底放弃 32 位应用程序；Android 将加入 Java 8 的原生支持……不与时俱进，小心被小学生完虐！
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>编辑部的故事</span>
    							<span>发布于</span>
    							<span>13小时前</span>
    							<span>阅读  1329</span>
    							<span>评论 5</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">spring cloud netflix 微服务使用实例</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							想使用微服务，却不知从何入手的同学或者有如下疑问的，可以看看这个项目实例。 参考我在解决如下问题的思路，这里只是简单的介绍，更多的内容靠源码表达了。有时间再单独就微服务的每一块写博客。
    						</div>
    						<div class="box vertical blog-footer-box">
            					<span>丁丙乙甲</span>
            					<span>发布于</span>
            					<span>18小时前</span>
                        		<span>阅读 176</span>
    						</div>
    					</div>
    				</div>
    				
    				 <div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">厉害了，我的talent-aio，支撑17.82万TCP长连接只消耗800M内存</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							talent-aio最近得到公司大力支持，嗯，作者也终于有条件去测试talent-aio对TCP长连接数的支撑情况，所以最近一周都在对talent-aio进行拷机测试。看看下面的测试步骤以及测试结果吧。
    						</div>
    						<div class="box vertical blog-footer-box">
            					<span>talent-tan</span>
            					<span>发布于</span>
            					<span>18小时前</span>
                        		<span>阅读 491</span>
                                <span>评论 4</span>
                                <span>点赞 2</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">Thrift源码分析--TThreadedSelectorServer线程模型</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							Thrift的网路服务模型之一的 TThreadedSelectorServer 实现了多Reactor线程模型，请先理解线程模型再深入分析源码。线程模型的讲解此处不再赘述，给出一张总结图如下： ![TThreadedSelectorServer线程模型](http://note.youdao.com/yws/public/resource/2c4d04563f025a1e32bfc2056e3e64fb/xmlnote/E058E515F2A34415A19138E287AC12AA/10042 "TThreadedSelectorServer线程模型") 截图来自：[Thrift 服务模型和序列化机制深入学习](http://www.liuqianfei.com/article/065b0f1ee59a4cf0b94a84c4e33af127) 下面从一次完整的服务调用过程来分析源码： ### 1. 服务入口 先来看看服务入口函数 serve() ，TThreadedSelectorServer 的 serve() 方法继承自 AbstractNoblockingServer 抽象类。 ![serve()](http://note.youdao.com/yws/public/resource/2c4d04563f025a1e32bfc2056e3e64fb/xmlnote/47EB096440E5449E91FB1ADE8C4C7DA3/10164 "在这里输入图片标题") 其中startThread() 方法为抽象方法，在 TThreadedSelectorServer 中实现如下： ![startThread()](http://note.youdao.com/yws/public/resource/2c4d04563f025a1e32bfc2056e3e64fb/xmlnote/C3532B55BAD5406295CD9FF15739C6B...
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">一起KVM环境下windows7虚拟机异常死机（BSOD）的问题解决</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							先说一下环境： #一、硬件 ８台服务器做的超融合架构，软件存储池， 每台服务器是９６Ｇ内存，两颗Intel(R) Xeon(R) CPU E5-2670 0 @ 2.60GHz，３２线程。 每台服务器是１Ｔ　ＳＳＤ加三块４Ｔ　ＳＡＴＡ，无ｒａｉｄ卡，数据做的两副本。 服务器集成２个１Ｇ的网口，做端口聚合，对外提供服务。 另加一块四端口千兆网卡，做端口聚合，做内部数据传输。 #二、软件 基础系统是Ubuntu 16.04 LTS，基于ＫＶＭ，libvirt的虚拟化管理平台。 虚拟机：ｗｉｎｄｏｗｓ７中文专业版，３２位， 每台虚拟机分配３０７１Ｍ内存，两颗ＣＰＵ(2 sockets) 。 libvirt：1.3.1 #三、现象 服务器上的windows，不定时的会卡死，多数每天发生一次到两次，少数三四天卡死一次，极少数会间隔时间更久， 多数发生在电脑空闲时间， 能上互联网的虚拟机多发， 此外无其他明显规律。 #四、问题排查 ##１、先是排查了服务器配置，终端的配置，网络 　　因为这套架构已经在多地部署，并稳定运行多年，排查完客户的现场网络后，此原因基本排除。 ##２、后来怀疑存储的问题 使用iostat持续检测两台服务器的三个小时。 ``` iostat -x -m 1 ``` 从记录下的日志看服务器存储的平均响应时间一直在正常范围，读...
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">ubuntu数据自动备份,定时发送邮件到备份邮箱</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							三元湖的水，我数据全丢失的泪T_T!! ubuntu数据自动备份自动发送邮件到邮箱
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">Qt Creator 中配置 CPLEX 12.63 （MS VC++ 2010 compiler）</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							MS VC++ 2010 的IDE不怎么友好，Qt Creator 就趁手多了，通过在 .pro 文件配置宏和编译参数等，就可以用 Qt Creator 来写 CPLEX 应用了
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				
    			</div>
    			
    			
    			<% //TODO %>
    			<!-- 2222222222222222222222222222222222222222222222222222222 -->
    			<div id="topsOfToday" class="blog-list hide">
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">适合各种使用场景的长URL转短链接的完整解决方案开源了</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							首先我要说，开源托管，必须得 @红薯 家的。 上一次本人写过一篇博客《长URL转短连接的简单设计与实现》，由于写得比较仓促，因此是确实设计的，因此方案也是不完整的，看到大家非常有热情，阅读的阅读收藏的收藏，我就深深的为写了这么不够深入的博客而感到不安，于是就有了这一篇博客，以及背后的开源代码。 确实，这次花费时间比较多，大概有大半天的时间设计并写代码。 需求 首先说明一下这次的主要关注点： 可以满足多种场景下的短链接生成需求 可以满足多重序列号机制 可以满足多种短链接生成方式 自由&可扩展性--秉承一贯的设计原则，觉得框架实现的好就用，觉得不满足就替换之 主要接口说明 字符串生成接口 package org.tinygroup.shorter;
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>悠悠然然</span>
    							<span>发布于</span>
    							<span>13分钟前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">HBase数据模型与架构实现</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							hadoop-hbase笔记 ，文档中所示例的项目的地址 https://git.oschina.net/weiwei02/WHadoop
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>为为02</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">10分钟教你学会Yii2手动安装第三方扩展</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							&gt; 我们爱composer，但是总有一些我们需要的扩展还没有加入到composer大家庭，那么我们的大Yii2如何爱他们那？ 对于没有进入composer的扩展，请通通将他们下载到vendor内。通通的。 还是按照目录来 1. 添加不在composer，但是有自己的autoloader的扩展 2. 添加不在composer，也没有autoloader的扩展 3. 添加在composer里的扩展 4. 啥都没有的 那我们开始吧~ # 号外 先说说自动安装composer扩展吧，当复习了，这个我想是最简单的了，方法有两个 1. composer.json内修改，增加我们想要的扩展，然后执行composer install 2. 在当前程序目录直接命令行 composer required xxxxx 无论各种教程还是官方介绍最多的就是这个了，因此我不在多说，进入到今天的主题？ # 不composer，有autoloader 这种库也蛮多的，尤其一些已经有些年头有些粉丝的库，他们都有自己的autoloader加载器，今天北哥给你讲讲这种库怎么破！ 我们都知道入口文件index.php里有两个自动加载，一个是composer的、一个是自己的。 ```php require(__DIR__ . '/../vendor/autoload.php'); require(__DIR__ . '/../vendor/yiisoft/yii2/Yii.php'); ``` 你不知道？扒光拖出去，送往东莞。💀💀💀💀💀。 如果...
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>花_现</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 24</span>
    							<span>点赞 1</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">【源资讯 第20期】Python 真的超过 PHP 了；又有一波漏洞曝光，Linux、Gitlab 中招！</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							【一周源资讯（2017.3.18-2017.3.24）】Python 超过 PHP 了，不过语言只是一种工具，适合自己才是最好的！有时间我们来看看程序员提高编程能力的办法，还有围观一下近期爆出的几个重大安全漏洞。
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>编辑部的故事</span>
    							<span>发布于</span>
    							<span>6小时前</span>
    							<span>阅读 14</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">【源资讯 第19期】苹果拒绝“热更新”， iOS 11 抛弃 32 位应用……程序界的与时俱进？！</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							【一周源资讯（2017.3.10-2017.3.17）】苹果发通谍拒绝“热更新”； iOS 11 将彻底放弃 32 位应用程序；Android 将加入 Java 8 的原生支持……不与时俱进，小心被小学生完虐！
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>编辑部的故事</span>
    							<span>发布于</span>
    							<span>13小时前</span>
    							<span>阅读  1329</span>
    							<span>评论 5</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">spring cloud netflix 微服务使用实例</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							想使用微服务，却不知从何入手的同学或者有如下疑问的，可以看看这个项目实例。 参考我在解决如下问题的思路，这里只是简单的介绍，更多的内容靠源码表达了。有时间再单独就微服务的每一块写博客。
    						</div>
    						<div class="box vertical blog-footer-box">
            					<span>丁丙乙甲</span>
            					<span>发布于</span>
            					<span>18小时前</span>
                        		<span>阅读 176</span>
    						</div>
    					</div>
    				</div>
    				
    				 <div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">厉害了，我的talent-aio，支撑17.82万TCP长连接只消耗800M内存</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							talent-aio最近得到公司大力支持，嗯，作者也终于有条件去测试talent-aio对TCP长连接数的支撑情况，所以最近一周都在对talent-aio进行拷机测试。看看下面的测试步骤以及测试结果吧。
    						</div>
    						<div class="box vertical blog-footer-box">
            					<span>talent-tan</span>
            					<span>发布于</span>
            					<span>18小时前</span>
                        		<span>阅读 491</span>
                                <span>评论 4</span>
                                <span>点赞 2</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">Thrift源码分析--TThreadedSelectorServer线程模型</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							Thrift的网路服务模型之一的 TThreadedSelectorServer 实现了多Reactor线程模型，请先理解线程模型再深入分析源码。线程模型的讲解此处不再赘述，给出一张总结图如下： ![TThreadedSelectorServer线程模型](http://note.youdao.com/yws/public/resource/2c4d04563f025a1e32bfc2056e3e64fb/xmlnote/E058E515F2A34415A19138E287AC12AA/10042 "TThreadedSelectorServer线程模型") 截图来自：[Thrift 服务模型和序列化机制深入学习](http://www.liuqianfei.com/article/065b0f1ee59a4cf0b94a84c4e33af127) 下面从一次完整的服务调用过程来分析源码： ### 1. 服务入口 先来看看服务入口函数 serve() ，TThreadedSelectorServer 的 serve() 方法继承自 AbstractNoblockingServer 抽象类。 ![serve()](http://note.youdao.com/yws/public/resource/2c4d04563f025a1e32bfc2056e3e64fb/xmlnote/47EB096440E5449E91FB1ADE8C4C7DA3/10164 "在这里输入图片标题") 其中startThread() 方法为抽象方法，在 TThreadedSelectorServer 中实现如下： ![startThread()](http://note.youdao.com/yws/public/resource/2c4d04563f025a1e32bfc2056e3e64fb/xmlnote/C3532B55BAD5406295CD9FF15739C6B...
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">一起KVM环境下windows7虚拟机异常死机（BSOD）的问题解决</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							先说一下环境： #一、硬件 ８台服务器做的超融合架构，软件存储池， 每台服务器是９６Ｇ内存，两颗Intel(R) Xeon(R) CPU E5-2670 0 @ 2.60GHz，３２线程。 每台服务器是１Ｔ　ＳＳＤ加三块４Ｔ　ＳＡＴＡ，无ｒａｉｄ卡，数据做的两副本。 服务器集成２个１Ｇ的网口，做端口聚合，对外提供服务。 另加一块四端口千兆网卡，做端口聚合，做内部数据传输。 #二、软件 基础系统是Ubuntu 16.04 LTS，基于ＫＶＭ，libvirt的虚拟化管理平台。 虚拟机：ｗｉｎｄｏｗｓ７中文专业版，３２位， 每台虚拟机分配３０７１Ｍ内存，两颗ＣＰＵ(2 sockets) 。 libvirt：1.3.1 #三、现象 服务器上的windows，不定时的会卡死，多数每天发生一次到两次，少数三四天卡死一次，极少数会间隔时间更久， 多数发生在电脑空闲时间， 能上互联网的虚拟机多发， 此外无其他明显规律。 #四、问题排查 ##１、先是排查了服务器配置，终端的配置，网络 　　因为这套架构已经在多地部署，并稳定运行多年，排查完客户的现场网络后，此原因基本排除。 ##２、后来怀疑存储的问题 使用iostat持续检测两台服务器的三个小时。 ``` iostat -x -m 1 ``` 从记录下的日志看服务器存储的平均响应时间一直在正常范围，读...
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">ubuntu数据自动备份,定时发送邮件到备份邮箱</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							三元湖的水，我数据全丢失的泪T_T!! ubuntu数据自动备份自动发送邮件到邮箱
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">Qt Creator 中配置 CPLEX 12.63 （MS VC++ 2010 compiler）</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							MS VC++ 2010 的IDE不怎么友好，Qt Creator 就趁手多了，通过在 .pro 文件配置宏和编译参数等，就可以用 Qt Creator 来写 CPLEX 应用了
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				
    			</div>
    			
    			
    			<% //TODO  %>
    			<!-- 3333333333333333333333333333333333333333333333333333333333333 -->
    			<div id="topsOfWeek" class="blog-list hide">
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">最流行的浏览器？不用 Chrome 的 13 个理由</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							Chrome 可能是世界上最流行的浏览器，但它不一定是最好的浏览器。
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>编辑部的故事</span>
    							<span>发布于</span>
    							<span>50分钟前</span>
    							<span>阅读 26</span>
    						</div>
    					</div>
    				</div>
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">是时候让你们知道这些最好的开发者网站了！</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							在每个行业中都有其业内最好的资源。在开发的世界也是如此，开发者是个古怪的群体，普通的网站并不能满足他们，所以我们整理了这些必须访问的网站，让开发者能了解最新的科技新闻；让初学者掌握编程；当然，还有一些当你需要休息时用得上的有趣的网站。（请自行准备梯子） 新闻网站和社区 开发人员在哪里可以获得影响编程和开发世界的最新消息？ Hacker News @newsycombinator 这个有点像开发界的“Reddit”！Hacker News能在任何重量级的新闻发生时给你一种如临其境的感觉。 例如：数百个开发者希望在2017年2月28日讨论大规模的AWS S3停机。你的同事中可没有几个能见证这种中断所造成的史诗灾难。 SlashDot @slashdot 这是一个汇集了所有最新的博客文章、与技术相关的新闻的巨大互动源，SlashDot于1997年由Rob“CmdrTaco”Malda创建，今天则归BIZX公司所有。SlashDot是由一小群编辑和开发者在网站强大的社区读者的帮助下运行，具有真正的社区氛围。 Reddit Programming @reddit_progr 它是开发人员的Reddit！ Reddit Programming是讨论最新发展趋势、科技新闻以及繁忙开发者心目中的一切事物的社区。 如果你需要最热门的新闻，想讨论一个困扰已久的编程问题，或希望在无休...
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>编辑部的故事</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">有趣的二进制</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							优秀应用算法都大量用到位运算，而位运算在工作中很少用到，所以借助其算法，我们看一下位运算的优势以及应用，但是大多数教材只会教大家二进制和十进制如何互换，都是死记硬背式的，并没有去讲解真正含义，换一个进制之后,依然不会，我们回到最根本的一些计数方法上，从10进制来推算，希望用一种更简单的方式介绍其原理
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>花_现</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 24</span>
    							<span>点赞 1</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">圆桌论道：聊聊小程序的发展生态，小程序还值得投入吗？</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							3月19日的 OSC 深圳源创会圆桌论道，以“聊聊小程序的发展生态”为主题，邀请到了多位在小程序领域知名的项目作者、嘉宾探讨小程序从现在到未来的发展生态。
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>喵了_个咪</span>
    							<span>发布于</span>
    							<span>6小时前</span>
    							<span>阅读 14</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">【源资讯 第19期】苹果拒绝“热更新”， iOS 11 抛弃 32 位应用……程序界的与时俱进？！</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							【一周源资讯（2017.3.10-2017.3.17）】苹果发通谍拒绝“热更新”； iOS 11 将彻底放弃 32 位应用程序；Android 将加入 Java 8 的原生支持……不与时俱进，小心被小学生完虐！
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>编辑部的故事</span>
    							<span>发布于</span>
    							<span>13小时前</span>
    							<span>阅读  1329</span>
    							<span>评论 5</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">spring cloud netflix 微服务使用实例</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							想使用微服务，却不知从何入手的同学或者有如下疑问的，可以看看这个项目实例。 参考我在解决如下问题的思路，这里只是简单的介绍，更多的内容靠源码表达了。有时间再单独就微服务的每一块写博客。
    						</div>
    						<div class="box vertical blog-footer-box">
            					<span>丁丙乙甲</span>
            					<span>发布于</span>
            					<span>18小时前</span>
                        		<span>阅读 176</span>
    						</div>
    					</div>
    				</div>
    				
    				 <div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">厉害了，我的talent-aio，支撑17.82万TCP长连接只消耗800M内存</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							talent-aio最近得到公司大力支持，嗯，作者也终于有条件去测试talent-aio对TCP长连接数的支撑情况，所以最近一周都在对talent-aio进行拷机测试。看看下面的测试步骤以及测试结果吧。
    						</div>
    						<div class="box vertical blog-footer-box">
            					<span>talent-tan</span>
            					<span>发布于</span>
            					<span>18小时前</span>
                        		<span>阅读 491</span>
                                <span>评论 4</span>
                                <span>点赞 2</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">Thrift源码分析--TThreadedSelectorServer线程模型</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							Thrift的网路服务模型之一的 TThreadedSelectorServer 实现了多Reactor线程模型，请先理解线程模型再深入分析源码。线程模型的讲解此处不再赘述，给出一张总结图如下： ![TThreadedSelectorServer线程模型](http://note.youdao.com/yws/public/resource/2c4d04563f025a1e32bfc2056e3e64fb/xmlnote/E058E515F2A34415A19138E287AC12AA/10042 "TThreadedSelectorServer线程模型") 截图来自：[Thrift 服务模型和序列化机制深入学习](http://www.liuqianfei.com/article/065b0f1ee59a4cf0b94a84c4e33af127) 下面从一次完整的服务调用过程来分析源码： ### 1. 服务入口 先来看看服务入口函数 serve() ，TThreadedSelectorServer 的 serve() 方法继承自 AbstractNoblockingServer 抽象类。 ![serve()](http://note.youdao.com/yws/public/resource/2c4d04563f025a1e32bfc2056e3e64fb/xmlnote/47EB096440E5449E91FB1ADE8C4C7DA3/10164 "在这里输入图片标题") 其中startThread() 方法为抽象方法，在 TThreadedSelectorServer 中实现如下： ![startThread()](http://note.youdao.com/yws/public/resource/2c4d04563f025a1e32bfc2056e3e64fb/xmlnote/C3532B55BAD5406295CD9FF15739C6B...
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">一起KVM环境下windows7虚拟机异常死机（BSOD）的问题解决</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							先说一下环境： #一、硬件 ８台服务器做的超融合架构，软件存储池， 每台服务器是９６Ｇ内存，两颗Intel(R) Xeon(R) CPU E5-2670 0 @ 2.60GHz，３２线程。 每台服务器是１Ｔ　ＳＳＤ加三块４Ｔ　ＳＡＴＡ，无ｒａｉｄ卡，数据做的两副本。 服务器集成２个１Ｇ的网口，做端口聚合，对外提供服务。 另加一块四端口千兆网卡，做端口聚合，做内部数据传输。 #二、软件 基础系统是Ubuntu 16.04 LTS，基于ＫＶＭ，libvirt的虚拟化管理平台。 虚拟机：ｗｉｎｄｏｗｓ７中文专业版，３２位， 每台虚拟机分配３０７１Ｍ内存，两颗ＣＰＵ(2 sockets) 。 libvirt：1.3.1 #三、现象 服务器上的windows，不定时的会卡死，多数每天发生一次到两次，少数三四天卡死一次，极少数会间隔时间更久， 多数发生在电脑空闲时间， 能上互联网的虚拟机多发， 此外无其他明显规律。 #四、问题排查 ##１、先是排查了服务器配置，终端的配置，网络 　　因为这套架构已经在多地部署，并稳定运行多年，排查完客户的现场网络后，此原因基本排除。 ##２、后来怀疑存储的问题 使用iostat持续检测两台服务器的三个小时。 ``` iostat -x -m 1 ``` 从记录下的日志看服务器存储的平均响应时间一直在正常范围，读...
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">ubuntu数据自动备份,定时发送邮件到备份邮箱</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							三元湖的水，我数据全丢失的泪T_T!! ubuntu数据自动备份自动发送邮件到邮箱
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">Qt Creator 中配置 CPLEX 12.63 （MS VC++ 2010 compiler）</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							MS VC++ 2010 的IDE不怎么友好，Qt Creator 就趁手多了，通过在 .pro 文件配置宏和编译参数等，就可以用 Qt Creator 来写 CPLEX 应用了
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    			</div>
    			
    			
    			
    			<% //TODO %>
    			<!--  444444444444444444444444444444444444444444444444444444444444 -->
    			
    			<div id="topsOfNew" class="blog-list hide">
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">花十分钟时间给JFinal写了个talent-aio插件。。。</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							本人 JFinal脑残粉，最近公司几个项目都需要跟硬件交互，这就得用到长连接，之前一直没接触过该领域，本来还想花时间研究下netty，讲真挺难啃的，找资料的时候翻到 talent-aio，略微了解发现似乎学习成本极低，没想到作者本人也极其nice,解答我这个门外小伙子好多个问题，顺利用上此框架，刚好解了我的燃眉之急。 什么是 talent-aio？ talent-aio是基于java aio实现的即时通讯框架，源于作者另一个久经考验的talent-nio框架，但在易用性、性能及代码可读性方面又远远超越了talent-nio。 顺便放上传送门：https://my.oschina.net/talenttan/blog/863545 废话不说，下面正题： 下载talent-aio的demo，demo极其简单，主要还是看HelloAbsAioHandler这个类的编码协议，剩下的就是看Aio的类了，api 貌似都在这。具体不介绍了，上面有链接，要注意的是Client端与Server端协议要一致。在这里说下我之前踩的坑，比如talent-aio的demo代码中的协议是有header的，Server端对客户端没有要求，但必须遵循交互协议，所以若是你用百度出来的socket实例连Server要注意，这里我们用回本身提供的Client代码就可以了。 导入talnet-aio依赖。         &lt;dependency&gt;
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>小徐同学</span>
    							<span>发布于</span>
    							<span>20分钟前</span>
    							<span>阅读 26</span>
    						</div>
    					</div>
    				</div>
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">源资讯 第19期】苹果拒绝“热更新”， iOS 11 抛弃 32 位应用……程序界的与时俱进？！</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							【一周源资讯（2017.3.10-2017.3.17）】苹果发通谍拒绝“热更新”； iOS 11 将彻底放弃 32 位应用程序；Android 将加入 Java 8 的原生支持……不与时俱进，小心被小学生完虐！
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">阿里-蚂蚁金服三轮面试总结</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							作为团队里一名还未毕业的前端妹子，这周接到了接到了阿里巴巴-蚂蚁金服的三轮电面，我大概是从二月中旬的时候就陆续投一些公司的简历，想找一下比较好的暑假实习，一些大公司从二月份中下旬就开始发内推了，貌似我是在牛客网的讨论区刷到内推的机会的，然后就发了简历。等到了最近三月的7/8/10号这三天，我经历了杭州蚂蚁金服的一二三面（电话），面完第三面不知道结果怎么样，还是和大家分享一下吧。 一.第一次电面 （2017.3.7 下午 5:30开始，持续半小时） (一)问题： 1.基础问题： 说说js的继承实现 js的闭包 2.项目问题： 说说你做过的项目  你在项目中的角色 （我说前后端，用node） 在项目中遇到的问题 假如让你重新做这个项目，你会怎么做？ 这个项目有哪些你觉得会保留的，哪些你觉得需要改进的？ 为什么用grunt 产品存放在哪里 有没有上线 node版本的区别 (二)我问的问题总结： 这次和面试官的沟通中，我了解到Angular慢慢地使用减少了，react、ej6、vue现在比较热门。（不过后来听师兄师姐说，阿里影视为了兼容问题暂时还在用 Angular1，而阿里UC也有使用Angular2的，所以还是有必要学习的 ）另外，面试官介绍个github账号antdesign给我学习。 (三)个人总结： ...
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>花_现</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 24</span>
    							<span>点赞 1</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">长URL转短连接的简单设计与实现</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							非常多的时候，我们不想在分享的时候采用长长的链接，主要的原因有： URL太长占显示空间、难于输入，转成二维码点点小，难于识别 长的URL提供的信息太多，不利于信息安全，甚至容易造成倒库 其他理由...... 今天的理由不是重点，重点是如何用一点点代码实现这个短链接的生成。 我们的注意点有： 生成的短链接地址长度可调整，毕竟不能因为4位、5位、6位的长度变化就让我们重新写一套程序 要有防冲突处理机制，不能因为算法导致两个长链接地址生成的短地址一样就把前一个覆盖掉 有时候，一个地址用过之后觉得不需要使用了，哪么这个地址失效之后，短地址可以有效收回。 首先设计接口 /**
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>喵了_个咪</span>
    							<span>发布于</span>
    							<span>6小时前</span>
    							<span>阅读 14</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">【源资讯 第19期】苹果拒绝“热更新”， iOS 11 抛弃 32 位应用……程序界的与时俱进？！</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							【一周源资讯（2017.3.10-2017.3.17）】苹果发通谍拒绝“热更新”； iOS 11 将彻底放弃 32 位应用程序；Android 将加入 Java 8 的原生支持……不与时俱进，小心被小学生完虐！
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>编辑部的故事</span>
    							<span>发布于</span>
    							<span>13小时前</span>
    							<span>阅读  1329</span>
    							<span>评论 5</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">spring cloud netflix 微服务使用实例</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							想使用微服务，却不知从何入手的同学或者有如下疑问的，可以看看这个项目实例。 参考我在解决如下问题的思路，这里只是简单的介绍，更多的内容靠源码表达了。有时间再单独就微服务的每一块写博客。
    						</div>
    						<div class="box vertical blog-footer-box">
            					<span>丁丙乙甲</span>
            					<span>发布于</span>
            					<span>18小时前</span>
                        		<span>阅读 176</span>
    						</div>
    					</div>
    				</div>
    				
    				 <div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">厉害了，我的talent-aio，支撑17.82万TCP长连接只消耗800M内存</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							talent-aio最近得到公司大力支持，嗯，作者也终于有条件去测试talent-aio对TCP长连接数的支撑情况，所以最近一周都在对talent-aio进行拷机测试。看看下面的测试步骤以及测试结果吧。
    						</div>
    						<div class="box vertical blog-footer-box">
            					<span>talent-tan</span>
            					<span>发布于</span>
            					<span>18小时前</span>
                        		<span>阅读 491</span>
                                <span>评论 4</span>
                                <span>点赞 2</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">Thrift源码分析--TThreadedSelectorServer线程模型</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							Thrift的网路服务模型之一的 TThreadedSelectorServer 实现了多Reactor线程模型，请先理解线程模型再深入分析源码。线程模型的讲解此处不再赘述，给出一张总结图如下： ![TThreadedSelectorServer线程模型](http://note.youdao.com/yws/public/resource/2c4d04563f025a1e32bfc2056e3e64fb/xmlnote/E058E515F2A34415A19138E287AC12AA/10042 "TThreadedSelectorServer线程模型") 截图来自：[Thrift 服务模型和序列化机制深入学习](http://www.liuqianfei.com/article/065b0f1ee59a4cf0b94a84c4e33af127) 下面从一次完整的服务调用过程来分析源码： ### 1. 服务入口 先来看看服务入口函数 serve() ，TThreadedSelectorServer 的 serve() 方法继承自 AbstractNoblockingServer 抽象类。 ![serve()](http://note.youdao.com/yws/public/resource/2c4d04563f025a1e32bfc2056e3e64fb/xmlnote/47EB096440E5449E91FB1ADE8C4C7DA3/10164 "在这里输入图片标题") 其中startThread() 方法为抽象方法，在 TThreadedSelectorServer 中实现如下： ![startThread()](http://note.youdao.com/yws/public/resource/2c4d04563f025a1e32bfc2056e3e64fb/xmlnote/C3532B55BAD5406295CD9FF15739C6B...
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">一起KVM环境下windows7虚拟机异常死机（BSOD）的问题解决</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							先说一下环境： #一、硬件 ８台服务器做的超融合架构，软件存储池， 每台服务器是９６Ｇ内存，两颗Intel(R) Xeon(R) CPU E5-2670 0 @ 2.60GHz，３２线程。 每台服务器是１Ｔ　ＳＳＤ加三块４Ｔ　ＳＡＴＡ，无ｒａｉｄ卡，数据做的两副本。 服务器集成２个１Ｇ的网口，做端口聚合，对外提供服务。 另加一块四端口千兆网卡，做端口聚合，做内部数据传输。 #二、软件 基础系统是Ubuntu 16.04 LTS，基于ＫＶＭ，libvirt的虚拟化管理平台。 虚拟机：ｗｉｎｄｏｗｓ７中文专业版，３２位， 每台虚拟机分配３０７１Ｍ内存，两颗ＣＰＵ(2 sockets) 。 libvirt：1.3.1 #三、现象 服务器上的windows，不定时的会卡死，多数每天发生一次到两次，少数三四天卡死一次，极少数会间隔时间更久， 多数发生在电脑空闲时间， 能上互联网的虚拟机多发， 此外无其他明显规律。 #四、问题排查 ##１、先是排查了服务器配置，终端的配置，网络 　　因为这套架构已经在多地部署，并稳定运行多年，排查完客户的现场网络后，此原因基本排除。 ##２、后来怀疑存储的问题 使用iostat持续检测两台服务器的三个小时。 ``` iostat -x -m 1 ``` 从记录下的日志看服务器存储的平均响应时间一直在正常范围，读...
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">ubuntu数据自动备份,定时发送邮件到备份邮箱</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							三元湖的水，我数据全丢失的泪T_T!! ubuntu数据自动备份自动发送邮件到邮箱
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">Qt Creator 中配置 CPLEX 12.63 （MS VC++ 2010 compiler）</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							MS VC++ 2010 的IDE不怎么友好，Qt Creator 就趁手多了，通过在 .pro 文件配置宏和编译参数等，就可以用 Qt Creator 来写 CPLEX 应用了
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				
    			</div>
    			
    			<% //TODO %>
    			<!-- 5555555555555555555555555555555555555555555555555555555555 -->
				<div id="topsOfDaily" class="blog-list hide">
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">【谁动了我的开源内裤？】2017年深圳源创会图文回顾</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							伴随着深圳的下雨天，2017年3月19日OSC深圳源创会圆满落幕，了解本次活动详情，嘉宾分享PPT下载，注意文末链接。
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>IamOkay</span>
    							<span>发布于</span>
    							<span>50分钟前</span>
    							<span>阅读 26</span>
    						</div>
    					</div>
    				</div>
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">分布式系统开发集成环境搭建清单说明</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							过去一周搭建了云服务分布式集群环境，这周准备将集群环境搭建总结一下，也总结一下目前自己所踩过的坑 ###一、环境清单： #####1、devops工具 （1） 版本控制软件：gitLab （2）maven，nexus （3）jenkins （4）持续集成 maven，gitLab，jenkins集成发布 （5）文档工具 showdoc #####2、网关 （1）kong （2）nginx #####3、数据检索，日志统计 （1）elasticsearch-集群（2） （2）elasticsearch-单点（日志、统计） #####4、数据库 （1）mongodb （2）mysql （3）redis #####5、服务发现 （1）服务发现 consul 未来一段时间会整理出该套环境的具体部署方案。尽请期待........
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">javascript-引用类型的使用</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							1.声明引用类型 eg: var person = new Object(); person.name="wdw"; alert(person.name); 2.instanceof操作符 result = variable instanceof constructor 1)使用 instanceof 操作符检测基本类型的值，则该操作符始终会返回 false，因为基本类型不是对象。 2)根据规定，所有引用类型的值都是 Object 的实例 所以引用类型 instanceof Object永远是true alert(person instanceof Object); // 变量 person 是 Object 吗？ alert(colors instanceof Array); // 变量 colors 是 Array 吗？ alert(pattern instanceof RegExp); // 变量 pattern 是 RegExp 吗？ 3.变量访问 1)最重要的一点是 与常见语言相比 js没有块
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>花_现</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 24</span>
    							<span>点赞 1</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis"> Android之Glide（非常好用的图片加载框架）</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							谷歌开发者论坛上，谷歌为我们介绍了一个名叫 Glide 的图片加载库，作者是bumptech。 Glide是一种快速、高效的开源媒体管理和Android的包裹mediadecoding图像加载框架，内存和磁盘缓存和资源集中到一个简单的和易于使用的界面。  Glide是一个开源的图片加载和缓存处理的第三方框架。使用Android的Glide和Android的Picasso库的方式几乎一模一样。 Glide源码：https://github.com/bumptech/glide 案例中包含了以下功能： 加载drawable（mipmap）下的图片 加载SD卡图片 网络加载图片（可设置加载初始化和加载错误时的图片） 自定义图片大小 圆形图片（自定义弧度大小，自定义圆形图片） 圆形图片裁剪 椭圆形图片 可设置优先级记载 图片缩略为原图的10分之几 照片复古 加载成Drawable类型在显示 gif图片加载 图片填充 ................. 先看效果图：
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>喵了_个咪</span>
    							<span>发布于</span>
    							<span>6小时前</span>
    							<span>阅读 14</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">【源资讯 第19期】苹果拒绝“热更新”， iOS 11 抛弃 32 位应用……程序界的与时俱进？！</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							【一周源资讯（2017.3.10-2017.3.17）】苹果发通谍拒绝“热更新”； iOS 11 将彻底放弃 32 位应用程序；Android 将加入 Java 8 的原生支持……不与时俱进，小心被小学生完虐！
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>编辑部的故事</span>
    							<span>发布于</span>
    							<span>13小时前</span>
    							<span>阅读  1329</span>
    							<span>评论 5</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">spring cloud netflix 微服务使用实例</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							想使用微服务，却不知从何入手的同学或者有如下疑问的，可以看看这个项目实例。 参考我在解决如下问题的思路，这里只是简单的介绍，更多的内容靠源码表达了。有时间再单独就微服务的每一块写博客。
    						</div>
    						<div class="box vertical blog-footer-box">
            					<span>丁丙乙甲</span>
            					<span>发布于</span>
            					<span>18小时前</span>
                        		<span>阅读 176</span>
    						</div>
    					</div>
    				</div>
    				
    				 <div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">厉害了，我的talent-aio，支撑17.82万TCP长连接只消耗800M内存</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							talent-aio最近得到公司大力支持，嗯，作者也终于有条件去测试talent-aio对TCP长连接数的支撑情况，所以最近一周都在对talent-aio进行拷机测试。看看下面的测试步骤以及测试结果吧。
    						</div>
    						<div class="box vertical blog-footer-box">
            					<span>talent-tan</span>
            					<span>发布于</span>
            					<span>18小时前</span>
                        		<span>阅读 491</span>
                                <span>评论 4</span>
                                <span>点赞 2</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">Thrift源码分析--TThreadedSelectorServer线程模型</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							Thrift的网路服务模型之一的 TThreadedSelectorServer 实现了多Reactor线程模型，请先理解线程模型再深入分析源码。线程模型的讲解此处不再赘述，给出一张总结图如下： ![TThreadedSelectorServer线程模型](http://note.youdao.com/yws/public/resource/2c4d04563f025a1e32bfc2056e3e64fb/xmlnote/E058E515F2A34415A19138E287AC12AA/10042 "TThreadedSelectorServer线程模型") 截图来自：[Thrift 服务模型和序列化机制深入学习](http://www.liuqianfei.com/article/065b0f1ee59a4cf0b94a84c4e33af127) 下面从一次完整的服务调用过程来分析源码： ### 1. 服务入口 先来看看服务入口函数 serve() ，TThreadedSelectorServer 的 serve() 方法继承自 AbstractNoblockingServer 抽象类。 ![serve()](http://note.youdao.com/yws/public/resource/2c4d04563f025a1e32bfc2056e3e64fb/xmlnote/47EB096440E5449E91FB1ADE8C4C7DA3/10164 "在这里输入图片标题") 其中startThread() 方法为抽象方法，在 TThreadedSelectorServer 中实现如下： ![startThread()](http://note.youdao.com/yws/public/resource/2c4d04563f025a1e32bfc2056e3e64fb/xmlnote/C3532B55BAD5406295CD9FF15739C6B...
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">一起KVM环境下windows7虚拟机异常死机（BSOD）的问题解决</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							先说一下环境： #一、硬件 ８台服务器做的超融合架构，软件存储池， 每台服务器是９６Ｇ内存，两颗Intel(R) Xeon(R) CPU E5-2670 0 @ 2.60GHz，３２线程。 每台服务器是１Ｔ　ＳＳＤ加三块４Ｔ　ＳＡＴＡ，无ｒａｉｄ卡，数据做的两副本。 服务器集成２个１Ｇ的网口，做端口聚合，对外提供服务。 另加一块四端口千兆网卡，做端口聚合，做内部数据传输。 #二、软件 基础系统是Ubuntu 16.04 LTS，基于ＫＶＭ，libvirt的虚拟化管理平台。 虚拟机：ｗｉｎｄｏｗｓ７中文专业版，３２位， 每台虚拟机分配３０７１Ｍ内存，两颗ＣＰＵ(2 sockets) 。 libvirt：1.3.1 #三、现象 服务器上的windows，不定时的会卡死，多数每天发生一次到两次，少数三四天卡死一次，极少数会间隔时间更久， 多数发生在电脑空闲时间， 能上互联网的虚拟机多发， 此外无其他明显规律。 #四、问题排查 ##１、先是排查了服务器配置，终端的配置，网络 　　因为这套架构已经在多地部署，并稳定运行多年，排查完客户的现场网络后，此原因基本排除。 ##２、后来怀疑存储的问题 使用iostat持续检测两台服务器的三个小时。 ``` iostat -x -m 1 ``` 从记录下的日志看服务器存储的平均响应时间一直在正常范围，读...
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">ubuntu数据自动备份,定时发送邮件到备份邮箱</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							三元湖的水，我数据全丢失的泪T_T!! ubuntu数据自动备份自动发送邮件到邮箱
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    				<div class="box item">
    					<div class="box-fl">
    						<a href="#" style="display: block;">
    							<img class="blog-author" alt="IamOkay" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</a>
    					</div>
    					<div class="box-aw">
    						<div class="box vertical blog-title-box">
    							<a href="${pageContext.request.contextPath}/blogInfo" class="sc overh blog-title-link" target="_blank">
    								<h2 class="blog-name sc text-ellipsis">Qt Creator 中配置 CPLEX 12.63 （MS VC++ 2010 compiler）</h2>
    							</a>
    							<span class="blog-tag yuan">原</span>
    							<span class="blog-tag jian">荐</span>
    						</div>
    						<div class="blog-brief text-gradient">
    							MS VC++ 2010 的IDE不怎么友好，Qt Creator 就趁手多了，通过在 .pro 文件配置宏和编译参数等，就可以用 Qt Creator 来写 CPLEX 应用了
    						</div>
    						<div class="box vertical blog-footer-box">
    							<span>landptf</span>
    							<span>发布于</span>
    							<span>2小时前</span>
    							<span>阅读 6</span>
    						</div>
    					</div>
    				</div>
    				
    			</div>    			
    			
    			
    		</div>
    		
    		<% //TODO  %>
    		<div class="other-content">
				<ul class="blog-nav">
					
					<li><a href="#" class="active"><i class="icon-svg ic-demo1"></i>全部</a></li>
					<li><a href="#"><i class="icon-svg ic-demo2"></i>移动开发</a></li>
					<li><a href="#"><i class="icon-svg ic-demo3"></i>前段开发</a></li>
					<li><a href="#"><i class="icon-svg ic-demo4"></i>人工智能</a></li>
					<li><a href="#"><i class="icon-svg ic-demo5"></i>服务端开发/管理</a></li>
					<li><a href="#"><i class="icon-svg ic-demo6"></i>游戏开发</a></li>
					<li><a href="#"><i class="icon-svg ic-demo7"></i>编程语言</a></li>
					<li><a href="#"><i class="icon-svg ic-demo8"></i>数据库</a></li>
					<li><a href="#"><i class="icon-svg ic-demo9"></i>企业开发</a></li>
					<li><a href="#"><i class="icon-svg ic-demo10"></i>图像/多媒体</a></li>
					<li><a href="#"><i class="icon-svg ic-demo11"></i>系统运维</a></li>
					<li><a href="#"><i class="icon-svg ic-demo12"></i>软件工程</a></li>
					<li><a href="#"><i class="icon-svg ic-demo13"></i>大数据</a></li>
					<li><a href="#"><i class="icon-svg ic-demo14"></i>云计算</a></li>
					<li><a href="#"><i class="icon-svg ic-demo14"></i>开源社区</a></li>
					<li><a href="#"><i class="icon-svg ic-demo14"></i>其他类型</a></li>
				</ul>		
    			<div class="weekly">
    				<h1>本周最受欢迎</h1>
    				<div class="img-wrapper">
    					<a href="#" class="box justify">
    						<span class="box-fl">
    							<img alt="" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</span>
    						<div class="box-aw">
    							<div class="title">小小编辑</div>
    							<div class="post"></div>
    						</div>
    					</a>
    				</div>
    				<div class="img-wrapper">
    					<a href="#" class="box justify">
    						<span class="box-fl">
    							<img alt="" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</span>
    						<div class="box-aw">
    							<div class="title">小小编辑</div>
    							<div class="post"></div>
    						</div>
    					</a>
    				</div>
    				    				<div class="img-wrapper">
    					<a href="#" class="box justify">
    						<span class="box-fl">
    							<img alt="" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</span>
    						<div class="box-aw">
    							<div class="title">小小编辑</div>
    							<div class="post"></div>
    						</div>
    					</a>
    				</div>
    				<div class="img-wrapper">
    					<a href="#" class="box justify">
    						<span class="box-fl">
    							<img alt="" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</span>
    						<div class="box-aw">
    							<div class="title">小小编辑</div>
    							<div class="post"></div>
    						</div>
    					</a>
    				</div>
    				<div class="img-wrapper">
    					<a href="#" class="box justify">
    						<span class="box-fl">
    							<img alt="" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</span>
    						<div class="box-aw">
    							<div class="title">小小编辑</div>
    							<div class="post"></div>
    						</div>
    					</a>
    				</div>
    				    				<div class="img-wrapper">
    					<a href="#" class="box justify">
    						<span class="box-fl">
    							<img alt="" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</span>
    						<div class="box-aw">
    							<div class="title">小小编辑</div>
    							<div class="post"></div>
    						</div>
    					</a>
    				</div>
    				
    				<div class="img-wrapper">
    					<a href="#" class="box justify">
    						<span class="box-fl">
    							<img alt="" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</span>
    						<div class="box-aw">
    							<div class="title">小小编辑</div>
    							<div class="post"></div>
    						</div>
    					</a>
    				</div>
    				<div class="img-wrapper">
    					<a href="#" class="box justify">
    						<span class="box-fl">
    							<img alt="" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    						</span>
    						<div class="box-aw">
    							<div class="title">小小编辑</div>
    							<div class="post"></div>
    						</div>
    					</a>
    				</div>
    			</div>
    		</div>
    		
    	</div>
    
    
    
    
    
    </div>

</body>
</html>