<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="baidu-site-verification" content="2EGsKUN13v" />
<meta name="Keywords" content="">
<title>iyeeku - 找你想要的it知识</title>
	<%@ include file="header.jspf" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css" />
	
	<script type="text/javascript">
		$(function(){
			
			
			$("#compreNews").children("span").mouseover(function(){
				if(!$(this).hasClass("active")){
					$(this).addClass("active").siblings().removeClass("active");
					$(".col-of-news.compre .page").addClass("hide").eq($(this).index()).removeClass("hide");
				}
				
			});
			
			$("#softwareNews").children("span").mouseover(function(){
				if(!$(this).hasClass("active")){
					$(this).addClass("active").siblings().removeClass("active");
					$(".col-of-news.software .page").addClass("hide").eq($(this).index()).removeClass("hide");
				}
			});
			
		});
	
	</script>
	<style>
		.favor-icon{
		    margin: 0 3px 0 0;
		    width: 16px;
		    height: 16px;
		    background: transparent url(../iyeeku/svg/icon-thumbs-grey.svg) no-repeat center;
		    background-size: cover;
		    transition: background .2s;
		}
		.ssmicon{
			width:12px!important;
		}
	</style>
</head>
<body>
	<%@ include file="nav.jspf" %>
	
	<div class="home-space">
		<div class="box vertical iye-header iye-banner">
			<div style="width: 1200px;margin: auto;">
				<span style="font-weight: bold;color: red;font-size: 17px;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;个人声明：本人是一名JAVA开发工程师。对于学习，纸上得来终觉浅，绝知此事要躬行，才会在工作之余编写此网站。对于我来说，页面设计是很头疼的事情，所以我直接仿写了开源中国的部分页面。</span>
			</div>
