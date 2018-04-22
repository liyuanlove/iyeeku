<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<meta name="description" content="">
	<meta name="author" content="">
	<title>iyeeku - 艺博酷</title>
	<%@ include file="header.jspf" %>
  </head>
  <style>
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
	.question-link label{
		cursor: pointer;
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
	.news-content{
		width:1200px;
		margin:auto;
		display: flex;
	    font: 400 16px/1.618 'PingFang SC','Helvetica Neue','Microsoft YaHei UI','Microsoft YaHei','Noto Sans CJK SC',Sathu,EucrosiaUPC,sans-serif;
	}
	.left-main-content{
    	width:840px;
	}
	.news-main-content{
    	background: #fff;
	    padding: 30px 30px 60px;
	}
	.news-main-content h1{
	    font-size: 28px;
	    font-weight: 400;
	    line-height: 1.75rem;
	    margin: 0;
	}
	.author-info{
	    padding: 15px 0 20px;
    	border-bottom: #dfdfdf 1px solid;
	}
	.author-info a{
		font-size: 14px;
	    display: inline-block;
	    vertical-align: middle;
	    color: #666;
	}
	.author-info img{
		overflow: hidden;
	    width: 24px;
	    height: 24px;
	    margin-right: 5px;
	    border-radius: 12px;
	}
	.green{
	    color: #3db158!important;
	}
	.author-name{
	    font-size: .875rem;
	}
	.author-name,.mr{
		margin-right: 15px;
	}
	.author-info span{
	    font-size: 14px;
	    display: inline-block;
	    vertical-align: middle;
	    color: #666;
	}
	.edit-content{
	    margin: 24px 0 0;
    	color: #333;
    	height: 500px;
    	background: grey;
	}
	.news-links{
	    margin-top: 30px;
    	color: #333;
	}
	.link-title {
	    font-size: 18px;
	}
	.link-list {
	    list-style: square inside;
	    color: #6c6c6c;
	}
	.link-list li {
	    margin-top: 5px;
	}
	.link-list a {
	    color: #4aab47!important;
	}
	.news-info {
	    font-size: 14px;
	    line-height: 26px;
	    position: relative;
	    margin-top: 60px;
	    padding-left: 15px;
	    color: #4a4a4a;
	}
	.news-info:before {
	    position: absolute;
	    top: 7px;
	    left: 0;
	    width: 3px;
	    height: 90px;
	    content: '';
	    background: #5eb55c;
	}
	.gray {
	    color: #898989;
	}
	.operate{
	    text-align: center;
	    position: relative;
        margin: 60px 0 0;
	}
	.operate li{
		display: inline-block;
    	margin-right: 25px;
	}
	.operator-btn{
	    width: 140px;
	    height: 50px;
	    line-height: 50px;
	    font-size: 18px;
	    padding: 0;
	    display: block;
	}
	.favor-btn{    
    	text-align: center;
		border: 1px solid #5B5C5F;
	    background: #fff;
	    border-radius: 0;
	    color: #5B5C5F;
	}
	.operator-icon{
	    width: 20px;
    	height: 20px;
		display: inline-block;
	    background-size: contain!important;
	    vertical-align: sub;
	}
	.start{
		background:url(${pageContext.request.contextPath}/svg/red-start.svg) center no-repeat;
	}
	.share{
		background:url(${pageContext.request.contextPath}/svg/icon-share.svg) center no-repeat;
	}
	.optionStyle{
		width: 25px;
    	height: 25px;
   	    margin-right: 5px;
	}
	.comp-comment{
		margin: 30px 0 0;
	    padding: 0 0 40px;
	    background: #fff;
	}
	.panel-heading {
	    -webkit-box-shadow: 0 1px 0 #efefef;
	    box-shadow: 0 1px 0 #efefef;
	}
	.count-of-comment {
	    font-size: 18px;
	    line-height: 44px;
	    width: 130px;
	    text-align: center;
	    color: #4a4a4a;
	    border-left: none;
	}
	.reply_count {
	    padding: 0 5px;
	}
	.comment-panel-wrapper {
	    margin: 30px 32px;
	}
   	.panel-body textarea{
   		resize: none;
	    outline: 0;
   	    width: 100%;
	    border-radius: 0;
       	margin-top: 10px;
	    margin-bottom: 10px;
	    height: 100px;
       	font-size: 1.4rem;
        padding: 5px 10px;
  		border: 1px solid #ddd;
   	}
   	.btn{
	    padding: .4rem .8rem;
	    outline: 0;
	    margin: 0;
	    display: inline-block;
	    cursor: pointer;
	}
	.btn-green{
   		background-color: #4eaa4c;
   	}
   	.blg_submit_btn{
   		color:#ffffff;
   		border-radius: 3px;
   	}
   	.text-muted{
 		color: #999;
	    font-size: 16px;
    	margin-right: 5px;
   	}
   	.layout-right{
    	text-align: right;
   	}
   	.panel-list{
   		margin: 10px 32px;
   	}
   	.panel-list hr{
   		height: 1px;
	    margin: 0 0 0 1em;
	    border: none;
	    background: #ddd;
   	}
   	.box-fl{
   		font-size: 14px;
    	color: #4a4a4a;
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
	.comment-item{
  		    padding: 18px 12px;
	    word-break: break-all;
	    word-break: break-word;
	    border-bottom: 1px solid #ddd;
        display: flex;
           position: relative;
   	}
   	.icon{
   		overflow: hidden;
	    width: 40px;
	    height: 40px;
	    display: block;
	    margin-right: 15px;
	    border-radius: 50%;
   	}
   	.comment-item-content{
   		text-align:left;
   	}
   	.user-name .user{
  		    -webkit-transition: color .3s;
	    transition: color .3s;
	    text-decoration: none;
	    color: #333;
	    border: none;
	    outline: 0;
   	}
   	.comment-item-time{
    	font-size: 12px;
	    line-height: 18px;
	    margin-top: 2px;
	    color: #898989;
   	}
   	.comment-item-detail{
   		font-size: 14px;
	    line-height: 22px;
	    word-wrap: break-word;
	    color: #4a4a4a;
   	}
   	.comment-perator{
  		    position: absolute;
  		    right:0;
  		    top:0;
   	}
   	.data-item{
        font-size: 12px;
	    font-style: normal;
	    min-width: 26px;
	    height: 17px;
	    color: #898989!important;    
	    margin-left: 3px;
   	}
   	.warning{
  		    margin-left: 10px;
   	}
   	.reply{
	    margin-left: 10px;
   	}
   	.icon-svg{
   	    width: 17px;
  		height: 17px;
	    vertical-align: middle;
	    display: inline-block;
	    background-size: contain!important;
   	}
   	.icon-thumb{
	    margin-right: 3px;
  		background: url(${pageContext.request.contextPath}/svg/icon-thumbs-grey.svg) center no-repeat;
   	}
   	.icon-reply{
	    margin-right: 3px;
  		background: url(${pageContext.request.contextPath}/svg/icon-reply.svg) center no-repeat;
   	}
   	.icon-warning{
	    margin-right: 3px;
  		background: url(${pageContext.request.contextPath}/svg/icon-warning-grey.svg) center no-repeat;
   	}
   	.icon-time{
	    margin-right: 3px;
  		background: url(${pageContext.request.contextPath}/svg/icon-time.svg) center no-repeat;
   	}
   	.no_more_data_flag{
   		text-align:center;
   		color: #666;	
   	}
  </style>
  <body>
     <%@ include file="nav.jspf" %>
     <div class="vertical question-head">
   		<div class="vertical head-content">
   			<div class="vertical header-left">
   				<div style="float:left">
    				<a class="vertical question-link" href="${pageContext.request.contextPath}/news">
	    				<label class="lfont">开源</label>
	    				<label class="rfont">资讯</label>
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
   	<div class="news-content">
   		<div class="left-main-content">
   			<div class="news-main-content">
   				<h1>Hibernate Validator 5.4.1.Final，Bean 验证框架</h1>
   				<div class="author-info">
   					<a href="#">
                        <img src="${pageContext.request.contextPath}/images/3291868_50.jpg"  width="24px" height="24px">
                    </a>
                    <a class="author-name green" href="#">
                    	局长
                    </a>
                    <span class="mr">发布于2017年03月25日</span>
                    <span class="mr">收藏 3</span>
                    <a href="#news_comments_wrapper" class="green comment">评论 3</a>
   				</div>
   				<div class="edit-content">
   				</div>
   				<div class="news-links">
		            <div class="link-title">相关链接</div>
		            <ul class="link-list">
		                <li>Hibernate Validator 的详细介绍：<a href="#" target="_blank">点击查看</a></li>
		                <li>Hibernate Validator 的下载地址：<a href="#" target="_blank">点击下载</a></li>
		            </ul>
		        </div>
		        <div class="news-info">
			        <div>本站文章除注明转载外，均为本站原创或编译。欢迎任何形式的转载，但请务必注明出处，尊重他人劳动共创开源社区。</div>
			        <div><span class="gray">转载请注明：</span>文章转载自 开源中国社区 <a href="#" class="green">[http://www.iyeeku.com]</a></div>
			        <div><span class="gray">本文标题：</span>Hibernate Validator 5.4.1.Final，Bean 验证框架</div>
			        <div>
			            <span class="gray">本文地址：</span><a href="#" class="green">${pageContext.request.contextPath}/newsInfo</a>
			        </div>
			    </div>
			    <div class="operate">
			    	<ul>
	            		<li>
	            			<a class="operator-btn favor-btn" href="#">
		                		<i class="operator-icon start optionStyle"></i>
		                		<span class="favor-label">收藏</span>
		                	</a>
		                </li>
	            		<li>
	            			<a class="operator-btn favor-btn" href="#">
		                		<i class="operator-icon share optionStyle"></i>
		                		<span class="favor-label">分享</span>
		                	</a>
		                </li>
	            	</ul>
			    </div>
   			</div>
   			
		    <div class="comp-comment">
		    	<div class="panel-heading" id="blog-comments-list">
			        <div class="count-of-comment">评论<span class="reply_count">(<span id="comp_totle_reply_count">3</span>)</span></div>
			    </div>
			    <div class="comment-panel-wrapper">
			    	<div class="panel-body">
						<div>
							<textarea name="content" class="" id="wmd-input"></textarea>
						</div>
						<div style="position: relative;">
							<div class="layout-right">
								<span class="text-muted">Ctrl/CMD+Enter</span>
								<button type="submit" class="btn btn-green blg_submit_btn">发表评论</button>
							</div>
						</div>
					</div>
			    </div>
			    <div class="panel-list">
			    	<div class="box vertical">
                        <span class="box-fl">最新评论</span>
                        <hr class="box-aw">
                    </div>
                    <div class="comment-item">
                    	<div class="comment-item-author">
                    		<a href="#" class="icon">
                    			<img src="${pageContext.request.contextPath}/images/3291868_50.jpg"  width="40px" height="40px">
                    		</a>
                    	</div>
                    	<div class="comment-item-content">
                   			<div class="user-name">
                                <a href="#" class="user">漆黑的烈焰使</a>
                            </div>
                            <div class="comment-item-time">今天 12:08</div>
                            <div class="comment-item-detail">有没有推荐比较好看的前端验证框架？  </div>
                    	</div>
                    	<div class="comment-perator">
                    		<a class="data-item thumb" href="#" target="_blank"><i class="icon-svg icon-thumb"></i>84</a>
                            <a class="data-item reply" href="#" target="_blank"><i class="icon-svg icon-reply"></i></a>
                            <a class="data-item warning" href="#" target="_blank"><i class="icon-svg icon-warning"></i></a>
                        </div>
                    </div>
                    <div class="comment-item">
                    	<div class="comment-item-author">
                    		<a href="#" class="icon">
                    			<img src="${pageContext.request.contextPath}/images/3291868_50.jpg"  width="40px" height="40px">
                    		</a>
                    	</div>
                    	<div class="comment-item-content">
                   			<div class="user-name">
                                <a href="#" class="user">漆黑的烈焰使</a>
                            </div>
                            <div class="comment-item-time">今天 12:08</div>
                            <div class="comment-item-detail">有没有推荐比较好看的前端验证框架？  </div>
                    	</div>
                    	<div class="comment-perator">
                    		<a class="data-item thumb" href="#" target="_blank"><i class="icon-svg icon-thumb"></i>84</a>
                            <a class="data-item reply" href="#" target="_blank"><i class="icon-svg icon-reply"></i></a>
                            <a class="data-item warning" href="#" target="_blank"><i class="icon-svg icon-warning"></i></a>
                        </div>
                    </div>
                    <div class="comment-item">
                    	<div class="comment-item-author">
                    		<a href="#" class="icon">
                    			<img src="${pageContext.request.contextPath}/images/3291868_50.jpg"  width="40px" height="40px">
                    		</a>
                    	</div>
                    	<div class="comment-item-content">
                   			<div class="user-name">
                                <a href="#" class="user">漆黑的烈焰使</a>
                            </div>
                            <div class="comment-item-time">今天 12:08</div>
                            <div class="comment-item-detail">有没有推荐比较好看的前端验证框架？  </div>
                    	</div>
                    	<div class="comment-perator">
                    		<a class="data-item thumb" href="#" target="_blank"><i class="icon-svg icon-thumb"></i>84</a>
                            <a class="data-item reply" href="#" target="_blank"><i class="icon-svg icon-reply"></i></a>
                            <a class="data-item warning" href="#" target="_blank"><i class="icon-svg icon-warning"></i></a>
                        </div>
                    </div>
                    <p class="no_more_data_flag" data-flag="true">没有更多评论</p>
			    </div>
		    </div>
		    <style>
		    	
		    </style>
   		</div>
   		<div class="right-other-content">
   			<div class="switch-title">
		        <div class="title">相关资讯</div>
		    </div>
		    <div class="news-list-simple">
		    	<div class="item">
	               <a href="#" class="item-title">nice Validator V1.0.10 发布，领先...</a>
	               <div class="info">
	                   <span class="data-item time"><i class="icon-svg icon-time"></i>22小时前</span>
	                   <a class="data-item reply" href="#" target="_blank"><i class="icon-svg icon-reply"></i>3</a>
	               </div>
	           </div>
	           <div class="item">
	               <a href="#" class="item-title">nice Validator V1.0.10 发布，领先...</a>
	               <div class="info">
	                   <span class="data-item time"><i class="icon-svg icon-time"></i>22小时前</span>
	                   <a class="data-item reply" href="#" target="_blank"><i class="icon-svg icon-reply"></i>3</a>
	               </div>
	           </div>
	           <div class="item">
	               <a href="#" class="item-title">nice Validator V1.0.10 发布，领先...</a>
	               <div class="info">
	                   <span class="data-item time"><i class="icon-svg icon-time"></i>22小时前</span>
	                   <a class="data-item reply" href="#" target="_blank"><i class="icon-svg icon-reply"></i>3</a>
	               </div>
	           </div>
	           <div class="item">
	               <a href="#" class="item-title">nice Validator V1.0.10 发布，领先...</a>
	               <div class="info">
	                   <span class="data-item time"><i class="icon-svg icon-time"></i>22小时前</span>
	                   <a class="data-item reply" href="#" target="_blank"><i class="icon-svg icon-reply"></i>3</a>
	               </div>
	           </div>
	           <div class="item">
	               <a href="#" class="item-title">nice Validator V1.0.10 发布，领先...</a>
	               <div class="info">
	                   <span class="data-item time"><i class="icon-svg icon-time"></i>22小时前</span>
	                   <a class="data-item reply" href="#" target="_blank"><i class="icon-svg icon-reply"></i>3</a>
	               </div>
	           </div>
           </div>
           <div class="switch-title">
		        <div class="title">最新资讯</div>
		    </div>
		    <div class="news-list-simple">
		    	<div class="item">
	               <a href="#" class="item-title">nice Validator V1.0.10 发布，领先...</a>
	               <div class="info">
	                   <span class="data-item time"><i class="icon-svg icon-time"></i>22小时前</span>
	                   <a class="data-item reply" href="#" target="_blank"><i class="icon-svg icon-reply"></i>3</a>
	               </div>
	           </div>
	           <div class="item">
	               <a href="#" class="item-title">nice Validator V1.0.10 发布，领先...</a>
	               <div class="info">
	                   <span class="data-item time"><i class="icon-svg icon-time"></i>22小时前</span>
	                   <a class="data-item reply" href="#" target="_blank"><i class="icon-svg icon-reply"></i>3</a>
	               </div>
	           </div>
	           <div class="item">
	               <a href="#" class="item-title">nice Validator V1.0.10 发布，领先...</a>
	               <div class="info">
	                   <span class="data-item time"><i class="icon-svg icon-time"></i>22小时前</span>
	                   <a class="data-item reply" href="#" target="_blank"><i class="icon-svg icon-reply"></i>3</a>
	               </div>
	           </div>
	           <div class="item">
	               <a href="#" class="item-title">nice Validator V1.0.10 发布，领先...</a>
	               <div class="info">
	                   <span class="data-item time"><i class="icon-svg icon-time"></i>22小时前</span>
	                   <a class="data-item reply" href="#" target="_blank"><i class="icon-svg icon-reply"></i>3</a>
	               </div>
	           </div>
	           <div class="item">
	               <a href="#" class="item-title">nice Validator V1.0.10 发布，领先...</a>
	               <div class="info">
	                   <span class="data-item time"><i class="icon-svg icon-time"></i>22小时前</span>
	                   <a class="data-item reply" href="#" target="_blank"><i class="icon-svg icon-reply"></i>3</a>
	               </div>
	           </div>
           </div>
           <div class="switch-title">
		        <div class="title">热门资讯</div>
		    </div>
		    <div class="news-list-simple">
		    	<div class="item">
	               <a href="#" class="item-title">nice Validator V1.0.10 发布，领先...</a>
	               <div class="info">
	                   <span class="data-item time"><i class="icon-svg icon-time"></i>22小时前</span>
	                   <a class="data-item reply" href="#" target="_blank"><i class="icon-svg icon-reply"></i>3</a>
	               </div>
	           </div>
	           <div class="item">
	               <a href="#" class="item-title">nice Validator V1.0.10 发布，领先...</a>
	               <div class="info">
	                   <span class="data-item time"><i class="icon-svg icon-time"></i>22小时前</span>
	                   <a class="data-item reply" href="#" target="_blank"><i class="icon-svg icon-reply"></i>3</a>
	               </div>
	           </div>
	           <div class="item">
	               <a href="#" class="item-title">nice Validator V1.0.10 发布，领先...</a>
	               <div class="info">
	                   <span class="data-item time"><i class="icon-svg icon-time"></i>22小时前</span>
	                   <a class="data-item reply" href="#" target="_blank"><i class="icon-svg icon-reply"></i>3</a>
	               </div>
	           </div>
	           <div class="item">
	               <a href="#" class="item-title">nice Validator V1.0.10 发布，领先...</a>
	               <div class="info">
	                   <span class="data-item time"><i class="icon-svg icon-time"></i>22小时前</span>
	                   <a class="data-item reply" href="#" target="_blank"><i class="icon-svg icon-reply"></i>3</a>
	               </div>
	           </div>
	           <div class="item">
	               <a href="#" class="item-title">nice Validator V1.0.10 发布，领先...</a>
	               <div class="info">
	                   <span class="data-item time"><i class="icon-svg icon-time"></i>22小时前</span>
	                   <a class="data-item reply" href="#" target="_blank"><i class="icon-svg icon-reply"></i>3</a>
	               </div>
	           </div>
           </div>
   		</div>
   		<style>
   			.right-other-content{
	   			width: 300px;
    			padding: 30px 0 30px 20px;
   			}
   			.switch-title{
   				padding: 8px 0;
   				border-bottom: #ddd 1px solid;
    			overflow: hidden;
   			}
   			.title {
			    font-size: 18px;
			    line-height: 24px;
			    float: left;
			    color: #333;
			}
			.item-title{
				font-size: 1.4rem;
    			color: #4a4a4a!important;
			}
			.item {
			    margin-top: 15px;
			}
			.item i{
		   	    width: 14px;
		  		height: 14px;
			}
			.news-list-simple{
			    margin-bottom: 20px;
			}
   		</style>
   	</div>
	<script>
		$(document).ready(function(){
			$(".search-text").focus(function(){
			    $(".search-border").css("border","1px solid #3db159");
			    $(".search-border").css("border-radius","1.5em");
			    $(".search-button").css("right","-1px");
			});
			$(".search-text").blur(function(){
			    $(".search-border").css("border","none");
			    $(".search-button").css("right","0px");
			});
		});
	</script>
  </body>
</html>
