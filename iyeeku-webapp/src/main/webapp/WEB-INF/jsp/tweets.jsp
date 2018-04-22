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
			background:url(${pageContext.request.contextPath}/images/tweet_header.jpg);
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
		    position: relative;
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
		.tweets-content{
			width:1200px;
			margin:auto;
		    padding: 33px 0 50px;
		}
		.tweets-content-left{
			padding: 0 24px 0 0;
			width:856px;
		    float: left;
		}
		.tweet-toolbox{
			position: relative;
		    padding: 7px 7px 7px 0;
		    border-bottom-right-radius: 3px;
		    border-bottom-left-radius: 3px;
		    background: #fcfcfc;    
		    border: solid 1px #ddd;
    		border-top: none;
		}
	   	.panel-body textarea{
	   		resize: none;
		    outline: 0;
	   	    width: 100%;
		    border-radius: 0;
	       	margin-top: 10px;
		    height: 100px;
	       	font-size: 1.4rem;
	        padding: 5px 10px;
	  		border: 1px solid #ddd;
	   	}
	   	.btn{
		    padding: .3rem 1.5rem;
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
   		    color: #fff;
    		background: #ffa300;
	   	}
	   	.text-muted{
		    font-size: 12px;
	   	}
	   	.text-muted{
		    color: #898989;
	   	}
	   	.layout-right{
	    	text-align: right;
	   	}
	   	.tweets-main-content{
   		    font-size: 14px;
		    height: 22px;
		    margin: 24px 0 0;
	   	}
	   	.tweetlist-title,.aside-title{
   		    font-size: 16px;
		    font-weight: 400;
		    margin: 0;
		    color: #111;
	   	}
	   	.tweetitem{
	   	    display: flex;
	   		margin: 10px 0;
		    padding: 20px 20px 14px;
		    border-radius: 3px;
		    background: #fff;
	   	}
	   	.tweetitem-author-img a{
   		    font-size: 12px;
		    line-height: 14px;
		    display: block;
		    overflow: hidden;
		    width: 40px;
		    min-width: 40px;
		    max-width: 40px;
		    height: 40px;
		    word-break: break-all;
		    color: #999;
		    border-radius: 50%;
		    background: rgba(0,0,0,.05);
	        margin: 0 25px 0 0;
	   	}
	   	.tweetitem-author-img img{
	   		width:40px;
	   		height:40px;
	   	}
	   	.ti-uname{
	   		font-weight: 500;
    		color: #111!important;
	   	}
	   	.publish-time{
	   		font-size: 12px;
		    line-height: 18px;
		    color: #898989;
	   	}
	   	.inner-content{
   		    line-height: 24px;    
   		    font-size: 14px;
    		vertical-align: top;
	   	}
	   	.single-wrapper{
   		    width: 160px;
    		height: 160px;
	   	}
	   	.img-wrapper{
    		position: relative;
		    overflow: hidden;
		    margin: 0 5px 5px 0;
		    background: #f9f9f9;
	   	}
	   	.single-wrapper img {
		    top: 50%;
		    left: 50%;
		    -webkit-transform: translate(-50%,-50%);
		    -ms-transform: translate(-50%,-50%);
		    transform: translate(-50%,-50%);
		}
		.ti-toolbox {
		    font-size: 12px;
		    line-height: 18px;
		    margin: 11px 0 0;
		    color: #898989;
		}
		.tiicon {
		    margin: 0 16px 0 0;
		    cursor: pointer;
		}
		.icon-svg {
		    vertical-align: middle;
		    display: inline-block;
		    
		    background-size: contain!important;
		}
		.icon-thumb {   
		    width: 15px;
		    height: 14px; 
			margin: -2px 5px 0 0;
		    background: url(${pageContext.request.contextPath}/svg/icon-thumbs-grey.svg) center no-repeat;
		}
		.icon-share{
		    width: 15px;
		    height: 12px;
			margin: 0 5px 0 0;
		    background: url(${pageContext.request.contextPath}/svg/ic-share.svg) center no-repeat;
		}
		.icon-reply{
		    width: 15px;
		    height: 12px;
			margin: 0 5px 0 0;
		    background: url(${pageContext.request.contextPath}/svg/icon-reply.svg) center no-repeat;
		}
		.tweets-content-right{
			width:344px;
			float:right;
		}
		.hot-container {
		    margin: 27px 0;
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
	    				<label class="rfont">动弹</label>
    				</a>
   				</div>
   			</div>
   			<div class="vertical question-search">
   				<div class="search-border" style="">
    				<input type="text" class="search-text" placeholder="在 43368 款开源软件中搜索" name="searchContent" />
    				<button type="submit" class="search-button"></button>
   				</div>
   			</div>
   		</div>
   	</div>
   	<div class="tweets-content">
   		<div class="tweets-content-left">
   			<div class="comment-panel-wrapper">
   				<div class="panel-body">
					<div>
						<textarea name="content" placeholder="今天你动弹了吗？" class="" id="wmd-input"></textarea>
					</div>
					<div class="tweet-toolbox">
						<div class="layout-right">
							<span class="text-muted"><span class="str-length">0</span>/160</span>
							<button type="submit" class="btn btn-green blg_submit_btn">发布</button>
						</div>
					</div>
				</div>
   			</div>
   			
	   		<div class="tweets-main-content">
	   			<h4 class="tweetlist-title">大家在动弹什么？</h4>
	   			<div class="tweets-items">
	   				<div class="tweetitem">
	   					<div class="tweetitem-author-img">
	   						<a href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg"/></a>
	   					</div>
	   					<div class="tweetitem-content">
	   						<div class="box vertical tweetitem-author-info">
                				<a class="ti-uname" href="#" title="丁银晨" target="_blank">丁银晨&nbsp;&nbsp;</a>
                				<span class="publish-time" style="padding: 0 10px 0 0;">8分钟前</span>
               				</div>
   							<div class="inner-content wrap" style="overflow: hidden; display: block; opacity: 1;" data-emoji-render="true">真诚的找创业技术合伙人人，有项目，有市场……社交app，有兴趣的来</div>
							<div class="vertical ti-toolbox">
								<span class="vertical tiicon">
									<i class="icon-svg icon-thumb"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-share"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-reply"></i><span>0</span>
								</span>
								<span class="box vertical tiicon" title="查看详情">
					                <a href="${pageContext.request.contextPath}/tweetInfo" target="_blank" style="color: #898989;">查看详情</a>
					            </span>
							</div>
	   					</div>
	   				</div>
	   				<div class="tweetitem">
	   					<div class="tweetitem-author-img">
	   						<a href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg"/></a>
	   					</div>
	   					<div class="tweetitem-content">
	   						<div class="box vertical tweetitem-author-info">
                				<a class="ti-uname" href="#" title="丁银晨" target="_blank">丁银晨&nbsp;&nbsp;</a>
                				<span class="publish-time" style="padding: 0 10px 0 0;">8分钟前</span>
               				</div>
   							<div class="inner-content wrap" style="overflow: hidden; display: block; opacity: 1;" data-emoji-render="true">不会涉黄吧[撇嘴]</div>
   							<div class="tiimg-wrapper" style="margin: 5px 0 0;">
								<div class="box wrap multimgs" style="max-width: 320px;">
									<div class="img-wrapper single-wrapper">
	                            		<a href="#" target="_blank">
	                            			<img src="${pageContext.request.contextPath}/images/102308_pJVG_3400926(V).jpg" style="max-width: 260px; height: auto;position: absolute;">
	                            		</a>
									</div>
								</div>
							</div>
							<div class="vertical ti-toolbox">
								<span class="vertical tiicon">
									<i class="icon-svg icon-thumb"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-share"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-reply"></i><span>0</span>
								</span>
								<span class="box vertical tiicon" title="查看详情">
					                <a href="${pageContext.request.contextPath}/tweetInfo" target="_blank" style="color: #898989;">查看详情</a>
					            </span>
							</div>
	   					</div>
	   				</div>
	   				<div class="tweetitem">
	   					<div class="tweetitem-author-img">
	   						<a href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg"/></a>
	   					</div>
	   					<div class="tweetitem-content">
	   						<div class="box vertical tweetitem-author-info">
                				<a class="ti-uname" href="#" title="丁银晨" target="_blank">丁银晨&nbsp;&nbsp;</a>
                				<span class="publish-time" style="padding: 0 10px 0 0;">8分钟前</span>
               				</div>
   							<div class="inner-content wrap" style="overflow: hidden; display: block; opacity: 1;" data-emoji-render="true">思考~~~</div>
   							<div class="tiimg-wrapper" style="margin: 5px 0 0;">
								<div class="box wrap multimgs" style="max-width: 320px;">
									<div class="img-wrapper single-wrapper">
	                            		<a href="#" target="_blank">
	                            			<img src="${pageContext.request.contextPath}/images/144202_K7wt_2246563(V).jpg" style="max-width: 260px; height: auto;position: absolute;">
	                            		</a>
									</div>
								</div>
							</div>
							<div class="vertical ti-toolbox">
								<span class="vertical tiicon">
									<i class="icon-svg icon-thumb"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-share"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-reply"></i><span>0</span>
								</span>
								<span class="box vertical tiicon" title="查看详情">
					                <a href="${pageContext.request.contextPath}/tweetInfo" target="_blank" style="color: #898989;">查看详情</a>
					            </span>
							</div>
	   					</div>
	   				</div>
	   				<div class="tweetitem">
	   					<div class="tweetitem-author-img">
	   						<a href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg"/></a>
	   					</div>
	   					<div class="tweetitem-content">
	   						<div class="box vertical tweetitem-author-info">
                				<a class="ti-uname" href="#" title="丁银晨" target="_blank">丁银晨&nbsp;&nbsp;</a>
                				<span class="publish-time" style="padding: 0 10px 0 0;">8分钟前</span>
               				</div>
   							<div class="inner-content wrap" style="overflow: hidden; display: block; opacity: 1;" data-emoji-render="true">在美国待了十年，我已经很清楚，这种事情在美国是很难实现的。美国根本不是一个尊重事实和人才的国度，从来都不是，换了总统也不会是。这个虚伪而邪恶的国家，正在继续走向昏庸和毁灭。这一切，我已经看得很透了。</div>
							<div class="vertical ti-toolbox">
								<span class="vertical tiicon">
									<i class="icon-svg icon-thumb"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-share"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-reply"></i><span>0</span>
								</span>
								<span class="box vertical tiicon" title="查看详情">
					                <a href="${pageContext.request.contextPath}/tweetInfo" target="_blank" style="color: #898989;">查看详情</a>
					            </span>
							</div>
	   					</div>
	   				</div>
	   				<div class="tweetitem">
	   					<div class="tweetitem-author-img">
	   						<a href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg"/></a>
	   					</div>
	   					<div class="tweetitem-content">
	   						<div class="box vertical tweetitem-author-info">
                				<a class="ti-uname" href="#" title="丁银晨" target="_blank">丁银晨&nbsp;&nbsp;</a>
                				<span class="publish-time" style="padding: 0 10px 0 0;">8分钟前</span>
               				</div>
   							<div class="inner-content wrap" style="overflow: hidden; display: block; opacity: 1;" data-emoji-render="true">生动形象</div>
   							<div class="tiimg-wrapper" style="margin: 5px 0 0;">
								<div class="box wrap multimgs" style="max-width: 320px;">
									<div class="img-wrapper single-wrapper">
	                            		<a href="#" target="_blank">
	                            			<img src="${pageContext.request.contextPath}/images/145335_JsMk_102072(V).png" style="max-width: 260px; height: auto;position: absolute;">
	                            		</a>
									</div>
								</div>
							</div>
							<div class="vertical ti-toolbox">
								<span class="vertical tiicon">
									<i class="icon-svg icon-thumb"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-share"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-reply"></i><span>0</span>
								</span>
								<span class="box vertical tiicon" title="查看详情">
					                <a href="${pageContext.request.contextPath}/tweetInfo" target="_blank" style="color: #898989;">查看详情</a>
					            </span>
							</div>
	   					</div>
	   				</div>
	   				<div class="tweetitem">
	   					<div class="tweetitem-author-img">
	   						<a href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg"/></a>
	   					</div>
	   					<div class="tweetitem-content">
	   						<div class="box vertical tweetitem-author-info">
                				<a class="ti-uname" href="#" title="丁银晨" target="_blank">丁银晨&nbsp;&nbsp;</a>
                				<span class="publish-time" style="padding: 0 10px 0 0;">8分钟前</span>
               				</div>
   							<div class="inner-content wrap" style="overflow: hidden; display: block; opacity: 1;" data-emoji-render="true">Why cats are so weird</div>
   							<div class="tiimg-wrapper" style="margin: 5px 0 0;">
								<div class="box wrap multimgs" style="max-width: 320px;">
									<div class="img-wrapper single-wrapper">
	                            		<a href="#" target="_blank">
	                            			<img src="${pageContext.request.contextPath}/images/134214_86mk_660691(V).png" style="max-width: 260px; height: auto;position: absolute;">
	                            		</a>
									</div>
								</div>
							</div>
							<div class="vertical ti-toolbox">
								<span class="vertical tiicon">
									<i class="icon-svg icon-thumb"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-share"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-reply"></i><span>0</span>
								</span>
								<span class="box vertical tiicon" title="查看详情">
					                <a href="${pageContext.request.contextPath}/tweetInfo" target="_blank" style="color: #898989;">查看详情</a>
					            </span>
							</div>
	   					</div>
	   				</div>
	   				<div class="tweetitem">
	   					<div class="tweetitem-author-img">
	   						<a href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg"/></a>
	   					</div>
	   					<div class="tweetitem-content">
	   						<div class="box vertical tweetitem-author-info">
                				<a class="ti-uname" href="#" title="丁银晨" target="_blank">丁银晨&nbsp;&nbsp;</a>
                				<span class="publish-time" style="padding: 0 10px 0 0;">8分钟前</span>
               				</div>
   							<div class="inner-content wrap" style="overflow: hidden; display: block; opacity: 1;" data-emoji-render="true">听说今晚20：30有JAVA直播公开课 课题：手写SpringMVC 入伙暗号 http://t.cn/R61VtWf</div>
   							<div class="tiimg-wrapper" style="margin: 5px 0 0;">
								<div class="box wrap multimgs" style="max-width: 320px;">
									<div class="img-wrapper single-wrapper">
	                            		<a href="#" target="_blank">
	                            			<img src="${pageContext.request.contextPath}/images/151430_U16m_3381647(V).png" style="max-height: 260px; height: auto;position: absolute;">
	                            		</a>
									</div>
								</div>
							</div>
							<div class="vertical ti-toolbox">
								<span class="vertical tiicon">
									<i class="icon-svg icon-thumb"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-share"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-reply"></i><span>0</span>
								</span>
								<span class="box vertical tiicon" title="查看详情">
					                <a href="${pageContext.request.contextPath}/tweetInfo" target="_blank" style="color: #898989;">查看详情</a>
					            </span>
							</div>
	   					</div>
	   				</div>
	   			</div>
			</div>
   		</div>
   		<div class="tweets-content-right">
   			<div class="hot-container">
   				<h4 class="aside-title">热门动弹</h4>
   				<div class="tweets-items">
	   				<div class="tweetitem">
	   					<div class="tweetitem-author-img">
	   						<a href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg"/></a>
	   					</div>
	   					<div class="tweetitem-content">
	   						<div class="box vertical tweetitem-author-info">
                				<a class="ti-uname" href="#" title="丁银晨" target="_blank">丁银晨&nbsp;&nbsp;</a>
                				<span class="publish-time" style="padding: 0 10px 0 0;">8分钟前</span>
               				</div>
   							<div class="inner-content wrap" style="overflow: hidden; display: block; opacity: 1;" data-emoji-render="true">什么鬼天气，裙子穿的冷死，只好换上牛仔裤了 😂</div>
   							<div class="tiimg-wrapper" style="margin: 5px 0 0;">
								<div class="box wrap multimgs" style="max-width: 320px;">
									<div class="img-wrapper single-wrapper">
	                            		<a href="#" target="_blank">
	                            			<img src="${pageContext.request.contextPath}/images/194959_Cg5M_219208(V).jpg" style="max-width: 260px; height: auto;position: absolute;">
	                            		</a>
									</div>
								</div>
							</div>
							<div class="vertical ti-toolbox">
								<span class="vertical tiicon">
									<i class="icon-svg icon-thumb"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-share"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-reply"></i><span>0</span>
								</span>
								<span class="box vertical tiicon" title="查看详情">
					                <a href="${pageContext.request.contextPath}/tweetInfo" target="_blank" style="color: #898989;">查看详情</a>
					            </span>
							</div>
	   					</div>
	   				</div>
	   				<div class="tweetitem">
	   					<div class="tweetitem-author-img">
	   						<a href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg"/></a>
	   					</div>
	   					<div class="tweetitem-content">
	   						<div class="box vertical tweetitem-author-info">
                				<a class="ti-uname" href="#" title="丁银晨" target="_blank">丁银晨&nbsp;&nbsp;</a>
                				<span class="publish-time" style="padding: 0 10px 0 0;">8分钟前</span>
               				</div>
   							<div class="inner-content wrap" style="overflow: hidden; display: block; opacity: 1;" data-emoji-render="true">静夜思131313</div>
   							<div class="tiimg-wrapper" style="margin: 5px 0 0;">
								<div class="box wrap multimgs" style="max-width: 320px;">
									<div class="img-wrapper single-wrapper">
	                            		<a href="#" target="_blank">
	                            			<img src="${pageContext.request.contextPath}/images/213304_z3Bp_229201(V).jpg" style="max-width: 260px; height: auto;position: absolute;">
	                            		</a>
									</div>
								</div>
							</div>
							<div class="vertical ti-toolbox">
								<span class="vertical tiicon">
									<i class="icon-svg icon-thumb"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-share"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-reply"></i><span>0</span>
								</span>
								<span class="box vertical tiicon" title="查看详情">
					                <a href="${pageContext.request.contextPath}/tweetInfo" target="_blank" style="color: #898989;">查看详情</a>
					            </span>
							</div>
	   					</div>
	   				</div>
	   				<div class="tweetitem">
	   					<div class="tweetitem-author-img">
	   						<a href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg"/></a>
	   					</div>
	   					<div class="tweetitem-content">
	   						<div class="box vertical tweetitem-author-info">
                				<a class="ti-uname" href="#" title="丁银晨" target="_blank">丁银晨&nbsp;&nbsp;</a>
                				<span class="publish-time" style="padding: 0 10px 0 0;">8分钟前</span>
               				</div>
   							<div class="inner-content wrap" style="overflow: hidden; display: block; opacity: 1;" data-emoji-render="true">今天非要让我送她回家,兄弟们怎么办?</div>
   							<div class="tiimg-wrapper" style="margin: 5px 0 0;">
								<div class="box wrap multimgs" style="max-width: 320px;">
									<div class="img-wrapper single-wrapper">
	                            		<a href="#" target="_blank">
	                            			<img src="${pageContext.request.contextPath}/images/161251_BUFN_3402159(V).jpg" style="max-width: 260px; height: auto;position: absolute;">
	                            		</a>
									</div>
								</div>
							</div>
							<div class="vertical ti-toolbox">
								<span class="vertical tiicon">
									<i class="icon-svg icon-thumb"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-share"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-reply"></i><span>0</span>
								</span>
								<span class="box vertical tiicon" title="查看详情">
					                <a href="${pageContext.request.contextPath}/tweetInfo" target="_blank" style="color: #898989;">查看详情</a>
					            </span>
							</div>
	   					</div>
	   				</div>
	   				<div class="tweetitem">
	   					<div class="tweetitem-author-img">
	   						<a href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg"/></a>
	   					</div>
	   					<div class="tweetitem-content">
	   						<div class="box vertical tweetitem-author-info">
                				<a class="ti-uname" href="#" title="丁银晨" target="_blank">丁银晨&nbsp;&nbsp;</a>
                				<span class="publish-time" style="padding: 0 10px 0 0;">8分钟前</span>
               				</div>
   							<div class="inner-content wrap" style="overflow: hidden; display: block; opacity: 1;" data-emoji-render="true">在美国待了十年，我已经很清楚，这种事情在美国是很难实现的。美国根本不是一个尊重事实和人才的国度，从来都不是，换了总统也不会是。这个虚伪而邪恶的国家，正在继续走向昏庸和毁灭。这一切，我已经看得很透了。</div>
							<div class="vertical ti-toolbox">
								<span class="vertical tiicon">
									<i class="icon-svg icon-thumb"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-share"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-reply"></i><span>0</span>
								</span>
								<span class="box vertical tiicon" title="查看详情">
					                <a href="${pageContext.request.contextPath}/tweetInfo" target="_blank" style="color: #898989;">查看详情</a>
					            </span>
							</div>
	   					</div>
	   				</div>
	   				<div class="tweetitem">
	   					<div class="tweetitem-author-img">
	   						<a href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg"/></a>
	   					</div>
	   					<div class="tweetitem-content">
	   						<div class="box vertical tweetitem-author-info">
                				<a class="ti-uname" href="#" title="丁银晨" target="_blank">丁银晨&nbsp;&nbsp;</a>
                				<span class="publish-time" style="padding: 0 10px 0 0;">8分钟前</span>
               				</div>
   							<div class="inner-content wrap" style="overflow: hidden; display: block; opacity: 1;" data-emoji-render="true">家中有个椰子狂！</div>
   							<div class="tiimg-wrapper" style="margin: 5px 0 0;">
								<div class="box wrap multimgs" style="max-width: 320px;">
									<div class="img-wrapper single-wrapper">
	                            		<a href="#" target="_blank">
	                            			<img src="${pageContext.request.contextPath}/images/011702_AmkK_2921900_thumb.png" style="max-width: 260px; height: auto;position: absolute;">
	                            		</a>
									</div>
								</div>
							</div>
							<div class="vertical ti-toolbox">
								<span class="vertical tiicon">
									<i class="icon-svg icon-thumb"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-share"></i><span>0</span>
								</span>
								<span class="vertical tiicon">
									<i class="icon-svg icon-reply"></i><span>0</span>
								</span>
								<span class="box vertical tiicon" title="查看详情">
					                <a href="${pageContext.request.contextPath}/tweetInfo" target="_blank" style="color: #898989;">查看详情</a>
					            </span>
							</div>
	   					</div>
	   				</div>
	   			</div>
   			</div>
   		</div>
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