<%-- 			<div class="banner-box box vertical">
				<div class="box vertical box-fl">
					<a href="home.jsp" class="iye-title" title="iyeeku">
						<img alt="iyeeku LOGO" src="${pageContext.request.contextPath}/svg/oschina.svg">
					</a>
				</div>
				<div class="box-fr">
					<form class="iye-search" action="#">
						<input type="hidden" name="scope" value="project">
						<input type="text" class="search-text" placeholder="在 43502 款开源软件中搜索" name="q">
						<button type="submit" class="ic-search box vertical"></button>
					</form>
				</div>
			</div> --%>
		</div>
		
		<!-- 首页整体缓存 -->
		<div class="box sc-container" style="width: 1200px;">
			<!-- 左侧 -->
			<div class="box-aw main-container">
				<!-- 资讯区 -->
				<div class="box justify news-container" id="v_news">
					<% //TODO %>
					<!-- 综合资讯和软件 -->
					<div class="col-of-news compre">
						<div class="box justify content-header flag">
							<a href="${pageContext.request.contextPath}/news" class="title fb" title="综合资讯">综合资讯</a>
							<!-- 固定在第一条的内容 -->
							<div class="box vertical" id="compreNews">
								<span class="diamond active"></span>
								<span class="diamond"></span>
								<span class="diamond"></span>
								<a href="${pageContext.request.contextPath}/news" class="more" title="更多综合资讯">更多</a>
							</div>
						</div>
						<div class="top1">
							<div class="box vertical">
								<div class="box-aw">
									<a class="top1-link" href="${pageContext.request.contextPath}/newsInfo" target="_blank" title="年度大片：Stack Overflow 2017 开发者调查报告">
										年度大片：Stack Overflow 2017 开发者调查报告
									</a>
									<p class="wrap top1-content">Stack Overflow 发布了 2017 开发者调查报告，此次有超过 64,000 名开发人员参与调查，分别对其技能、工...</p>
								</div>
							</div>
						</div>
						<!-- 第一页 -->
						<div class="page">
							<div class="box vertical news">
								<a class="news-link is-today " target="_blank" href="${pageContext.request.contextPath}/newsInfo" title="4月武汉&长沙源创会，揭秘超大规模搜索引擎背后那些事">
									4月武汉&长沙源创会，揭秘超大规模搜索引擎背后那些事
								</a>
								<span class="box-fr news-date">03/25</span>
							</div>
							<div class="box vertical news">
                    			<a class="news-link is-today " href="${pageContext.request.contextPath}/newsInfo" title="源资讯 | Python 真的超过 PHP 了，一大波漏洞来袭！" target="_blank">
                    				源资讯 | Python 真的超过 PHP 了，一大波漏洞来袭！
                    			</a>
                    			<span class="box-fr news-date">03/25</span>
                			</div>
                            <div class="box vertical news">
                    			<a class="news-link is-today " href="${pageContext.request.contextPath}/newsInfo" title="码云推荐 | Android 优雅、高度自定义、性能高效的日历控件" target="_blank">
                    				码云推荐 | Android 优雅、高度自定义、性能高效的日历控件
                    			</a>
                    			<span class="box-fr news-date">03/25</span>
                			</div>
                            <div class="box vertical news">
                    			<a class="news-link is-today " href="${pageContext.request.contextPath}/newsInfo" title="每日一博 | 多场景使用的长 URL 转短链接解决方案开源" target="_blank">
                    			每日一博 | 多场景使用的长 URL 转短链接解决方案开源
                    			</a>
                    			<span class="box-fr news-date">03/25</span>
                			</div>
                            <div class="box vertical news">
                    			<a class="news-link is-today " href="${pageContext.request.contextPath}/newsInfo" title="Paradox —— 简单实现的小型深度学习框架" target="_blank">
                    				Paradox —— 简单实现的小型深度学习框架
                    			</a>
                    			<span class="box-fr news-date">03/25</span>
               				</div>
                            <div class="box vertical news">
                    			<a class="news-link is-today " href="${pageContext.request.contextPath}/newsInfo" title="OSChina 周六乱弹 ——程序员想让对象一辈子跟你的秘籍" target="_blank">
                    				OSChina 周六乱弹 ——程序员想让对象一辈子跟你的秘籍
                    			</a>
                    			<span class="box-fr news-date">03/25</span>
                			</div>
                            <div class="box vertical news">
                    			<a class="news-link is-today " href="${pageContext.request.contextPath}/newsInfo" title="协作翻译 | 微服务和分布式对象第一定律" target="_blank">
                    				协作翻译 | 微服务和分布式对象第一定律
                    			</a>
                    			<span class="box-fr news-date">03/25</span>
                			</div>
                            <div class="box vertical news">
                    			<a class="news-link is-today " href="${pageContext.request.contextPath}/newsInfo" title="Linux 桌面 Xfce 被曝神级“Bug”，会破坏用户显示器" target="_blank">
                    				Linux 桌面 Xfce 被曝神级“Bug”，会破坏用户显示器
                    			</a>
                    			<span class="box-fr news-date">03/25</span>
                			</div>
                            <div class="box vertical news">
                    			<a class="news-link is-today " href="${pageContext.request.contextPath}/newsInfo" title="OpenSSL 宣布将开源许可证更改为 Apache 2.0" target="_blank">
                    				OpenSSL 宣布将开源许可证更改为 Apache 2.0
                    			</a>
                    			<span class="box-fr news-date">03/25</span>
                			</div>
                            <div class="box vertical news">
                    			<a class="news-link is-today " href="${pageContext.request.contextPath}/newsInfo" title="英国开发者编程语言和薪资调查：机器学习工资最高" target="_blank">
                    				英国开发者编程语言和薪资调查：机器学习工资最高
                    			</a>
                    			<span class="box-fr news-date">03/25</span>
                			</div>
						</div>
						
						<!-- 第二页 -->
						<div class="page hide">
							 <div class="box vertical news">
                <a class="news-link is-today" href="${pageContext.request.contextPath}/newsInfo" title="马来西亚 IT 决策者正转向开源来最大化 IT 功能" target="_blank">马来西亚 IT 决策者正转向开源来最大化 IT 功能</a>
                <span class="box-fr news-date">03/25</span>
            </div>
                    <div class="box vertical news">
                <a class="news-link   " href="${pageContext.request.contextPath}/newsInfo" title="【众包】华为6万+众包项目费等你来领" target="_blank">【众包】华为6万+众包项目费等你来领</a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a class="news-link   " href="${pageContext.request.contextPath}/newsInfo" title="谷歌宣布逐步降低对赛门铁克 SSL 证书的信任" target="_blank">谷歌宣布逐步降低对赛门铁克 SSL 证书的信任</a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a class="news-link   " href="${pageContext.request.contextPath}/newsInfo" title="4月15-16日，武汉、长沙源创会报名正式启动！" target="_blank">4月15-16日，武汉、长沙源创会报名正式启动！</a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a class="news-link   " href="${pageContext.request.contextPath}/newsInfo" title="接地气又好用，8 款优秀的国产开源博客系统推荐" target="_blank">接地气又好用，8 款优秀的国产开源博客系统推荐</a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a class="news-link   " href="${pageContext.request.contextPath}/newsInfo" title="每日一博 | Android Studio 中 VCS 的使用介绍" target="_blank">每日一博 | Android Studio 中 VCS 的使用介绍</a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a class="news-link   " href="${pageContext.request.contextPath}/newsInfo" title="协作翻译 | 机器学习利用 Elasticsearch 进行更智能搜索" target="_blank">协作翻译 | 机器学习利用 Elasticsearch 进行更智能搜索</a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a class="news-link   " href="${pageContext.request.contextPath}/newsInfo" title="OSChina 周五乱弹——什么情况下两人间的距离为负数" target="_blank">OSChina 周五乱弹——什么情况下两人间的距离为负数</a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a class="news-link   " href="${pageContext.request.contextPath}/newsInfo" title="PyQuery —— jQuery 风格的 HTML/XML 解析库" target="_blank">PyQuery —— jQuery 风格的 HTML/XML 解析库</a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a class="news-link   " href="${pageContext.request.contextPath}/newsInfo" title="码云推荐 | Swift 版本星级评价控件 StarEvaluateView" target="_blank">码云推荐 | Swift 版本星级评价控件 StarEvaluateView</a>
                <span class="box-fr news-date">03/24</span>
            </div>
						</div>
						
						<!-- 第三页 -->
						<div class="page hide">
							<div class="box vertical news">
                <a class="news-link   " href="${pageContext.request.contextPath}/newsInfo" target="_blank" title="十点总结，为何 Linux 如此深得人心">十点总结，为何 Linux 如此深得人心</a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a class="news-link   " href="${pageContext.request.contextPath}/newsInfo" target="_blank" title="厉害了我的 LastPass，快速修复严重的密码泄漏漏洞">厉害了我的 LastPass，快速修复严重的密码泄漏漏洞</a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a class="news-link   " href="${pageContext.request.contextPath}/newsInfo" target="_blank" title="W3C 准备将 DRM 定为 Web 标准">W3C 准备将 DRM 定为 Web 标准</a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a class="news-link   " href="${pageContext.request.contextPath}/newsInfo" target="_blank" title="还在为测试发愁？10 个开源的压力/负载测试工具">还在为测试发愁？10 个开源的压力/负载测试工具</a>
                <span class="box-fr news-date">03/23</span>
            </div>
                    <div class="box vertical news">
                <a class="news-link   " href="${pageContext.request.contextPath}/newsInfo" target="_blank" title="每日一博 | Linux+Nginx+Asp.net Core 及守护进程部署">每日一博 | Linux+Nginx+Asp.net Core 及守护进程部署</a>
                <span class="box-fr news-date">03/23</span>
            </div>
                    <div class="box vertical news">
                <a class="news-link   " href="${pageContext.request.contextPath}/newsInfo" target="_blank" title="协作翻译 | C# 7 中的 Tuple 特性介绍">协作翻译 | C# 7 中的 Tuple 特性介绍</a>
                <span class="box-fr news-date">03/23</span>
            </div>
                    <div class="box vertical news">
                <a class="news-link   " href="${pageContext.request.contextPath}/newsInfo" target="_blank" title="OSChina 周四乱弹 ——1000万没了！因这孩子在家这样">OSChina 周四乱弹 ——1000万没了！因这孩子在家这样</a>
                <span class="box-fr news-date">03/23</span>
            </div>
                    <div class="box vertical news">
                <a class="news-link   " href="${pageContext.request.contextPath}/newsInfo" target="_blank" title="码云推荐 | MongoDB 事务处理包 mongo-tx">码云推荐 | MongoDB 事务处理包 mongo-tx</a>
                <span class="box-fr news-date">03/23</span>
            </div>
                    <div class="box vertical news">
                <a class="news-link" href="${pageContext.request.contextPath}/newsInfo" target="_blank" title="Misago —— 基于 Django 和 React.js 开发的论坛">Misago —— 基于 Django 和 React.js 开发的论坛</a>
                <span class="box-fr news-date">03/23</span>
            </div>
                    <div class="box vertical news">
                <a class="news-link   " href="${pageContext.request.contextPath}/newsInfo" target="_blank" title="IBM 联手 Red Hat 构建开源混合云环境">IBM 联手 Red Hat 构建开源混合云环境</a>
                <span class="box-fr news-date">03/23</span>
            </div>
						</div>
						
					</div>
					<!-- 软件资讯 -->
					<% //TODO %>
					<div class="col-of-news software">
						<div class="box justify content-header">
							<a href="${pageContext.request.contextPath}/news" class="title fb" title="软件更新资讯">软件更新资讯</a>
							<div class="box vertical" id="softwareNews">
								<span class="diamond"></span>
								<span class="diamond active"></span>
								<span class="diamond"></span>
								<a href="${pageContext.request.contextPath}/news" class="more" title="软件更新资讯">更多</a>
							</div>
						</div>
						<div class="top1">
							<div class="box vertical">
								<div class="box-aw">
									<a class="top1-link" href="${pageContext.request.contextPath}/newsInfo" target="_blank" title="PHPStorm 2017.1 发布，PHP 集成开发环境">
										PHPStorm 2017.1 发布，PHP 集成开发环境
									</a>
									<p class="wrap top1-content">PHPStorm无疑是开发PHP项目的神器，秉承着JetBrains家族的优良传统，是用来写世界上最好的语言的不二选择...</p>
								</div>
							</div>
						</div>
						<div class="page hide">
							<div class="box vertical news">
                    			<a target="_blank" class="news-link is-today" href="${pageContext.request.contextPath}/newsInfo" title="NutzWk 4.0.7 和 3.3.6 发布，Java 企业级开源开发框架">
                    				NutzWk 4.0.7 和 3.3.6 发布，Java 企业级开源开发框架
                    			</a>
                    			<span class="box-fr news-date">03/25</span>
                			</div>
                            <div class="box vertical news">
                    			<a target="_blank" class="news-link is-today" href="${pageContext.request.contextPath}/newsInfo" title="Hibernate Validator 5.4.1.Final，Bean 验证框架">
                    				Hibernate Validator 5.4.1.Final，Bean 验证框架
                    			</a>
                    			<span class="box-fr news-date">03/25</span>
                			</div>
                            <div class="box vertical news">
                    			<a target="_blank" class="news-link is-today" href="${pageContext.request.contextPath}/newsInfo" title="PyCharm 2017.1 正式发布：有更快的调试器">
                    				PyCharm 2017.1 正式发布：有更快的调试器
                    			</a>
                    			<span class="box-fr news-date">03/25</span>
                			</div>
                            <div class="box vertical news">
                    			<a target="_blank" class="news-link is-today" href="${pageContext.request.contextPath}/newsInfo" title="Vue 2.2.5 发布，轻量级 JavaScript 框架">
                    				Vue 2.2.5 发布，轻量级 JavaScript 框架
                    			</a>
                    			<span class="box-fr news-date">03/25</span>
                			</div>
                            <div class="box vertical news">
                    			<a target="_blank" class="news-link is-today" href="${pageContext.request.contextPath}/newsInfo" title="Percona Server 5.6.35-81.0 发布，MySQL 衍生版">
                    				Percona Server 5.6.35-81.0 发布，MySQL 衍生版
                    			</a>
                    			<span class="box-fr news-date">03/25</span>
                			</div>
                            <div class="box vertical news">
                    			<a target="_blank" class="news-link is-today" href="${pageContext.request.contextPath}/newsInfo" title="Apache Calcite 1.12.0 发布，动态数据管理框架">
                    				Apache Calcite 1.12.0 发布，动态数据管理框架
                    			</a>
                    			<span class="box-fr news-date">03/25</span>
                			</div>
                            <div class="box vertical news">
                    			<a target="_blank" class="news-link is-today" href="${pageContext.request.contextPath}/newsInfo" title="Git v2.12.2 发布，分布式版本控制系统">
                    				Git v2.12.2 发布，分布式版本控制系统
                    			</a>
                    		<span class="box-fr news-date">03/25</span>
                			</div>
                            <div class="box vertical news">
                    			<a target="_blank" class="news-link is-today" href="${pageContext.request.contextPath}/newsInfo" title="Revel v0.14.0 发布，Go 的全堆栈 Web 框架">
                    				Revel v0.14.0 发布，Go 的全堆栈 Web 框架
                    			</a>
                    			<span class="box-fr news-date">03/25</span>
                			</div>
                            <div class="box vertical news">
                    			<a target="_blank" class="news-link is-today" href="${pageContext.request.contextPath}/newsInfo" title="Sequelize 3.30.3 发布，Node.js 的 ORM">
                    				Sequelize 3.30.3 发布，Node.js 的 ORM
                    			</a>
                    			<span class="box-fr news-date">03/25</span>
                			</div>
                            <div class="box vertical news">
                    			<a target="_blank" class="news-link is-today" href="${pageContext.request.contextPath}/newsInfo" title="Apache Phoenix 4.10 发布，HBase 的 SQL 驱动">
                    				Apache Phoenix 4.10 发布，HBase 的 SQL 驱动
                    			</a>
                    			<span class="box-fr news-date">03/25</span>
                			</div>
						</div>
						<!-- 第二页 -->
						<div class="page">
							<div class="box vertical news">
                				<a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="nice Validator V1.0.10 发布，领先的表单验证解决方案">
                					nice Validator V1.0.10 发布，领先的表单验证解决方案
                				</a>
                				<span class="box-fr news-date">03/24</span>
            				</div>
                    		<div class="box vertical news">
                				<a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="TinyForm 0.7.5 发布，简单的WEB表单工具">
                					TinyForm 0.7.5 发布，简单的WEB表单工具
                				</a>
                				<span class="box-fr news-date">03/24</span>
            				</div>
                    		<div class="box vertical news">
                				<a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="Jackson 2.9.0.pr2 发布，高性能 JSON 处理">
                					Jackson 2.9.0.pr2 发布，高性能 JSON 处理
                				</a>
                				<span class="box-fr news-date">03/24</span>
            				</div>
                    		<div class="box vertical news">
                				<a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="Dropwizard 1.1.0 发布，Java 框架">
                					Dropwizard 1.1.0 发布，Java 框架
                				</a>
                				<span class="box-fr news-date">03/24</span>
            				</div>
                    		<div class="box vertical news">
                				<a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="Ubuntu 17.04 Beta 2 发布，现可下载">
                					Ubuntu 17.04 Beta 2 发布，现可下载
                				</a>
                				<span class="box-fr news-date">03/24</span>
            				</div>
                    		<div class="box vertical news">
                				<a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="PHPStorm 2017.1 发布，PHP 集成开发环境">
                					PHPStorm 2017.1 发布，PHP 集成开发环境
                				</a>
                				<span class="box-fr news-date">03/24</span>
            				</div>
                    		<div class="box vertical news">
                				<a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="Angular 4.0.0 正式版发布， Web 前端框架">
                					Angular 4.0.0 正式版发布， Web 前端框架
                				</a>
                				<span class="box-fr news-date">03/24</span>
            				</div>
                    		<div class="box vertical news">
                				<a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="BoPress v1.2.2 发布，Python 后台管理">
                					BoPress v1.2.2 发布，Python 后台管理
                				</a>
                				<span class="box-fr news-date">03/24</span>
            				</div>
                    		<div class="box vertical news">
                				<a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="UCKeFu v1.1.0 Preview 1 发布，全渠道客服系统">
                					UCKeFu v1.1.0 Preview 1 发布，全渠道客服系统
                				</a>
                				<span class="box-fr news-date">03/24</span>
            				</div>
                    		<div class="box vertical news">
                				<a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="ZUI 发布 1.6 版本，开源HTML5跨屏UI框架">
                					ZUI 发布 1.6 版本，开源HTML5跨屏UI框架
                				</a>
                				<span class="box-fr news-date">03/24</span>
            				</div>
						</div>
						
						<!-- 第三页 -->
						<div class="page hide">
							<div class="box vertical news">
                <a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="Presto 0.170 发布，Facebook 开源的大数据查询引擎  ">Presto 0.170 发布，Facebook 开源的大数据查询引擎  </a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="xmake v2.1.2 版本更新，增强 Visual Studio 工程支持">xmake v2.1.2 版本更新，增强 Visual Studio 工程支持</a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="Brackets 1.9 发布，Web 前端开发 IDE">Brackets 1.9 发布，Web 前端开发 IDE</a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="Python 3.6.1 发布，3.6 系列首个维护版本">Python 3.6.1 发布，3.6 系列首个维护版本</a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="Ruby 2.4.1 发布，开源的动态编程语言">Ruby 2.4.1 发布，开源的动态编程语言</a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="ReSharper Ultimate 2017.1 EAP 6 发布">ReSharper Ultimate 2017.1 EAP 6 发布</a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="深度操作系统 15.4 RC 发布">深度操作系统 15.4 RC 发布</a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="Apache Gora 0.7 发布，NoSQL 的 ORM 框架">Apache Gora 0.7 发布，NoSQL 的 ORM 框架</a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="ExTiX 17.2 发布，基于 Ubuntu 的桌面 Linux 发行">ExTiX 17.2 发布，基于 Ubuntu 的桌面 Linux 发行</a>
                <span class="box-fr news-date">03/24</span>
            </div>
                    <div class="box vertical news">
                <a target="_blank" class="news-link" href="${pageContext.request.contextPath}/newsInfo" title="Apache Kudu 1.3.0 发布，Hadoop 存储系统">Apache Kudu 1.3.0 发布，Hadoop 存储系统</a>
                <span class="box-fr news-date">03/24</span>
            </div>
						</div>
						
						
					</div>
					
				</div> <!-- end 资讯区 -->
				
				<!-- 技术答疑 -->
				<div class="">
					<!-- 头 -->
					<div class="box justify content-header flag">
						<a href="${pageContext.request.contextPath}/question" class="title fb" title="技术问答">技术问答</a>
						<!-- 固定在第一条的内容 -->
						<div class="box box-aw link-wrapper">
							<a class="sub-link" href="${pageContext.request.contextPath}/question" title="技术问答">技术问答</a>
							<a class="sub-link" href="${pageContext.request.contextPath}/question2" title="技术分享">技术分享</a>
							<a class="sub-link" href="${pageContext.request.contextPath}/question3" title="IT大杂烩">IT大杂烩</a>
							<a class="sub-link" href="${pageContext.request.contextPath}/question4" title="站务/建议">站务/建议</a>
							<a class="sub-link r-highlight" href="${pageContext.request.contextPath}/question5" title="职业生涯">职业生涯</a>
						</div>
						<div class="box vertical box-fr">
							<a href="${pageContext.request.contextPath}/ask" class="image-url" title="我要提问">
								<img class="smicon" src="${pageContext.request.contextPath}/svg/ic_add.svg">
							</a>
							<a href="${pageContext.request.contextPath}/ask" class="more icon" title="我要提问">我要提问</a>
						</div>
					</div>
					<div class="box question-container">
						<!-- 列表 -->
						<div class="box-aw">
							<!-- 热门标签 -->
							<div class="box wrap tags-wrapper">
								<a class="tag" href="${pageContext.request.contextPath}/question" title="原创翻译">原创翻译</a>
								<a class="tag" href="${pageContext.request.contextPath}/question" title="OSCHINA">OSCHINA</a>
								<a class="tag" href="${pageContext.request.contextPath}/question" title="Java">Java</a>
								<a class="tag" href="${pageContext.request.contextPath}/question" title="C/C++">C/C++</a>
								<a class="tag" href="${pageContext.request.contextPath}/question" title="PHP">PHP</a>
								<a class="tag" href="${pageContext.request.contextPath}/question" title="Android">Android</a>
								<a class="tag" href="${pageContext.request.contextPath}/question" title="iOS">iOS</a>
							</div>
							<!-- 问答列表 -->
							<div>
								<div class="box vertical osc-link">
									<a href="${pageContext.request.contextPath}/question" class="link-content technology-width  highlight" title="高手问答第 146 期 — 分布式系统常用技术及案例分析">
										[顶]高手问答第 146 期 — 分布式系统常用技术及案例分析
									</a>
									<span class="box-fr sub-of">46回/2598阅</span>
								</div>
								
								<div class="box vertical osc-link">
                <a title="【谁动了我的开源内裤？】2017年深圳源创会图文回顾" class="link-content technology-width  highlight" href="${pageContext.request.contextPath}/question">[顶]【谁动了我的开源内裤？】2017年深圳源创会图文回顾</a>
                <span class="box-fr sub-of">52回/2455阅</span>
            </div>
                                            
            <div class="box vertical osc-link">
                <a title="【粉丝福利】-JavaScript＋jquery＋ｈtmｌ５特效实战，全方位逻辑思维特训!" class="link-content technology-width  highlight" href="${pageContext.request.contextPath}/question">[顶]【粉丝福利】-JavaScript＋jquery＋ｈtmｌ５特效实战，全方位逻辑思维特训!</a>
                <span class="box-fr sub-of">0回/281阅</span>
            </div>

            <div class="box vertical osc-link">
                <a title="【开源访谈】乔国治：分布式数据库如何实现海量数据实时查询" class="link-content technology-width  highlight" href="${pageContext.request.contextPath}/question">[顶]【开源访谈】乔国治：分布式数据库如何实现海量数据实时查询</a>
                <span class="box-fr sub-of">5回/2750阅</span>
            </div>
                                            
            <div class="box vertical osc-link">
                <a title="400余份阿里珍贵技术资料限时免费下载（持续更新中）" class="link-content technology-width  highlight" href="${pageContext.request.contextPath}/question">[顶]400余份阿里珍贵技术资料限时免费下载（持续更新中）</a>
                <span class="box-fr sub-of">8回/2425阅</span>
            </div>
                                            
            <div class="box vertical osc-link">
                <a title="基于Java的微信二次开发课程分享" class="link-content technology-width" href="${pageContext.request.contextPath}/question">基于Java的微信二次开发课程分享</a>
                <span class="box-fr sub-of">63回/401阅</span>
            </div>

            <div class="box vertical osc-link">
                <a title="！新手！ 关于PHP常驻内存的问题" class="link-content technology-width" href="${pageContext.request.contextPath}/question">！新手！ 关于PHP常驻内存的问题</a>
                <span class="box-fr sub-of">0回/14阅</span>
            </div>

            <div class="box vertical osc-link">
                <a title="搞微服务有什么意义" class="link-content technology-width" href="${pageContext.request.contextPath}/question">搞微服务有什么意义</a>
                <span class="box-fr sub-of">1回/41阅</span>
            </div>

            <div class="box vertical osc-link">
                <a title="java正则--匹配两个标签之间的内容" class="link-content technology-width" href="${pageContext.request.contextPath}/question">java正则--匹配两个标签之间的内容</a>
                <span class="box-fr sub-of">1回/26阅</span>
            </div>
                                            
            <div class="box vertical osc-link">
                <a title="为什么这样遍历容易出现NullPointerException" class="link-content technology-width" href="${pageContext.request.contextPath}/question">为什么这样遍历容易出现NullPointerException</a>
                <span class="box-fr sub-of">3回/80阅</span>
            </div>

            <div class="box vertical osc-link">
                <a title="postman rest client加载问题：TypeError: Cannot assign to read only property 'indexedDB' of object '#&lt;Window&gt;'" class="link-content technology-width" href="${pageContext.request.contextPath}/question">
                	postman rest client加载问题：TypeError: Cannot assign to read only property 'indexedDB' of object '#&lt;Window&gt;'</a>
                <span class="box-fr sub-of">0回/8阅</span>
            </div>

            <div class="box vertical osc-link">
                <a title="PHP手册内的函数说明，就是PHP的API吗？" class="link-content technology-width" href="${pageContext.request.contextPath}/question">PHP手册内的函数说明，就是PHP的API吗？</a>
                <span class="box-fr sub-of">3回/100阅</span>
            </div>
                                            
            <div class="box vertical osc-link">
                <a title="eclipsercp怎么创建内部子窗体，类似internalframe" class="link-content technology-width" href="${pageContext.request.contextPath}/question">eclipsercp怎么创建内部子窗体，类似internalframe</a>
                <span class="box-fr sub-of">0回/2阅</span>
            </div>
                                            
            <div class="box vertical osc-link">
                <a title="小道消息，微信小程序即将支持外埠二维码，那小程序真的会火起来嘛？" class="link-content technology-width" href="${pageContext.request.contextPath}/question">小道消息，微信小程序即将支持外埠二维码，那小程序真的会火起来嘛？</a>
                <span class="box-fr sub-of">1回/6阅</span>
            </div>
								
							</div>
							
						</div>
						<!-- 高手问答，精彩问答 -->
						<div class="box-fr sub-question-container" style="background-color: gray;">
							<!-- 高手问答 -->
							<div class="master-card">
							
							
							</div>
						</div>
						
					</div>
				</div>
				
				
				<!-- 博客 -->
				<div>
					<div class="box justify content-header flag">
						<a href="${pageContext.request.contextPath}/blog" class="title fb" title="博客">博客</a>
						<div class="box box-aw link-wrapper">
							<a class="sub-link" href="${pageContext.request.contextPath}/blog" title="前端开发">前端开发</a>
							<a class="sub-link" href="${pageContext.request.contextPath}/blog" title="人工智能">人工智能</a>
							<a class="sub-link" href="${pageContext.request.contextPath}/blog" title="服务端开发/管理">服务端开发/管理</a>
							<a class="sub-link" href="${pageContext.request.contextPath}/blog" title="游戏开发">游戏开发</a>
							<a class="sub-link" href="${pageContext.request.contextPath}/blog" title="编程语言">编程语言</a>
							<a class="sub-link" href="${pageContext.request.contextPath}/blog" title="数据库">数据库</a>
							<a class="sub-link" href="${pageContext.request.contextPath}/blog" title="企业开发">企业开发</a>
						</div>
						<div class="box-fr">
							<a href="${pageContext.request.contextPath}/blog" class="more" title="更多博客">更多</a>
						</div>
					</div>
					<!-- 推荐博客列表 -->
					<div class="box">
						<div class="box-aw">
							<div class="box vertical justify osc-link">
								<a class="link-content blog-width" href="${pageContext.request.contextPath}/blogInfo" title="Apache启用mod_expires&mod_headers实现静态缓存">
								Apache启用mod_expires&mod_headers实现静态缓存
								</a>
								<span class="sub-of">42阅/0评/0赞</span>
							</div>
							
							<div class="box vertical justify osc-link">
                    
                    <a class="link-content blog-width" href="${pageContext.request.contextPath}/blogInfo" title="Spring-Boot整合mybatis(三)-注解的基本使用">Spring-Boot整合mybatis(三)-注解的基本使用</a>
                    <span class="sub-of">186阅/0评/1赞</span>
                </div>
                            <div class="box vertical justify osc-link">
                    
                    <a class="link-content blog-width" href="${pageContext.request.contextPath}/blogInfo" title="适合各种使用场景的长URL转短链接的完整解决方案开源了">适合各种使用场景的长URL转短链接的完整解决方案开源了</a>
                    <span class="sub-of">615阅/2评/3赞</span>
                </div>
                            <div class="box vertical justify osc-link">
                    
                    <a class="link-content blog-width" href="${pageContext.request.contextPath}/blogInfo" title="HBase数据模型与架构实现">HBase数据模型与架构实现</a>
                    <span class="sub-of">60阅/0评/0赞</span>
                </div>
                            <div class="box vertical justify osc-link">
                    
                    <a class="link-content blog-width" href="${pageContext.request.contextPath}/blogInfo" title="10分钟教你学会Yii2手动安装第三方扩展">10分钟教你学会Yii2手动安装第三方扩展</a>
                    <span class="sub-of">46阅/0评/0赞</span>
                </div>
                            <div class="box vertical justify osc-link">
                    
                    <a class="link-content blog-width" href="${pageContext.request.contextPath}/blogInfo" title="【源资讯 第20期】Python 真的超过 PHP 了；又有一波漏洞曝光，Linux、Gitlab 中招！">【源资讯 第20期】Python 真的超过 PHP 了；又有一波漏洞曝光，Linux、Gitlab 中招！</a>
                    <span class="sub-of">2300阅/23评/2赞</span>
                </div>
                            <div class="box vertical justify osc-link">
                    
                    <a class="link-content blog-width" href="${pageContext.request.contextPath}/blogInfo" title="Angular2学习笔记(五) Angular2 表单">Angular2学习笔记(五) Angular2 表单</a>
                    <span class="sub-of">71阅/0评/1赞</span>
                </div>
                            <div class="box vertical justify osc-link">
                    
                    <a class="link-content blog-width" href="${pageContext.request.contextPath}/blogInfo" title="从hammer到jewel的RGW升级实战">从hammer到jewel的RGW升级实战</a>
                    <span class="sub-of">26阅/0评/0赞</span>
                </div>
                            <div class="box vertical justify osc-link">
                    
                    <a class="link-content blog-width" href="${pageContext.request.contextPath}/blogInfo" title="Swoole C++扩展已支持php-fpm环境">Swoole C++扩展已支持php-fpm环境</a>
                    <span class="sub-of">594阅/4评/3赞</span>
                </div>
                            <div class="box vertical justify osc-link">
                    
                    <a class="link-content blog-width" href="${pageContext.request.contextPath}/blogInfo" title="Spring Boot 整合 Mybatis 实现 Druid 多数据源详解">Spring Boot 整合 Mybatis 实现 Druid 多数据源详解</a>
                    <span class="sub-of">360阅/2评/0赞</span>
                </div>
                            <div class="box vertical justify osc-link">
                    
                    <a class="link-content blog-width" href="${pageContext.request.contextPath}/blogInfo" title="Java虚拟机管理的内存运行时数据区域解释">Java虚拟机管理的内存运行时数据区域解释</a>
                    <span class="sub-of">151阅/2评/1赞</span>
                </div>
                            <div class="box vertical justify osc-link">
                    
                    <a class="link-content blog-width" href="${pageContext.request.contextPath}/blogInfo" title="引入 Activemq 之后日志冲突问题解决方案">引入 Activemq 之后日志冲突问题解决方案</a>
                    <span class="sub-of">131阅/2评/0赞</span>
                </div>
                            <div class="box vertical justify osc-link">
                    
                    <a class="link-content blog-width" href="${pageContext.request.contextPath}/blogInfo" title="python模块之re正则表达式">python模块之re正则表达式</a>
                    <span class="sub-of">95阅/0评/2赞</span>
                </div>
                            <div class="box vertical justify osc-link">
                    
                    <a class="link-content blog-width" href="${pageContext.request.contextPath}/blogInfo" title="vuejs的初上手项目">vuejs的初上手项目</a>
                    <span class="sub-of">312阅/1评/1赞</span>
                </div>
                            <div class="box vertical justify osc-link">
                    
                    <a class="link-content blog-width" href="${pageContext.request.contextPath}/blogInfo" title="Python爬虫—破解JS加密的Cookie">Python爬虫—破解JS加密的Cookie</a>
                    <span class="sub-of">277阅/4评/3赞</span>
                </div>
							
						</div>
						
						<!-- 带图片的推荐博客列表 -->
						<div class="box-fr">
							<div class="box wrap justify blog-thumbs">
								<a class="thumb blog-thumb  mb" href="${pageContext.request.contextPath}/blogInfo" title="花十分钟给 JFinal 写了个 talent-aio 插件">
									<div class="figure">
										<img class="thumb-img" src="${pageContext.request.contextPath}/images/20154550_7JML.png">
										<div class="figcaption">
											<div class="thumb-txt fb">
												花十分钟给 JFinal 写了个 talent-aio 插件
											</div>
										</div>
									</div>
								</a>
								
								<a class="thumb blog-thumb  mb" href="${pageContext.request.contextPath}/blogInfo" title="长 URL 转短连接的简单设计与实现">
									<div class="figure">
										<img class="thumb-img" src="${pageContext.request.contextPath}/images/20154629_sNqh.png">
										<div class="figcaption">
											<div class="thumb-txt fb">
												长 URL 转短连接的简单设计与实现
											</div>
										</div>
									</div>
								</a>
								
								<a class="thumb blog-thumb  mb" href="${pageContext.request.contextPath}/blogInfo" title="Javascript 常用的设计模式详解">
									<div class="figure">
										<img class="thumb-img" src="${pageContext.request.contextPath}/images/20154718_MfPS.png">
										<div class="figcaption">
											<div class="thumb-txt fb">
												Javascript 常用的设计模式详解
											</div>
										</div>
									</div>
								</a>
								
								<a class="thumb blog-thumb  mb" href="${pageContext.request.contextPath}/blogInfo" title="CentOS 搭建 Postfix+Dovecot 简单邮件系统">
									<div class="figure">
										<img class="thumb-img" src="${pageContext.request.contextPath}/images/20154752_lKA8.png">
										<div class="figcaption">
											<div class="thumb-txt fb">
												CentOS 搭建 Postfix+Dovecot 简单邮件系统
											</div>
										</div>
									</div>
								</a>
								
								<a class="thumb blog-thumb  mb" href="${pageContext.request.contextPath}/blogInfo" title="Spring Boot HTTP over JSON 的错误码异常处理">
									<div class="figure">
										<img class="thumb-img" src="${pageContext.request.contextPath}/images/20154855_VMOE.png">
										<div class="figcaption">
											<div class="thumb-txt fb">
												Spring Boot HTTP over JSON 的错误码异常处理
											</div>
										</div>
									</div>
								</a>
								
								<a class="thumb blog-thumb  mb" href="${pageContext.request.contextPath}/blogInfo" title="MySql 之自动同步表结构">
									<div class="figure">
										<img class="thumb-img" src="${pageContext.request.contextPath}/images/20155012_n55S.png">
										<div class="figcaption">
											<div class="thumb-txt fb">
												MySql 之自动同步表结构
											</div>
										</div>
									</div>
								</a>
								
								<a class="thumb blog-thumb  mb" href="${pageContext.request.contextPath}/blogInfo" title="iOS 开发优秀博客和软件推荐">
									<div class="figure">
										<img class="thumb-img" src="${pageContext.request.contextPath}/images/20183706_lix3.png">
										<div class="figcaption">
											<div class="thumb-txt fb">
												iOS 开发优秀博客和软件推荐
											</div>
										</div>
									</div>
								</a>
								
								<a class="thumb blog-thumb  mb" href="${pageContext.request.contextPath}/blogInfo" title="Android 基础夯实：你了解 Handler 有多少？">
									<div class="figure">
										<img class="thumb-img" src="${pageContext.request.contextPath}/images/20173856_2WLu.png">
										<div class="figcaption">
											<div class="thumb-txt fb">
												Android 基础夯实：你了解 Handler 有多少？
											</div>
										</div>
									</div>
								</a>
							
							</div>
							
						</div>
					</div> <!-- end 推荐博客列表 -->
					
				
				</div>
				
				
			</div>
			
			<% //TODO %>
			<!-- 右侧 -->
			<div class="box-fr aside-container">
				<!-- 动弹 -->
				<div>
					<!-- 发动弹表单 -->
					<div id="tweet" class="tweet-form">
						<input type="hidden" value="">
						<div class="editor-wrapper">
							<div class="box effect">
								<textarea class="tweet-editor" placeholder="你今天动弹了吗？" bind></textarea>
								<button class="bn-tweet" type="button">动弹</button>
							</div>
							<div class="editor-tip"></div>
						</div>
					</div>
					
					<!-- 最新动弹列表 -->
					<div id="v_tweet_list">
						<div class="box justify aside-header">
							<div class="box">
								<h2 class="tweet-name cursor active">最新动弹</h2>
								<h2 class="tweet-name cursor">热门动弹</h2>
							</div>
							<a href="#" class="more" title="更多" id="tweetMore">更多</a>
						</div>
						<div id="tweetList">
        					<div class="box tweet" data-last="12619893">
            					<a class="box-fl" href="#" target="_blank" title="skyding1212">
                					<div>
                    					<img class="tweet-uimg" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
                					</div>
            					</a>
            					<div class="box-aw">
                					<p class="tweet-content wrap">
                						<span class="tweet-user">
                							<a href="#" target="_blank" title="skyding1212" style="color: #0B3566;">skyding1212</a>: </span>辱母杀人案：冷血的法律羞辱人民  光这名字就够震撼的 
                						<a href="#" class="project" target="_blank" title="企业信息化快速开发平台JeeSite">#JeeSite#
                						</a>
                			    	</p>
                					<div class="box vertical justify toolbox" style="font-size: 12px;color: #9B9B9B;">
                    					<span style="font-size: 12px;color: #9B9B9B;">3分钟前 <a class="commened" href="#" target="_blank" style="font-size: 12px;color: #9B9B9B;">(0评)</a>&nbsp;</span>
                   						<div class="box vertical cursor" data-count="0">
                        					<div class="favor-icon "></div>
                        					<div class="favor-count">0</div>
                    					</div>
                					</div>
            					</div>
        					</div>
						</div>
						
						<div id="tweetList">
        					<div class="box tweet" data-last="12619893">
            					<a class="box-fl" href="#" target="_blank" title="skyding1212">
                					<div>
                    					<img class="tweet-uimg" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
                					</div>
            					</a>
            					<div class="box-aw">
                					<p class="tweet-content wrap">
                						<span class="tweet-user">
                							<a href="#" target="_blank" title="skyding1212" style="color: #0B3566;">skyding1212</a>: </span>明明就是实验室 
                						<a href="#" class="project" target="_blank" title="企业信息化快速开发平台JeeSite">#JeeSite#
                						</a>
                			    	</p>
                					<div class="box vertical justify toolbox" style="font-size: 12px;color: #9B9B9B;">
                    					<span style="font-size: 12px;color: #9B9B9B;">3分钟前 <a class="commened" href="#" target="_blank" style="font-size: 12px;color: #9B9B9B;">(0评)</a>&nbsp;</span>
                   						<div class="box vertical cursor" data-count="0">
                        					<div class="favor-icon "></div>
                        					<div class="favor-count">0</div>
                    					</div>
                					</div>
            					</div>
        					</div>
						</div>
						<div id="tweetList">
        					<div class="box tweet" data-last="12619893">
            					<a class="box-fl" href="#" target="_blank" title="skyding1212">
                					<div>
                    					<img class="tweet-uimg" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
                					</div>
            					</a>
            					<div class="box-aw">
                					<p class="tweet-content wrap">
                						<span class="tweet-user">
                							<a href="#" target="_blank" title="skyding1212" style="color: #0B3566;">skyding1212</a>: </span>UI不行 
                						<a href="#" class="project" target="_blank" title="企业信息化快速开发平台JeeSite">#JeeSite#
                						</a>
                			    	</p>
                					<div class="box vertical justify toolbox" style="font-size: 12px;color: #9B9B9B;">
                    					<span style="font-size: 12px;color: #9B9B9B;">3分钟前 <a class="commened" href="#" target="_blank" style="font-size: 12px;color: #9B9B9B;">(0评)</a>&nbsp;</span>
                   						<div class="box vertical cursor" data-count="0">
                        					<div class="favor-icon "></div>
                        					<div class="favor-count">0</div>
                    					</div>
                					</div>
            					</div>
        					</div>
						</div>
						<div id="tweetList">
        					<div class="box tweet" data-last="12619893">
            					<a class="box-fl" href="#" target="_blank" title="skyding1212">
                					<div>
                    					<img class="tweet-uimg" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
                					</div>
            					</a>
            					<div class="box-aw">
                					<p class="tweet-content wrap">
                						<span class="tweet-user">
                							<a href="#" target="_blank" title="skyding1212" style="color: #0B3566;">skyding1212</a>: </span>动弹一下～～～ 
                						<a href="#" class="project" target="_blank" title="企业信息化快速开发平台JeeSite">#JeeSite#
                						</a>
                			    	</p>
                					<div class="box vertical justify toolbox" style="font-size: 12px;color: #9B9B9B;">
                    					<span style="font-size: 12px;color: #9B9B9B;">
                    					3分钟前 
                    					<a class="commened" href="#" target="_blank" style="font-size: 12px;color: #9B9B9B;">(0评)</a> 
                    					<a href="#" class="image-url"><img class="ssmicon" src="${pageContext.request.contextPath}/svg/tweet_img.svg" width="12px"></a>Android
                    					</span>
                   						<div class="box vertical cursor" data-count="0">
                        					<div class="favor-icon "></div>
                        					<div class="favor-count">0</div>
                    					</div>
                					</div>
            					</div>
        					</div>
						</div>
						<div id="tweetList">
        					<div class="box tweet" data-last="12619893">
            					<a class="box-fl" href="#" target="_blank" title="skyding1212">
                					<div>
                    					<img class="tweet-uimg" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
                					</div>
            					</a>
            					<div class="box-aw">
                					<p class="tweet-content wrap">
                						<span class="tweet-user">
                							<a href="#" target="_blank" title="skyding1212" style="color: #0B3566;">skyding1212</a>: </span>\(≧▽≦)/   
                						<a href="#" class="project" target="_blank" title="企业信息化快速开发平台JeeSite">#JeeSite#
                						</a>
                			    	</p>
                					<div class="box vertical justify toolbox" style="font-size: 12px;color: #9B9B9B;">
                    					<span style="font-size: 12px;color: #9B9B9B;">
                    					3分钟前 
                    					<a class="commened" href="#" target="_blank" style="font-size: 12px;color: #9B9B9B;">(0评)</a> 
                    					<a href="#" class="image-url"><img class="ssmicon" src="${pageContext.request.contextPath}/svg/tweet_img.svg" width="12px"></a>Android
                    					</span>
                   						<div class="box vertical cursor" data-count="0">
                        					<div class="favor-icon "></div>
                        					<div class="favor-count">0</div>
                    					</div>
                					</div>
            					</div>
        					</div>
						</div>
						<div id="tweetList">
        					<div class="box tweet" data-last="12619893">
            					<a class="box-fl" href="#" target="_blank" title="skyding1212">
                					<div>
                    					<img class="tweet-uimg" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
                					</div>
            					</a>
            					<div class="box-aw">
                					<p class="tweet-content wrap">
                						<span class="tweet-user">
                							<a href="#" target="_blank" title="skyding1212" style="color: #0B3566;">skyding1212</a>: </span>不会番墙，好不容易找到下载地址，共享http://www.cnplugins.com/devtool/octotree/ 
                						<a href="#" class="project" target="_blank" title="企业信息化快速开发平台JeeSite">#JeeSite#
                						</a>
                			    	</p>
                					<div class="box vertical justify toolbox" style="font-size: 12px;color: #9B9B9B;">
                    					<span style="font-size: 12px;color: #9B9B9B;">
                    					3分钟前 
                    					<a class="commened" href="#" target="_blank" style="font-size: 12px;color: #9B9B9B;">(0评)</a> 
                    					<a href="#" class="image-url"><img class="ssmicon" src="${pageContext.request.contextPath}/svg/tweet_img.svg" width="12px"></a>Android
                    					</span>
                   						<div class="box vertical cursor" data-count="0">
                        					<div class="favor-icon "></div>
                        					<div class="favor-count">0</div>
                    					</div>
                					</div>
            					</div>
        					</div>
						</div>
						<div id="tweetList">
        					<div class="box tweet" data-last="12619893">
            					<a class="box-fl" href="#" target="_blank" title="skyding1212">
                					<div>
                    					<img class="tweet-uimg" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
                					</div>
            					</a>
            					<div class="box-aw">
                					<p class="tweet-content wrap">
                						<span class="tweet-user">
                							<a href="#" target="_blank" title="skyding1212" style="color: #0B3566;">skyding1212</a>: </span>你只是看起来很努力，你所谓的稳定不过是浪费生命。
                						<a href="#" class="project" target="_blank" title="企业信息化快速开发平台JeeSite">#JeeSite#
                						</a>
                			    	</p>
                					<div class="box vertical justify toolbox" style="font-size: 12px;color: #9B9B9B;">
                    					<span style="font-size: 12px;color: #9B9B9B;">
                    					3分钟前 
                    					<a class="commened" href="#" target="_blank" style="font-size: 12px;color: #9B9B9B;">(0评)</a> 
                    					<a href="#" class="image-url"><img class="ssmicon" src="${pageContext.request.contextPath}/svg/tweet_img.svg" width="12px"></a>Android
                    					</span>
                   						<div class="box vertical cursor" data-count="0">
                        					<div class="favor-icon "></div>
                        					<div class="favor-count">0</div>
                    					</div>
                					</div>
            					</div>
        					</div>
						</div>
						<div id="tweetList">
        					<div class="box tweet" data-last="12619893">
            					<a class="box-fl" href="#" target="_blank" title="skyding1212">
                					<div>
                    					<img class="tweet-uimg" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
                					</div>
            					</a>
            					<div class="box-aw">
                					<p class="tweet-content wrap">
                						<span class="tweet-user">
                							<a href="#" target="_blank" title="skyding1212" style="color: #0B3566;">skyding1212</a>: </span>搬砖去 
                						<a href="#" class="project" target="_blank" title="企业信息化快速开发平台JeeSite">#JeeSite#
                						</a>
                			    	</p>
                					<div class="box vertical justify toolbox" style="font-size: 12px;color: #9B9B9B;">
                    					<span style="font-size: 12px;color: #9B9B9B;">
                    					3分钟前 
                    					<a class="commened" href="#" target="_blank" style="font-size: 12px;color: #9B9B9B;">(0评)</a> 
                    					<a href="#" class="image-url"><img class="ssmicon" src="${pageContext.request.contextPath}/svg/tweet_img.svg" width="12px"></a>Android
                    					</span>
                   						<div class="box vertical cursor" data-count="0">
                        					<div class="favor-icon "></div>
                        					<div class="favor-count">0</div>
                    					</div>
                					</div>
            					</div>
        					</div>
						</div>
						<div id="tweetList">
        					<div class="box tweet" data-last="12619893">
            					<a class="box-fl" href="#" target="_blank" title="skyding1212">
                					<div>
                    					<img class="tweet-uimg" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
                					</div>
            					</a>
            					<div class="box-aw">
                					<p class="tweet-content wrap">
                						<span class="tweet-user">
                							<a href="#" target="_blank" title="skyding1212" style="color: #0B3566;">skyding1212</a>: </span>如果你想要最小化地使用内存和并行开销，请选Serial GC；如果你想要最大化应用程序的吞吐量，请选Parallel GC；如果你想要最小化GC的中断或停顿时间，请选CMS GC。 
                						<a href="#" class="project" target="_blank" title="企业信息化快速开发平台JeeSite">#JeeSite#
                						</a>
                			    	</p>
                					<div class="box vertical justify toolbox" style="font-size: 12px;color: #9B9B9B;">
                    					<span style="font-size: 12px;color: #9B9B9B;">
                    					3分钟前 
                    					<a class="commened" href="#" target="_blank" style="font-size: 12px;color: #9B9B9B;">(0评)</a> 
                    					<a href="#" class="image-url"><img class="ssmicon" src="${pageContext.request.contextPath}/svg/tweet_img.svg" width="12px"></a>Android
                    					</span>
                   						<div class="box vertical cursor" data-count="0">
                        					<div class="favor-icon "></div>
                        					<div class="favor-count">0</div>
                    					</div>
                					</div>
            					</div>
        					</div>
						</div>
						<div id="tweetList">
        					<div class="box tweet" data-last="12619893">
            					<a class="box-fl" href="#" target="_blank" title="skyding1212">
                					<div>
                    					<img class="tweet-uimg" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
                					</div>
            					</a>
            					<div class="box-aw">
                					<p class="tweet-content wrap">
                						<span class="tweet-user">
                							<a href="#" target="_blank" title="skyding1212" style="color: #0B3566;">skyding1212</a>: </span>是适合睡觉的天气啊  
                						<a href="#" class="project" target="_blank" title="企业信息化快速开发平台JeeSite">#JeeSite#
                						</a>
                			    	</p>
                					<div class="box vertical justify toolbox" style="font-size: 12px;color: #9B9B9B;">
                    					<span style="font-size: 12px;color: #9B9B9B;">
                    					3分钟前 
                    					<a class="commened" href="#" target="_blank" style="font-size: 12px;color: #9B9B9B;">(0评)</a> 
                    					<a href="#" class="image-url"><img class="ssmicon" src="${pageContext.request.contextPath}/svg/tweet_img.svg" width="12px"></a>Android
                    					</span>
                   						<div class="box vertical cursor" data-count="0">
                        					<div class="favor-icon "></div>
                        					<div class="favor-count">0</div>
                    					</div>
                					</div>
            					</div>
        					</div>
						</div>
						<div id="tweetList">
        					<div class="box tweet" data-last="12619893">
            					<a class="box-fl" href="#" target="_blank" title="skyding1212">
                					<div>
                    					<img class="tweet-uimg" src="${pageContext.request.contextPath}/images/3291868_50.jpg">
                					</div>
            					</a>
            					<div class="box-aw">
                					<p class="tweet-content wrap">
                						<span class="tweet-user">
                							<a href="#" target="_blank" title="skyding1212" style="color: #0B3566;">skyding1212</a>: </span>外包公司，不能再加薪，又需要把人留下了，有什么好办法？ 
                						<a href="#" class="project" target="_blank" title="企业信息化快速开发平台JeeSite">#JeeSite#
                						</a>
                			    	</p>
                					<div class="box vertical justify toolbox" style="font-size: 12px;color: #9B9B9B;">
                    					<span style="font-size: 12px;color: #9B9B9B;">
                    					3分钟前 
                    					<a class="commened" href="#" target="_blank" style="font-size: 12px;color: #9B9B9B;">(0评)</a> 
                    					<a href="#" class="image-url"><img class="ssmicon" src="${pageContext.request.contextPath}/svg/tweet_img.svg" width="12px"></a>Android
                    					</span>
                   						<div class="box vertical cursor" data-count="0">
                        					<div class="favor-icon "></div>
                        					<div class="favor-count">0</div>
                    					</div>
                					</div>
            					</div>
        					</div>
						</div>
					</div>
					
				</div>
				
			</div>
		</div>
	</div>
	
	
</body>
</html>