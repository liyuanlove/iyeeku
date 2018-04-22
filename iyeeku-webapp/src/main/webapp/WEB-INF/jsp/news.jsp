<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>咨询 - iyeeku</title>
<%@ include file="header.jspf" %>
	<style type="text/css">
	
	*{
		box-sizing: border-box;
	}

	body{
		background-color: #f5f5f5;
		font-family: "Pingfang SC", "STHeiti", "Lantinghei SC", "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei", "WenQuanYi Micro Hei", SimSun, sans-serif;
	}
	
	[type=button], img {
    	border: none;
    	outline: 0;
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
		background:url(${pageContext.request.contextPath}/images/news_banner.jpg);
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
	
	/* news */
	
	*, :after, :before {
    	box-sizing: border-box;
	}
	
	*, :after, :before, legend {
    	-webkit-box-sizing: border-box;
	}
	
	.p-news .news-list {
    	padding: 15px 0;
	}
	
	.p-news .news-list .item {
    	padding: 15px 10px;
	}

	.box {
    	display: -webkit-box;
    	display: -webkit-flex;
    	display: -ms-flexbox;
    	display: flex;
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
	
	.p-news .news-list .item .main-info {
    	min-width: 650px;
	}
	
	.p-news .news-list .item .thumb {
    	max-width: 150px;
    	margin-left: 20px;
	}
	
	.box-fl {
    	transition: width .2s;
    	-ms-flex-order: 1;
    	-webkit-order: 1;
    	-webkit-box-ordinal-group: 2;
    	order: 1;
	}
	
	.box-fr {
    	transition: width .2s;
    	-ms-flex-order: 3;
    	-webkit-order: 3;
    	-webkit-box-ordinal-group: 4;
    	order: 3;
	}
	
	.p-news .news-list .item .thumb a {
    	display: -webkit-box;
    	display: -webkit-flex;
    	display: -ms-flexbox;
    	display: flex;
    	overflow: hidden;
    	width: 150px;
    	height: 110px;
    	text-align: center;
    	border-radius: 3px;
    	background-color: #f5f4f4;
    	-webkit-box-align: center;
    	-webkit-align-items: center;
    	-ms-flex-align: center;
    	align-items: center;
	}
	
	.p-news .news-list .item .thumb a .small {
    	margin: auto;
	}
	
	.p-news a img {
    	color: #ccc;
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
	
	.box-aw img {
    	width: 100%;
    	max-width: intrinsic;
    	max-width: -moz-fit-content;
    	max-width: -webkit-fit-content;
    	height: auto;
	}
	
	.p-news .news-list .item .title {
    	/* font-size: 1.125rem; */
    	font-size:20px;
    	line-height: 25px;
    	display: block;
    	color: #000;
	}
	
	.p-news .news-list .item .title span {
    	vertical-align: middle;
	}
	
	.p-news .news-list .item .title span:HOVER {
    	color: #46ad2e;
	}
	

	.text-ellipsis {
    	display: block;
    	overflow: hidden;
    	white-space: nowrap;
    	text-overflow: ellipsis;
	}
	
	.p-news .news-list .item .summary {
    	/* font-size: .875rem; */
    	/* max-height: 3em; */
    	font-size: 14px;
    	line-height: 20px;
    	max-height: 40px;
    	overflow: hidden;
    	margin: 8px 0;
    	color: #6a6a6a;
	}
	
	.p-news .news-list .item .summary:after {
    	right: 0;
    	display: block;
    	width: 160px;
    	height: 20px;
    	background: -webkit-linear-gradient(left,rgba(255,255,255,0),#fff 96%);
    	background: -webkit-gradient(linear,left top,right top,from(rgba(255,255,255,0)),color-stop(96%,#fff));
    	background: linear-gradient(to right,rgba(255,255,255,0),#fff 96%);
	}
	
	.sc .text-gradient {
    	position: relative;
    	overflow: hidden;
	}
	
	.sc .wrap {
    	white-space: normal;
    	-ms-word-wrap: break-word;
    	word-wrap: break-word;
    	word-break: break-all;
    	-ms-word-break: break-all;
	}
	
	.sc.sc-text {
    	text-align: justify;
    	text-justify: inter-ideograph;
    	word-break: initial;
    	word-break: break-all;
	}
	
	.p-news .news-list .item .from {
    	/* font-size: .75rem; */
    	font-size:12px;
    	color: #9d9d9d;
	}
	
	.p-news .news-list .item .from a, .p-news .news-list .item .from img, .p-news .news-list .item .from span, .p-news .news-list .item .from svg:not([class~=hide]) {
    	display: inline-block;
    	vertical-align: middle;
	}
	
	
	.p-news .news-list .item .from a {
	    display: inline-block;
    	vertical-align: middle;
    	color: #9d9d9d;
	}
	
	.p-news .news-list .item .from .avatar {
    	overflow: hidden;
    	width: 24px;
    	min-width: 24px;
    	max-width: 24px;
    	height: 24px;
    	margin-right: 5px;
    	border-radius: 12px;
	}
	
	.p-news a img {
    	color: #ccc;
	}
	
	.p-news .news-list .item .from .mr {
    	margin-right: 15px;
	}
	
	.p-news .news-list .item .from .mr a {
    	vertical-align: bottom;
	}
	
	.icon-svg{
	    vertical-align: middle;
	    display: inline-block;
	    background-size: contain!important;
   	}
   	
   	.icon-time{
   	    width: 15px;
  		height: 15px;
	    margin-right: 3px;
  		background: url(${pageContext.request.contextPath}/svg/icon-time.svg) center no-repeat;
   	}
	
	.icon-reply{
   	    width: 15px;
  		height: 13px;
	    margin-right: 3px;
  		background: url(${pageContext.request.contextPath}/svg/icon-reply.svg) center no-repeat;
   	}
   	
   	
   	/*  侧面css */
	
	.box-fl, .box-fr {
    	-webkit-transition: width .2s;
	}
	
	.p-news .right-side {
		overflow: hidden;
    	width: 300px;
    	padding: 30px 0 30px 20px;
    	float:right;
	}
	
	
	.p-news .right-side .switch-title, .p-news .switcher {
    	border-bottom: #ddd 1px solid;
    	overflow: hidden;
	}
	
	.p-news .right-side .switcher .item {
    	margin-right: 20px;
    	padding: 5px 0;
	}
	
	.p-news .switcher .item.active {
    	position: relative;
    	color: #4eaa4c;
	}
	
	.p-news .switcher .item.active:after {
    	left: 0;
    	width: 100%;
    	height: 2px;
    	-webkit-box-shadow: inset 0 -2px 0 0 #4eaa4c;
    	box-shadow: inset 0 -2px 0 0 #4eaa4c;
	}
	
	.p-news .news-list .item .summary:after, .p-news .news-list .item:hover .summary:after, .p-news .switcher .item.active:after {
    	position: absolute;
    	bottom: 0;
    	content: '';
	}
	
	.p-news .switcher .item {
    	/* font-size: 1.125rem; */
    	font-size:20px;
    	display: inline-block;
    	padding: 10px 20px;
    	color: #6a6a6a;
	}
	
	.p-news .right-side .mb {
    	margin-bottom: 20px;
	}
	
	.p-news .news-list-simple .item {
    	margin-top: 15px;
	}
	
	.p-news .news-list-simple .item .title {
    	/* font-size: .875rem; */
    	font-size:14px;
    	line-height:25px;
    	color: #4a4a4a;
	}
	
	.p-news .news-list-simple .item .info {
    	/* font-size: .75rem; */
    	font-size:12px;
    	margin-top: 5px;
    	color: #898989;
	}
	
	.hide {
    	display: none;
    	opacity: 0;
	}
	
	.p-news .right-side .switch-title {
    	padding: 8px 0;
	}
	
	.p-news .right-side .switch-title .title {
    	/* font-size: 1.125rem; */
    	font-size:20px;
    	line-height: 24px;
    	float: left;
    	color: #333;
	}
	
	.p-news .comment-list .item {
    	margin-top: 15px;
	}
	
	.p-news .comment-list .avatar {
    	display: block;
    	overflow: hidden;
    	width: 24px;
    	height: 24px;
    	margin: 7px 7px 0 0;
    	border-radius: 12px;
	}
	
	.p-news .comment-list .black {
    	/* font-size: .875rem; */
    	font-size: 14px;
    	line-height: 20px;
    	color: #4a4a4a;
	}
	
	.p-news .comment-list .gray {
    	/* font-size: .75rem; */
    	font-size : 12px;
    	line-height: 16px;
    	margin-top: 10px;
    	color: #898989;
	}
	
	</style>
	
	<script type="text/javascript">
		$(function(){
			
			$(".news-list-item .item.box").hover(function(){
				$(this).css({background:'#f4f4f4'});
			},function(){
				$(this).css({background:'#ffffff'});
			});
			
			$("#right-slide-switcher").children().click(function(){
 				if(!$(this).hasClass("active")){
 					$(this).addClass("active").siblings().removeClass("active");					
					$(".news-list-simple.mb").children(":eq("+$(this).index()+")")
						.removeClass("hide").siblings().addClass("hide");
				} 
			});
			
			$("#content-switcher").children().click(function(){
				if(!$(this).hasClass("tabActivited")){
					$(this).addClass("tabActivited").siblings().removeClass("tabActivited");
					$(".news-list.all").children(":eq("+$(this).index()+")")
					.removeClass("hide").siblings().addClass("hide");
				}
				
			});
			
			
		})
	
	
	</script>
	
</head>
<body>

<%@ include file="nav.jspf" %>

    <div class="p-news" style="width:100%;height: 100%;">
    	
    	<div class="vertical question-head">
    		<div class="vertical head-content">
    			<div class="vertical header-left">
    				<div style="float:left">
	    				<a class="vertical question-link" href="${pageContext.request.contextPath}/news">
		    				<label class="lfont" style="cursor: pointer;">开源</label>
		    				<label class="rfont" style="cursor: pointer;">资讯</label>
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
    			<div class="tabs-menu" id="content-switcher">
                    <a class="que-tab tabActivited" href="javascript:void(0);">全部资讯</a>
                    <a class="que-tab" href="javascript:void(0);">综合资讯</a>
                    <a class="que-tab" href="javascript:void(0);">软件更新资讯</a>
    			</div>
    			
    			<div class="news-list all">
    		
    				<div class="news-list-item" id="all-news">
    				
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								Hibernate Validator 5.4.1.Final，Bean 验证框架
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								Hibernate Validator 5.4.1.Final 发布了，该版本主要没有大的变更，主要是 bug 的修复。建议升级。 该版本中突出的错误修复： HV-1088 - Fix a concurrency issue in validator initialization that you probably wouldn’t encounter in a normal usage - you’re supposed to use a shared ConstraintValidatorFactory which mitigates the issue HV-1280 - Fix a class loading conflict with Xerces in modular environements (e.g. WildFly) HV-1252 - Fix an issue with the annotation processor and JavaMoney support. Thanks go to Guillaume Husta for this one. HV-1253 - A few TYPE_USE mentions had been mistakenly introduced in 5.4 when backporting from 6 (5.4 still supports Java 6) 下载：TAR.GZ, ZIP
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    						<div class="thumb box-fr">
    							<a href="#">
    								<img alt="Hibernate Validator 5.4.1.Final，Bean 验证框架" style="max-width: 150px;" src="${pageContext.request.contextPath}/images/hibernate.png" class="small">
    							</a>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								4月武汉&长沙源创会，揭秘超大规模搜索引擎背后那些事
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								听说四月樱花开，结束深圳大本营，源创会将再次来到武汉和长沙，秉承“自由、开放、分享”的开源精神，邀各位在花开的季节来一场线下面基。
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>6
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								码云推荐 | 模仿艺龙实现酒店预订和搜索的 App
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								实现了类似艺龙App的预定酒店功能，包括酒店搜索、特色酒店推荐、特惠酒店推荐等等功能，可以预定酒店、查看订单，唯独不能支付。
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								每日一博 | 多场景使用的长 URL 转短链接解决方案开源
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								上一次本人写过一篇博客《长URL转短连接的简单设计与实现》，由于写得比较仓促，因此是确实设计的，因此方案也是不完整的，看到大家非常有热情，阅读的阅读收藏的收藏，我就深深的为写了这么不够深入的博客而感到不安，于是就有了这一篇博客，以及背后的开源代码。
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								Paradox —— 简单实现的小型深度学习框架
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								Paradox 是一个用 Python 3 和 numpy 实现一个简单的深度学习框架，了解流行框架的原理。
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								OSChina 周六乱弹 ——程序员想让对象一辈子跟你的秘籍
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								小时候被狗咬了一口，我以为没事，结果到现在还是单身。。。呃，被狗咬了一口，结果一直都是单身狗。
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								协作翻译 | 微服务和分布式对象第一定律
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								当我写 企业应用程序架构的模式 时，我创造了我所谓的分布式对象设计第一定律：“不分发你的对象”。近几个月来，微服务引起了很多人的兴趣，导致一些人质疑微服务是否违反了这项定律，如果是，我为什么赞成他们？
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>1
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								Linux 桌面 Xfce 被曝神级“Bug”，会破坏用户显示器
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								一位用户向 Xfce 项目递交了一个 Bug 报告，标题是“The default desktop startup screen causes damage to monitor!” Xfce 是类 UNIX 操作系统上的轻量级桌面环境，遵循 UNIX 的模块化和复用性哲学传统。它包含大量组件，有现代桌面环境所应具有的完整功能。 这位用户声称默认的桌面启动屏幕的”老鼠动画“会引发猫的好奇心，猫会伸出爪子抓屏幕，导致屏幕出现刮痕。 他同时还递交了补丁来修复这个问题，就是——将桌面上的老鼠改成狗。
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>11
    								</a>
    							</div>
    						</div>
    						<div class="thumb box-fr">
    							<a href="#">
    								<img alt="Linux 桌面 Xfce 被曝神级“Bug”，会破坏用户显示器" src="${pageContext.request.contextPath}/images/xfce.gif" class="small">
    							</a>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								OpenSSL 宣布将开源许可证更改为 Apache 2.0
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								OpenSSL 宣布将其许可证更改为 Apache License v 2.0，并启用了一个新网站。该网站将帮助 OpenSSL 团队联系迄今所有为该项目做出贡献的人完成许可证的更换。 OpenSSL 是目前非常流行的加密程序库，此前采用的许可证是 OpenSSL License 和 SSLeay License，其中 OpenSSL License 是 Apache License 1.0 许可证，而 SSLeay License 则是 4-clause BSD，这两个许可证与 GPL 许可证不兼容，GPL 软件使用 OpenSSL 时需要给予其例外。这次的许可证更改后，OpenSSL 将能更自由的整合到 GPL 软件中。 OpenSSL 此次更换许可证的行动，得到了许多人的赞赏和认同。软件自由法律中心的法律总监 Mishi Choudhary 说：“OpenSSL 作为应用最广泛的 FOSS 加密软件，将更加方便地被纳入到免费和开源软件中”。 Linux 基金会首席技术官 Nicko van Someren 也表示：“ Linux 基金会很高兴看到 OpenSSL 项目依据 Apache 许可证重新授权。当将 FOSS 项目纳入其他项目和产品时，使用一个标准并易于理解的许可证是非常重要的。OpenSSL 这一许可举措将进一步确保它坐稳世界上最重要和最受依赖的开源项目之一的地位”
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    						<div class="thumb box-fr">
    							<a href="#">
    								<img alt="OpenSSL 宣布将开源许可证更改为 Apache 2.0" src="${pageContext.request.contextPath}/images/openssl_ZG1ub.png" class="small">
    							</a>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								PyCharm 2017.1 正式发布：有更快的调试器
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								PyCharm 2017.1 正式发布了，新版有一个更快的调试器，改进的 Python 和 JavaScript 单元测试，并支持 six Library。其中，专业版对于 Web 开发也有了更大的支持，例如支持 Django, Flask，Pyramid，以及 Vue 等框架。 部分更新内容： Python 调试器调试 Python 3.6 的项目快了四十倍，对于旧版本的 Python 来说，Python 调试器的速度提高了两倍 对 six Library 的支持 Python 的单元测试运行程序已经从头开始重新构建：现在可以使用 PyCharm 运行任何测试配置 你是一个全栈开发者？ 新版改进了 JavaScript 单元测试：gutter 图标表示测试是否通过并支持 Jest，以及 Facebook 的 JS 测试框架（仅在 PyCharm Professional 版本中可用） 零延迟输入默认情况下处于打开状态：PyCharm 2017.1 的输入延迟低于 Sublime Text 和 Emacs 的延迟时间 支持本地的 Docker for Mac - 不再需要使用 SOCAT（仅适用于 PyCharm Professional 版） 更多新功能点此参阅 发布主页 和 下载地址
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    						<div class="thumb box-fr">
    							<a href="#">
    								<img alt="PyCharm 2017.1 正式发布：有更快的调试器" style="max-width: 150px;" src="${pageContext.request.contextPath}/images/pycharm_uDL8d.png" class="small">
    							</a>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								英国开发者编程语言和薪资调查：机器学习工资最高
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								Stack Overflow 最新调查报告显示，英国开发者的平均工资约为 44000 英镑，这比英国的全国平均工资（28000英镑）高出了 45％。 其中，机器学习的专家收入最高，为 56851 英镑。Web 开发人员平均为 42717 英镑，比桌面软件（£42313）和移动开发（£42223）略好。图形程序员 Graphics programmers（£39832）和平面设计师（£35863英镑）的收入最低。 在语言方面，JavaScript（65.3％）是调查中最常用的语言，其次是 SQL（54.5％）。之后，C＃（40.3％）、Python（30.9％）和 Java（29.2％）。 “最受欢迎”的语言排名结果略有不同：JavaScript（48.8％）、C＃（37.4％）、SQL（34.2％）和 Python（33.9％）占据前四。 有趣的是，Go 和 Swift 在常用语言排名较低，仅占比 3.8% 和 5.3％ ，但却很受欢迎，达到了 16.6%和 12% 。 编译自：zdnet
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								马来西亚 IT 决策者正转向开源来最大化 IT 功能
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								开源解决方案提供商红帽在关于亚太地区数字创新计划中使用开源的研究结果显示，马来西亚的大多数 IT 决策者正在转向开源，以最大化其 IT 能力。 该研究调查了来自亚太地区 9 个国家的 455 位首席信息官和 IT 决策者。收集的信息反映，马来西亚有 76％ 的受访者将开源视为节约成本的选择，而 24％ 的受访者认为开源是对其组织的战略投资。 红帽亚太区高级副总裁兼总经理 Dirk-Peter van Leeuwen 表示：“组织通过技术找到自己的竞争优势比以往任何时候都要更迫切。随着这一转变，开源逐渐发展成为技术创新的默认选择，帮助企业提高敏捷性，高效性和创新性” 。 该研究发现，在未来12个月内，受访者的首要 IT 计划如下： 更新和现代化核心应用程序（68％） 将后端系统和应用与面向移动和 Web 系统的客户集成（64％） 巩固面向客户的系统以创建单一客户视图（62％） 提高员工队伍效率和改善业务流动性（66％） 此外，马来西亚的受访者对开源的看法和计划如下： 70％ 的受访者认为，使用开源可以帮助他们的组织降低软件许可成本。 68％ 的受访者认为，开源使他们的组织能够参与到一个开放的创新合作伙伴生态系统中，这可以促进更大的合作。 62％ 的受访者认为，开源具有支持新功能的业务创新能力。 54％ 的受访者表示，他们的组织计划在未来 12 个月内采用并实施其技术路线图中的开源解决方案。 编译自：DigitalNewsAsia
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    					</div>
    					
    				
    				</div>
    				
    				
    				<!-- 22222222222222222222222222222222222222222222222222222222222222 -->
    				<div class="news-list-item hide" id="kinds-of-news">
    				
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								【谁动了我的开源内裤？】2017年深圳源创会图文回顾
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								伴随着深圳的下雨天，2017年3月19日OSC深圳源创会圆满落幕，了解本次活动详情，嘉宾分享PPT下载，注意文末链接。
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">开源中国源创会</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								接地气又好用，8 款优秀的国产开源博客系统推荐
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								对于程序员来说，除了苦修技术，写博客将开发过程和开发经验记录下来，也是非常有意义的事情。既能帮助自己梳理思绪，也能让其他人避免重复踩坑，还能抛砖引玉，得到更多同行的指点和建议。
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>6
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								Linux 桌面 Xfce 被曝神级“Bug”，会破坏用户显示器
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								一位用户向 Xfce 项目递交了一个 Bug 报告，标题是“The default desktop startup screen causes damage to monitor!” Xfce 是类 UNIX 操作系统上的轻量级桌面环境，遵循 UNIX 的模块化和复用性哲学传统。它包含大量组件，有现代桌面环境所应具有的完整功能。 这位用户声称默认的桌面启动屏幕的”老鼠动画“会引发猫的好奇心，猫会伸出爪子抓屏幕，导致屏幕出现刮痕。 他同时还递交了补丁来修复这个问题，就是——将桌面上的老鼠改成狗。
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>11
    								</a>
    							</div>
    						</div>
    						<div class="thumb box-fr">
    							<a href="#">
    								<img alt="Linux 桌面 Xfce 被曝神级“Bug”，会破坏用户显示器" src="${pageContext.request.contextPath}/images/xfce.gif" class="small">
    							</a>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								码云推荐 | 模仿艺龙实现酒店预订和搜索的 App
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								实现了类似艺龙App的预定酒店功能，包括酒店搜索、特色酒店推荐、特惠酒店推荐等等功能，可以预定酒店、查看订单，唯独不能支付。
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								每日一博 | 多场景使用的长 URL 转短链接解决方案开源
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								上一次本人写过一篇博客《长URL转短连接的简单设计与实现》，由于写得比较仓促，因此是确实设计的，因此方案也是不完整的，看到大家非常有热情，阅读的阅读收藏的收藏，我就深深的为写了这么不够深入的博客而感到不安，于是就有了这一篇博客，以及背后的开源代码。
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								Paradox —— 简单实现的小型深度学习框架
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								Paradox 是一个用 Python 3 和 numpy 实现一个简单的深度学习框架，了解流行框架的原理。
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								OSChina 周六乱弹 ——程序员想让对象一辈子跟你的秘籍
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								小时候被狗咬了一口，我以为没事，结果到现在还是单身。。。呃，被狗咬了一口，结果一直都是单身狗。
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								协作翻译 | 微服务和分布式对象第一定律
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								当我写 企业应用程序架构的模式 时，我创造了我所谓的分布式对象设计第一定律：“不分发你的对象”。近几个月来，微服务引起了很多人的兴趣，导致一些人质疑微服务是否违反了这项定律，如果是，我为什么赞成他们？
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>1
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								OpenSSL 宣布将开源许可证更改为 Apache 2.0
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								OpenSSL 宣布将其许可证更改为 Apache License v 2.0，并启用了一个新网站。该网站将帮助 OpenSSL 团队联系迄今所有为该项目做出贡献的人完成许可证的更换。 OpenSSL 是目前非常流行的加密程序库，此前采用的许可证是 OpenSSL License 和 SSLeay License，其中 OpenSSL License 是 Apache License 1.0 许可证，而 SSLeay License 则是 4-clause BSD，这两个许可证与 GPL 许可证不兼容，GPL 软件使用 OpenSSL 时需要给予其例外。这次的许可证更改后，OpenSSL 将能更自由的整合到 GPL 软件中。 OpenSSL 此次更换许可证的行动，得到了许多人的赞赏和认同。软件自由法律中心的法律总监 Mishi Choudhary 说：“OpenSSL 作为应用最广泛的 FOSS 加密软件，将更加方便地被纳入到免费和开源软件中”。 Linux 基金会首席技术官 Nicko van Someren 也表示：“ Linux 基金会很高兴看到 OpenSSL 项目依据 Apache 许可证重新授权。当将 FOSS 项目纳入其他项目和产品时，使用一个标准并易于理解的许可证是非常重要的。OpenSSL 这一许可举措将进一步确保它坐稳世界上最重要和最受依赖的开源项目之一的地位”
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    						<div class="thumb box-fr">
    							<a href="#">
    								<img alt="OpenSSL 宣布将开源许可证更改为 Apache 2.0" src="${pageContext.request.contextPath}/images/openssl_ZG1ub.png" class="small">
    							</a>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								PyCharm 2017.1 正式发布：有更快的调试器
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								PyCharm 2017.1 正式发布了，新版有一个更快的调试器，改进的 Python 和 JavaScript 单元测试，并支持 six Library。其中，专业版对于 Web 开发也有了更大的支持，例如支持 Django, Flask，Pyramid，以及 Vue 等框架。 部分更新内容： Python 调试器调试 Python 3.6 的项目快了四十倍，对于旧版本的 Python 来说，Python 调试器的速度提高了两倍 对 six Library 的支持 Python 的单元测试运行程序已经从头开始重新构建：现在可以使用 PyCharm 运行任何测试配置 你是一个全栈开发者？ 新版改进了 JavaScript 单元测试：gutter 图标表示测试是否通过并支持 Jest，以及 Facebook 的 JS 测试框架（仅在 PyCharm Professional 版本中可用） 零延迟输入默认情况下处于打开状态：PyCharm 2017.1 的输入延迟低于 Sublime Text 和 Emacs 的延迟时间 支持本地的 Docker for Mac - 不再需要使用 SOCAT（仅适用于 PyCharm Professional 版） 更多新功能点此参阅 发布主页 和 下载地址
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    						<div class="thumb box-fr">
    							<a href="#">
    								<img alt="PyCharm 2017.1 正式发布：有更快的调试器" style="max-width: 150px;" src="${pageContext.request.contextPath}/images/pycharm_uDL8d.png" class="small">
    							</a>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								英国开发者编程语言和薪资调查：机器学习工资最高
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								Stack Overflow 最新调查报告显示，英国开发者的平均工资约为 44000 英镑，这比英国的全国平均工资（28000英镑）高出了 45％。 其中，机器学习的专家收入最高，为 56851 英镑。Web 开发人员平均为 42717 英镑，比桌面软件（£42313）和移动开发（£42223）略好。图形程序员 Graphics programmers（£39832）和平面设计师（£35863英镑）的收入最低。 在语言方面，JavaScript（65.3％）是调查中最常用的语言，其次是 SQL（54.5％）。之后，C＃（40.3％）、Python（30.9％）和 Java（29.2％）。 “最受欢迎”的语言排名结果略有不同：JavaScript（48.8％）、C＃（37.4％）、SQL（34.2％）和 Python（33.9％）占据前四。 有趣的是，Go 和 Swift 在常用语言排名较低，仅占比 3.8% 和 5.3％ ，但却很受欢迎，达到了 16.6%和 12% 。 编译自：zdnet
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								马来西亚 IT 决策者正转向开源来最大化 IT 功能
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								开源解决方案提供商红帽在关于亚太地区数字创新计划中使用开源的研究结果显示，马来西亚的大多数 IT 决策者正在转向开源，以最大化其 IT 能力。 该研究调查了来自亚太地区 9 个国家的 455 位首席信息官和 IT 决策者。收集的信息反映，马来西亚有 76％ 的受访者将开源视为节约成本的选择，而 24％ 的受访者认为开源是对其组织的战略投资。 红帽亚太区高级副总裁兼总经理 Dirk-Peter van Leeuwen 表示：“组织通过技术找到自己的竞争优势比以往任何时候都要更迫切。随着这一转变，开源逐渐发展成为技术创新的默认选择，帮助企业提高敏捷性，高效性和创新性” 。 该研究发现，在未来12个月内，受访者的首要 IT 计划如下： 更新和现代化核心应用程序（68％） 将后端系统和应用与面向移动和 Web 系统的客户集成（64％） 巩固面向客户的系统以创建单一客户视图（62％） 提高员工队伍效率和改善业务流动性（66％） 此外，马来西亚的受访者对开源的看法和计划如下： 70％ 的受访者认为，使用开源可以帮助他们的组织降低软件许可成本。 68％ 的受访者认为，开源使他们的组织能够参与到一个开放的创新合作伙伴生态系统中，这可以促进更大的合作。 62％ 的受访者认为，开源具有支持新功能的业务创新能力。 54％ 的受访者表示，他们的组织计划在未来 12 个月内采用并实施其技术路线图中的开源解决方案。 编译自：DigitalNewsAsia
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    					</div>
    					
    				
    				</div>
    				
    				
    				
    				
    				
    				<!-- 33333333333333333333333333333333333333333333333333333333333333333333333 -->
    				<div class="news-list-item hide" id="software-news">
    				
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								Hibernate Validator 5.4.1.Final，Bean 验证框架
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								Hibernate Validator 5.4.1.Final 发布了，该版本主要没有大的变更，主要是 bug 的修复。建议升级。 该版本中突出的错误修复： HV-1088 - Fix a concurrency issue in validator initialization that you probably wouldn’t encounter in a normal usage - you’re supposed to use a shared ConstraintValidatorFactory which mitigates the issue HV-1280 - Fix a class loading conflict with Xerces in modular environements (e.g. WildFly) HV-1252 - Fix an issue with the annotation processor and JavaMoney support. Thanks go to Guillaume Husta for this one. HV-1253 - A few TYPE_USE mentions had been mistakenly introduced in 5.4 when backporting from 6 (5.4 still supports Java 6) 下载：TAR.GZ, ZIP
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    						<div class="thumb box-fr">
    							<a href="#">
    								<img alt="Hibernate Validator 5.4.1.Final，Bean 验证框架" style="max-width: 150px;" src="${pageContext.request.contextPath}/images/hibernate.png" class="small">
    							</a>
    						</div>
    					</div>
    					
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								PyCharm 2017.1 正式发布：有更快的调试器
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								PyCharm 2017.1 正式发布了，新版有一个更快的调试器，改进的 Python 和 JavaScript 单元测试，并支持 six Library。其中，专业版对于 Web 开发也有了更大的支持，例如支持 Django, Flask，Pyramid，以及 Vue 等框架。 部分更新内容： Python 调试器调试 Python 3.6 的项目快了四十倍，对于旧版本的 Python 来说，Python 调试器的速度提高了两倍 对 six Library 的支持 Python 的单元测试运行程序已经从头开始重新构建：现在可以使用 PyCharm 运行任何测试配置 你是一个全栈开发者？ 新版改进了 JavaScript 单元测试：gutter 图标表示测试是否通过并支持 Jest，以及 Facebook 的 JS 测试框架（仅在 PyCharm Professional 版本中可用） 零延迟输入默认情况下处于打开状态：PyCharm 2017.1 的输入延迟低于 Sublime Text 和 Emacs 的延迟时间 支持本地的 Docker for Mac - 不再需要使用 SOCAT（仅适用于 PyCharm Professional 版） 更多新功能点此参阅 发布主页 和 下载地址
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    						<div class="thumb box-fr">
    							<a href="#">
    								<img alt="PyCharm 2017.1 正式发布：有更快的调试器" style="max-width: 150px;" src="${pageContext.request.contextPath}/images/pycharm_uDL8d.png" class="small">
    							</a>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								Vue 2.2.5 发布，轻量级 JavaScript 框架
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								Vue 2.2.5 发布了，Vue 是一款轻量级 JavaScript 框架。本次发布没有大的改动，主要是 bug 的修复，详细如下： #5191 修复从 updated 的钩子发出的事件不触发更新的问题 (@Kingwl via #5233) #5209 修复性能跟踪问题 #5216 修复当 Vue.set 被用在非数字键的数组上会崩溃的问题 (@pkaminski via #5216) #5224 修复 v-show 在 SSR 中不设置内联显示属性的问题 (@defcc via #5224) #5223 修复通过 注入 选项注入的数组值无效的问题 (@Kingwl via #5229) #5243 突变注入绑定时触发警告 (@rayrutjes via #5243) #5250 修复在 IE9 出现的 input[type=password] 行为 (@ktsn via #5253) 下载地址： Source code (zip) Source code (tar.gz)
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>6
    								</a>
    							</div>
    						</div>
    						<div class="thumb box-fr">
    							<a href="#">
    								<img alt="Vue 2.2.5 发布，轻量级 JavaScript 框架" style="max-width: 150px;" src="${pageContext.request.contextPath}/images/vue-js_XHYNa.png" class="small">
    							</a>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								Percona Server 5.6.35-81.0 发布，MySQL 衍生版
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								Percona Server 5.6.35-81.0 发布了，该版本基于 MySQL 5.6.35，并包括其中的所有错误修复。 Percona Server 5.6.35-81.0 是 Percona Server 5.6 系列中当前的 GA 版本。更新内容： 新特性： Percona Server 已经实现了新的 mysqldump  --order-by-primary-desc 选项。 此功能告诉 mysqldump 通过降序主键顺序（PRIMARY KEY DESC）来执行备份，如果存储引擎对主键使用反向列，这可能很有用。 Bugs 修复： When innodb_ft_result_cache_limit was exceeded by internal memory allocated by InnoDB during the FT scan not all memory was released which could lead to server assertion. Bug fixed #1634932 (upstream #83648). Log tracking initialization did not find last valid bitmap data correctly, potentially resulting in needless redo log retracking or hole in the tracked LSN range. Bug fixed #1658055. If Audit Log Plugin was unable to create file pointed by audit_log_file, the server would crash during the startup. Bug fixed #1666496. A DROP TEMPORARY TABLE ... for a table created by a CREATE TEMPORARY TABLE ... SELECT ... would get logged in the binary log on a disconnect with mixed mode replication. Bug fixed #1671013. TokuDB did not use an index with even if cardinality was good. Bug fixed #1671152. Row-based replication events were not reflected in Rows_updated fields in the User StatisticsINFORMATION_SCHEMA tables. Bug fixed #995624. A long-running binary log commit would block SHOW STATUS, which in turn could block a number of other operations such as client connects and disconnects. Bug fixed #1646100. It was impossible to use column compression dictionaries with partitioned InnoDB tables. Bug fixed #1653104. Diagnostics for OpenSSL errors have been improved. Bug fixed #1660339 (upstream #75311). When DuplicateWeedout strategy was used for joins, use was not reported in the query plan info output extension for the slow query log. Bug fixed #1592694. 其他 bug 修复： #1650321, #1650322, #1654501, #1663251, #1666213, #1652912, #1659548, #1663452, #1670834,...
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    						<div class="thumb box-fr">
    							<a href="#">
    								<img alt="Percona Server 5.6.35-81.0 发布，MySQL 衍生版" style="max-width: 150px;" src="${pageContext.request.contextPath}/images/percona.gif" class="small">
    							</a>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								每日一博 | 多场景使用的长 URL 转短链接解决方案开源
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								上一次本人写过一篇博客《长URL转短连接的简单设计与实现》，由于写得比较仓促，因此是确实设计的，因此方案也是不完整的，看到大家非常有热情，阅读的阅读收藏的收藏，我就深深的为写了这么不够深入的博客而感到不安，于是就有了这一篇博客，以及背后的开源代码。
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								Paradox —— 简单实现的小型深度学习框架
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								Paradox 是一个用 Python 3 和 numpy 实现一个简单的深度学习框架，了解流行框架的原理。
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								OSChina 周六乱弹 ——程序员想让对象一辈子跟你的秘籍
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								小时候被狗咬了一口，我以为没事，结果到现在还是单身。。。呃，被狗咬了一口，结果一直都是单身狗。
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								协作翻译 | 微服务和分布式对象第一定律
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								当我写 企业应用程序架构的模式 时，我创造了我所谓的分布式对象设计第一定律：“不分发你的对象”。近几个月来，微服务引起了很多人的兴趣，导致一些人质疑微服务是否违反了这项定律，如果是，我为什么赞成他们？
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>1
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								Linux 桌面 Xfce 被曝神级“Bug”，会破坏用户显示器
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								一位用户向 Xfce 项目递交了一个 Bug 报告，标题是“The default desktop startup screen causes damage to monitor!” Xfce 是类 UNIX 操作系统上的轻量级桌面环境，遵循 UNIX 的模块化和复用性哲学传统。它包含大量组件，有现代桌面环境所应具有的完整功能。 这位用户声称默认的桌面启动屏幕的”老鼠动画“会引发猫的好奇心，猫会伸出爪子抓屏幕，导致屏幕出现刮痕。 他同时还递交了补丁来修复这个问题，就是——将桌面上的老鼠改成狗。
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>11
    								</a>
    							</div>
    						</div>
    						<div class="thumb box-fr">
    							<a href="#">
    								<img alt="Linux 桌面 Xfce 被曝神级“Bug”，会破坏用户显示器" src="${pageContext.request.contextPath}/images/xfce.gif" class="small">
    							</a>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								OpenSSL 宣布将开源许可证更改为 Apache 2.0
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								OpenSSL 宣布将其许可证更改为 Apache License v 2.0，并启用了一个新网站。该网站将帮助 OpenSSL 团队联系迄今所有为该项目做出贡献的人完成许可证的更换。 OpenSSL 是目前非常流行的加密程序库，此前采用的许可证是 OpenSSL License 和 SSLeay License，其中 OpenSSL License 是 Apache License 1.0 许可证，而 SSLeay License 则是 4-clause BSD，这两个许可证与 GPL 许可证不兼容，GPL 软件使用 OpenSSL 时需要给予其例外。这次的许可证更改后，OpenSSL 将能更自由的整合到 GPL 软件中。 OpenSSL 此次更换许可证的行动，得到了许多人的赞赏和认同。软件自由法律中心的法律总监 Mishi Choudhary 说：“OpenSSL 作为应用最广泛的 FOSS 加密软件，将更加方便地被纳入到免费和开源软件中”。 Linux 基金会首席技术官 Nicko van Someren 也表示：“ Linux 基金会很高兴看到 OpenSSL 项目依据 Apache 许可证重新授权。当将 FOSS 项目纳入其他项目和产品时，使用一个标准并易于理解的许可证是非常重要的。OpenSSL 这一许可举措将进一步确保它坐稳世界上最重要和最受依赖的开源项目之一的地位”
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    						<div class="thumb box-fr">
    							<a href="#">
    								<img alt="OpenSSL 宣布将开源许可证更改为 Apache 2.0" src="${pageContext.request.contextPath}/images/openssl_ZG1ub.png" class="small">
    							</a>
    						</div>
    					</div>
    					
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								英国开发者编程语言和薪资调查：机器学习工资最高
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								Stack Overflow 最新调查报告显示，英国开发者的平均工资约为 44000 英镑，这比英国的全国平均工资（28000英镑）高出了 45％。 其中，机器学习的专家收入最高，为 56851 英镑。Web 开发人员平均为 42717 英镑，比桌面软件（£42313）和移动开发（£42223）略好。图形程序员 Graphics programmers（£39832）和平面设计师（£35863英镑）的收入最低。 在语言方面，JavaScript（65.3％）是调查中最常用的语言，其次是 SQL（54.5％）。之后，C＃（40.3％）、Python（30.9％）和 Java（29.2％）。 “最受欢迎”的语言排名结果略有不同：JavaScript（48.8％）、C＃（37.4％）、SQL（34.2％）和 Python（33.9％）占据前四。 有趣的是，Go 和 Swift 在常用语言排名较低，仅占比 3.8% 和 5.3％ ，但却很受欢迎，达到了 16.6%和 12% 。 编译自：zdnet
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    					</div>
    					
    					<div class="item box">
    						<div class="main-info box-aw">
    							<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    								<span class="text-ellipsis">
    								马来西亚 IT 决策者正转向开源来最大化 IT 功能
    								</span>
    							</a>
    							<div class="sc sc-text text-gradient wrap summary">
    								开源解决方案提供商红帽在关于亚太地区数字创新计划中使用开源的研究结果显示，马来西亚的大多数 IT 决策者正在转向开源，以最大化其 IT 能力。 该研究调查了来自亚太地区 9 个国家的 455 位首席信息官和 IT 决策者。收集的信息反映，马来西亚有 76％ 的受访者将开源视为节约成本的选择，而 24％ 的受访者认为开源是对其组织的战略投资。 红帽亚太区高级副总裁兼总经理 Dirk-Peter van Leeuwen 表示：“组织通过技术找到自己的竞争优势比以往任何时候都要更迫切。随着这一转变，开源逐渐发展成为技术创新的默认选择，帮助企业提高敏捷性，高效性和创新性” 。 该研究发现，在未来12个月内，受访者的首要 IT 计划如下： 更新和现代化核心应用程序（68％） 将后端系统和应用与面向移动和 Web 系统的客户集成（64％） 巩固面向客户的系统以创建单一客户视图（62％） 提高员工队伍效率和改善业务流动性（66％） 此外，马来西亚的受访者对开源的看法和计划如下： 70％ 的受访者认为，使用开源可以帮助他们的组织降低软件许可成本。 68％ 的受访者认为，开源使他们的组织能够参与到一个开放的创新合作伙伴生态系统中，这可以促进更大的合作。 62％ 的受访者认为，开源具有支持新功能的业务创新能力。 54％ 的受访者表示，他们的组织计划在未来 12 个月内采用并实施其技术路线图中的开源解决方案。 编译自：DigitalNewsAsia
    							</div>
    							<div class="from">
    								<a href="#">
    									<img class="avatar" alt="xxx" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
    								</a>
    								<span class="mr">
    									<a href="#">王练</a> 发布于 2017-03-25
    								</span>
    								<a href="#">
    									<i class="icon-svg icon-reply"></i>0
    								</a>
    							</div>
    						</div>
    					</div>
    					
    				
    				</div>
    				
    				
    				
    				
    			
    			</div>
    			
    		</div>
    		
    		
    		<div class="box-fr right-side">
    			<%
    				//TODO
    			%>
    			<div class="switcher" id="right-slide-switcher">
    				<a href="javascript:void(0);" class="item active">热门综合资讯</a>
    				<a href="javascript:void(0);" class="item">软件更新</a>
    			</div>
    			<div class="news-list-simple mb">
    				<div class="news-list-simple-item">
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							RedMonk 一季度编程语言排行榜，Python 反超 PHP
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-21
    							<a href="#"><i class="icon-svg icon-reply"></i>0</a>
    						</div>
    					</div>
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							年度大片：Stack Overflow 2017 开发者调查报告
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-21
    							<a href="#"><i class="icon-svg icon-reply"></i>0</a>
    						</div>
    					</div>
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							Linux 古老漏洞曝光！众发行版陷入困境
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-21
    							<a href="#"><i class="icon-svg icon-reply"></i>0</a>
    						</div>
    					</div>
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							重大漏洞预警：Struts 2 远程代码执行漏洞(s2-045\s2-046) (含PoC)
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-21
    							<a href="#"><i class="icon-svg icon-reply"></i>0</a>
    						</div>
    					</div>
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							美团 Android 热更新方案 Robust 开源，包含自动化补丁工具
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-21
    							<a href="#"><i class="icon-svg icon-reply"></i>0</a>
    						</div>
    					</div>
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							奇虎团队在 Pwn2Own 上组合利用三个漏洞逃脱虚拟机
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-21
    							<a href="#"><i class="icon-svg icon-reply"></i>0</a>
    						</div>
    					</div>
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							为何 Windows 10 总被黑？没想到真相竟是这样
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-21
    							<a href="#"><i class="icon-svg icon-reply"></i>0</a>
    						</div>
    					</div>
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							桌面操作系统份额大比拼：Windows 7 仍居首
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-21
    							<a href="#"><i class="icon-svg icon-reply"></i>0</a>
    						</div>
    					</div>
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							中国公司统治 Pwn2Own 2017，Edge 安全性垫底
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-21
    							<a href="#"><i class="icon-svg icon-reply"></i>0</a>
    						</div>
    					</div>
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							IntelliJ IDEA 2017.1 正式版发布
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-21
    							<a href="#"><i class="icon-svg icon-reply"></i>0</a>
    						</div>
    					</div>
    					
    				</div>
    				
    				
    				<div class="news-list-simple-item hide">
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							IntelliJ IDEA 2017.1 正式版发布
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-22
    							<a href="#"><i class="icon-svg icon-reply"></i>46</a>
    						</div>
    					</div>
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							Google Chrome 悄悄升级 WebGL 2.0 标准
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-22
    							<a href="#"><i class="icon-svg icon-reply"></i>46</a>
    						</div>
    					</div>
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							WebStorm 2017.1 发布：增加对 Vue.js 和 Jest 的支持
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-22
    							<a href="#"><i class="icon-svg icon-reply"></i>46</a>
    						</div>
    					</div>
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							Angular 4.0.0 正式版发布， Web 前端框架
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-22
    							<a href="#"><i class="icon-svg icon-reply"></i>46</a>
    						</div>
    					</div>
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							Omi v1.0 震撼发布 - 令人窒息的 Web 组件化框架
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-22
    							<a href="#"><i class="icon-svg icon-reply"></i>46</a>
    						</div>
    					</div>
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							VirtualBox 5.1.18 和 5.0.36 发布，改进共享文件夹
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-22
    							<a href="#"><i class="icon-svg icon-reply"></i>46</a>
    						</div>
    					</div>
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							GNOME 3.24 发布，新增 Night Light 模式
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-22
    							<a href="#"><i class="icon-svg icon-reply"></i>46</a>
    						</div>
    					</div>
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							Element 1.2.5 发布，饿了么 Vue 2.0 组件库
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-22
    							<a href="#"><i class="icon-svg icon-reply"></i>46</a>
    						</div>
    					</div>
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							O-MG，Google 发布 Android O 开发者预览版！
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-22
    							<a href="#"><i class="icon-svg icon-reply"></i>46</a>
    						</div>
    					</div>
    					<div class="item">
    						<a href="${pageContext.request.contextPath}/newsInfo" class="title">
    							Nginx 1.11.11 发布，高性能 Web 服务器
    						</a>
    						<div class="info">
    							<i class="icon-svg icon-time"></i>2017-03-22
    							<a href="#"><i class="icon-svg icon-reply"></i>46</a>
    						</div>
    					</div>
    				
    				</div>
    				
    			</div>
    			
    			<%
    			// TODO
    			%>
    			<div class="switch-title">
    				<div class="title">精彩评论</div>
    			</div>
    			
    			<div class="comment-list">
    				<div class="item box">
    					<div class="box-fl">
    						<img src="${pageContext.request.contextPath}/images/portrait.gif" class="avatar">
    					</div>
    					<div class="box-aw">
    						<a href="#" class="black">老司机，弯转得太急，差点没把我甩出去</a>
    						<div class="gray">
    							<a href="#" class="gray">Linux 桌面 Xfce 被曝神级“Bug”，会破坏用户显示器</a>
    						</div>
    					</div>
    				</div>
    				<div class="item box">
    					<div class="box-fl">
    						<img src="${pageContext.request.contextPath}/images/portrait.gif" class="avatar">
    					</div>
    					<div class="box-aw">
    						<a href="#" class="black">
    						狗哥：因为赛门铁克跟中国厂商合作推出免费证书，不符合人类希望的国家利益，所以必须封杀。 “不作恶”的狗哥处处作恶，呵呵。
    						</a>
    						<div class="gray">
    							<a href="#" class="gray">谷歌宣布逐步降低对赛门铁克 SSL 证书的信任</a>
    						</div>
    					</div>
    				</div>
    				<div class="item box">
    					<div class="box-fl">
    						<img src="${pageContext.request.contextPath}/images/portrait.gif" class="avatar">
    					</div>
    					<div class="box-aw">
    						<a href="#" class="black">我用着好就行，剩下的我就是来挑事儿的~！！！</a>
    						<div class="gray">
    							<a href="#" class="gray">十点总结，为何 Linux 如此深得人心</a>
    						</div>
    					</div>
    				</div>
    				<div class="item box">
    					<div class="box-fl">
    						<img src="${pageContext.request.contextPath}/images/portrait.gif" class="avatar">
    					</div>
    					<div class="box-aw">
    						<a href="#" class="black">国产良心</a>
    						<div class="gray">
    							<a href="#" class="gray">深度操作系统 15.4 RC 发布</a>
    						</div>
    					</div>
    				</div>
    				<div class="item box">
    					<div class="box-fl">
    						<img src="${pageContext.request.contextPath}/images/portrait.gif" class="avatar">
    					</div>
    					<div class="box-aw">
    						<a href="#" class="black">水文👎🏻</a>
    						<div class="gray">
    							<a href="#" class="gray">十点总结，为何 Linux 如此深得人心</a>
    						</div>
    					</div>
    				</div>
    				<div class="item box">
    					<div class="box-fl">
    						<img src="${pageContext.request.contextPath}/images/portrait.gif" class="avatar">
    					</div>
    					<div class="box-aw">
    						<a href="#" class="black">宇宙最强 IDE 出没，其它杂鱼请让道。</a>
    						<div class="gray">
    							<a href="#" class="gray">年度大片：Stack Overflow 2017 开发者调查报告</a>
    						</div>
    					</div>
    				</div>
    				<div class="item box">
    					<div class="box-fl">
    						<img src="${pageContext.request.contextPath}/images/portrait.gif" class="avatar">
    					</div>
    					<div class="box-aw">
    						<a href="#" class="black">我看到了开发经验下面的"20 or more years"那根长条...</a>
    						<div class="gray">
    							<a href="#" class="gray">年度大片：Stack Overflow 2017 开发者调查报告</a>
    						</div>
    					</div>
    				</div>
    				<div class="item box">
    					<div class="box-fl">
    						<img src="${pageContext.request.contextPath}/images/portrait.gif" class="avatar">
    					</div>
    					<div class="box-aw">
    						<a href="#" class="black">说mac是程序员最喜爱的平台的人呢？出来走两步</a>
    						<div class="gray">
    							<a href="#" class="gray">年度大片：Stack Overflow 2017 开发者调查报告</a>
    						</div>
    					</div>
    				</div>
    				<div class="item box">
    					<div class="box-fl">
    						<img src="${pageContext.request.contextPath}/images/portrait.gif" class="avatar">
    					</div>
    					<div class="box-aw">
    						<a href="#" class="black">前有java后有node，php地位尴尬，会一直走下坡路</a>
    						<div class="gray">
    							<a href="#" class="gray">年度大片：Stack Overflow 2017 开发者调查报告</a>
    						</div>
    					</div>
    				</div>
    				<div class="item box">
    					<div class="box-fl">
    						<img src="${pageContext.request.contextPath}/images/portrait.gif" class="avatar">
    					</div>
    					<div class="box-aw">
    						<a href="#" class="black">eage虽然用的人少，可是人家漏洞多啊</a>
    						<div class="gray">
    							<a href="#" class="gray">中国公司统治 Pwn2Own 2017，Edge 安全性垫底</a>
    						</div>
    					</div>
    				</div>

    			
    			</div>
    			
    			
    		</div>
    		
    		
    	</div>
    			

    
    
    
    </div>

</body>
</html>