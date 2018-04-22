<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<title>iyeeku - 艺博酷</title>

<%@ include file="header.jspf" %>

<style>
	body{
		background-color: #f5f5f5;
		font-family: "Pingfang SC", "STHeiti", "Lantinghei SC", "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei", "WenQuanYi Micro Hei", SimSun, sans-serif;
	}
	
	*{
		box-sizing: border-box;
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
		background:url(${pageContext.request.contextPath}/images/question_header.jpg);
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
		font-size: 2em;
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
	    color: #3db159!important;
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
	    /*box-shadow: inset 0 -1px 0 0 #ddd;*/
	    border-bottom:1px solid #ddd;
	}
	.tabs-menu .que-tab{
		font-size: 18px;
	    font-weight: 700;
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
	.que-sorts{
	    font-size: 14px;
	    height: 20px;
	    margin-top: 16px;
	    text-align: right;
	    color: #4a4a4a;
	}
	.que-sort{
		margin: 0 .5em;
    	color: #4a4a4a!important;
	}
	.sort-current{
		color:#49ab4f!important;
	}
	.ques{
		padding-top: 15px;
	}
	.que{
		display: flex;
		padding: 15px 0;
	}
	.l-count,.c-content,.r-author{
		float:left;
	}
	.l-count{
		width:176px;
	}
	.count-box{
		padding:0;
		margin:0;
	}
	.count-box li{    
		float: left;
	    display: list-item;
	    text-align: center;
	    list-style: none;
	    font-size: 16px;
	    overflow: hidden;
	    width: 55px;
	    height: 46px;
	    padding-top: 2px;
	    cursor: pointer;
	    color: #4a4a4a;
	}
	.count-box-browse{
        color: #898989!important;
	}
	.count-box li span{
	    font-size: 12px;
	    display: block;
	    padding-top: 2px;
	}
	.count-box-lighter{
		color: #41aa53!important;
	    border: 1px solid #60b25e;
	    background: #ebf5ed;
	    height: 46px;
	}
	
	.c-content{
		width:608px;
	}
	.c-content h4,.tag-title h4,.attention-title h4,.activited-member h4{
		font-size: 16px;
	    font-weight: 400;
	    line-height: 22px;
	    margin: 6px 0px;
	}
	.c-content h4{
	    margin: 0;
	}
	.c-content h4 a,.tag-title h4 a{
	    color:#ac0000;
	}
	.q-content{
		font-size: 14px;
	    line-height: 20px;
	    margin-top: 6px;
	    color: #4a4a4a;
	}
	.answer{
	    font-size: 12px;
	    margin-top: 6px;
	    color: #898989;
	}
	.r-author{
		width:56px;
		text-align: -webkit-right;
	}
	.author-img{
		display:block;
		width:40px;
		height:40px;
		border-radius: 50%;
		overflow: hidden;
	}
	.tooltipstered{
		line-height: 20px;
	    display: inline-block;
	}
	.tag{
	    font-size: 12px;
	    display: inline-block;
	    margin: 0 8px 8px 0;
	    padding: 2px 5px;
	    color: #3e6d8e!important;
	    background-color: #e4eff6;
	}
	.tags-list{
		padding: 10px 20px;
    	background-color: #fff;
	}
	.tag-items{
	    margin: 12px 0 0;
        margin-bottom: 30px;
	}
	.tag-items a{
		font-size: 12px;
	    display: inline-block;
	    margin: 0 8px 8px 0;
	    padding: 2px 5px;
	    color: #3e6d8e;
	    background-color: #e4eff6;
	}
	.tag_tip{
	    font-size: 14px;
    	color: #333;
	}
	.tag_tip a{
		color:#49ab4f;
	}
	.attention-tags{
	    margin-bottom: 30px;
	}
	.add-attention{
		margin: 17px 0 0;
		}
		.tagName{
			width: 158px;
			height: 33px;
			margin-right: 10px;
			border: 1px solid #ccc;
			border-radius: 2px;
		}
		.addTagBtn{
			font-size: 16px;
			line-height: 33px;
			display: inline-block;
			height: 33px;
			padding: 0 15px;
			color: #fff!important;
			border-radius: 2px;
			background: #62b460;
		}
		.members{
			display: table-cell;
		}
		.activited-member .author-img{
			float:left;
			margin: 6px 6px 0 0;
		}
    </style>
</head>
<body>

      
      
    <%@ include file="nav.jspf" %>
    
    
    <div style="width:100%;height: 100%;">
    	<div class="vertical question-head">
    		<div class="vertical head-content">
    			<div class="vertical header-left">
    				<div style="float:left">
	    				<a class="vertical question-link" href="${pageContext.request.contextPath}/question">
		    				<label class="lfont" style="cursor: pointer;">开源</label>
		    				<label class="rfont" style="cursor: pointer;">问答</label>
	    				</a>
    				</div>
    				<a class="quiz" href="${pageContext.request.contextPath}/ask">我要提问</a>
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
    			<div class="tabs-menu">
                    <a class="que-tab" href="${pageContext.request.contextPath}/question">技术问答</a>
                    <a class="que-tab" href="${pageContext.request.contextPath}/question2">技术分享</a>
                    <a class="que-tab" href="${pageContext.request.contextPath}/question3">IT大杂烩</a>
                    <a class="que-tab" href="${pageContext.request.contextPath}/question4">职业生涯</a>
                    <a class="que-tab tabActivited" href="${pageContext.request.contextPath}/question5">站务/建议</a>
    			</div>
    			<div class="que-sorts">
					<span>排列：</span>
					<a href="#" class="que-sort sort-current">活跃</a>
					<a href="#" class="que-sort">最新回答</a>
					<a href="#" class="que-sort">最新提问</a>
					<a href="#" class="que-sort">尚未回答</a>
					<a href="#" class="que-sort">热门</a>
    			</div>
    			<div class="ques">
    				<div class="que">
    					<div class="l-count">
    						<ul class="count-box">
    							<li>0<span>投票</span></li>
    							<li class="count-box-lighter">62<span>回答</span></li>
    							<li class="count-box-browse">3<span>浏览</span></li>
    						</ul>
    					</div>
    					<div class="c-content">
    						<div>
    							<h4><a href="${pageContext.request.contextPath}/answer">2017首届由Java黄埔军校发起的《我要做Java大牛》免费直播课特训营紧急集结中！</a></h4>
    						</div>
    						<div class="q-content">
                       			 我要华丽转身，我要大牛指导   活动时间：2017-3-10至 2017-3-17 活动地址：OSChina开源中国社区 活动简介：教你从web前端到后台...
    						</div>
    						<div class="answer">
    							<span class="last_answer">
	                                <a href="#">小悦悦</a>
							                                发布于 1天前
		                        </span>
		                        <div class="tooltipstered" >
                                    <a href="#" class="tag project">Sharding-JDBC</a>
                                </div>
    						</div>
    					</div>
    					<div class="r-author">
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    					</div>
    				</div>
    				<div class="que">
    					<div class="l-count">
    						<ul class="count-box">
    							<li>0<span>投票</span></li>
    							<li class="count-box-lighter">62<span>回答</span></li>
    							<li class="count-box-browse">3<span>浏览</span></li>
    						</ul>
    					</div>
    					<div class="c-content">
    						<div>
    							<h4><a href="${pageContext.request.contextPath}/answer">2017首届由Java黄埔军校发起的《我要做Java大牛》免费直播课特训营紧急集结中！</a></h4>
    						</div>
    						<div class="q-content">
                       			 我要华丽转身，我要大牛指导   活动时间：2017-3-10至 2017-3-17 活动地址：OSChina开源中国社区 活动简介：教你从web前端到后台...
    						</div>
    						<div class="answer">
    							<span class="last_answer">
	                                <a href="#">小悦悦</a>
							                                发布于 1天前
		                        </span>
		                        <div class="tooltipstered" >
                                    <a href="#" class="tag project">Sharding-JDBC</a>
                                </div>
    						</div>
    					</div>
    					<div class="r-author">
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    					</div>
    				</div>
    				<div class="que">
    					<div class="l-count">
    						<ul class="count-box">
    							<li>0<span>投票</span></li>
    							<li class="count-box-lighter">62<span>回答</span></li>
    							<li class="count-box-browse">3<span>浏览</span></li>
    						</ul>
    					</div>
    					<div class="c-content">
    						<div>
    							<h4><a href="${pageContext.request.contextPath}/answer">2017首届由Java黄埔军校发起的《我要做Java大牛》免费直播课特训营紧急集结中！</a></h4>
    						</div>
    						<div class="q-content">
                       			 我要华丽转身，我要大牛指导   活动时间：2017-3-10至 2017-3-17 活动地址：OSChina开源中国社区 活动简介：教你从web前端到后台...
    						</div>
    						<div class="answer">
    							<span class="last_answer">
	                                <a href="#">小悦悦</a>
							                                发布于 1天前
		                        </span>
		                        <div class="tooltipstered" >
                                    <a href="#" class="tag project">Sharding-JDBC</a>
                                </div>
    						</div>
    					</div>
    					<div class="r-author">
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    					</div>
    				</div>
    				<div class="que">
    					<div class="l-count">
    						<ul class="count-box">
    							<li>0<span>投票</span></li>
    							<li class="count-box-lighter">62<span>回答</span></li>
    							<li class="count-box-browse">3<span>浏览</span></li>
    						</ul>
    					</div>
    					<div class="c-content">
    						<div>
    							<h4><a href="${pageContext.request.contextPath}/answer">2017首届由Java黄埔军校发起的《我要做Java大牛》免费直播课特训营紧急集结中！</a></h4>
    						</div>
    						<div class="q-content">
                       			 我要华丽转身，我要大牛指导   活动时间：2017-3-10至 2017-3-17 活动地址：OSChina开源中国社区 活动简介：教你从web前端到后台...
    						</div>
    						<div class="answer">
    							<span class="last_answer">
	                                <a href="#">小悦悦</a>
							                                发布于 1天前
		                        </span>
		                        <div class="tooltipstered" >
                                    <a href="#" class="tag project">Sharding-JDBC</a>
                                </div>
    						</div>
    					</div>
    					<div class="r-author">
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    					</div>
    				</div>
    				<div class="que">
    					<div class="l-count">
    						<ul class="count-box">
    							<li>0<span>投票</span></li>
    							<li class="count-box-lighter">62<span>回答</span></li>
    							<li class="count-box-browse">3<span>浏览</span></li>
    						</ul>
    					</div>
    					<div class="c-content">
    						<div>
    							<h4><a href="${pageContext.request.contextPath}/answer">2017首届由Java黄埔军校发起的《我要做Java大牛》免费直播课特训营紧急集结中！</a></h4>
    						</div>
    						<div class="q-content">
                       			 我要华丽转身，我要大牛指导   活动时间：2017-3-10至 2017-3-17 活动地址：OSChina开源中国社区 活动简介：教你从web前端到后台...
    						</div>
    						<div class="answer">
    							<span class="last_answer">
	                                <a href="#">小悦悦</a>
							                                发布于 1天前
		                        </span>
		                        <div class="tooltipstered" >
                                    <a href="#" class="tag project">Sharding-JDBC</a>
                                </div>
    						</div>
    					</div>
    					<div class="r-author">
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    					</div>
    				</div>
    				<div class="que">
    					<div class="l-count">
    						<ul class="count-box">
    							<li>0<span>投票</span></li>
    							<li class="count-box-lighter">62<span>回答</span></li>
    							<li class="count-box-browse">3<span>浏览</span></li>
    						</ul>
    					</div>
    					<div class="c-content">
    						<div>
    							<h4><a href="${pageContext.request.contextPath}/answer">2017首届由Java黄埔军校发起的《我要做Java大牛》免费直播课特训营紧急集结中！</a></h4>
    						</div>
    						<div class="q-content">
                       			 我要华丽转身，我要大牛指导   活动时间：2017-3-10至 2017-3-17 活动地址：OSChina开源中国社区 活动简介：教你从web前端到后台...
    						</div>
    						<div class="answer">
    							<span class="last_answer">
	                                <a href="#">小悦悦</a>
							                                发布于 1天前
		                        </span>
		                        <div class="tooltipstered" >
                                    <a href="#" class="tag project">Sharding-JDBC</a>
                                </div>
    						</div>
    					</div>
    					<div class="r-author">
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    					</div>
    				</div>
    				<div class="que">
    					<div class="l-count">
    						<ul class="count-box">
    							<li>0<span>投票</span></li>
    							<li class="count-box-lighter">62<span>回答</span></li>
    							<li class="count-box-browse">3<span>浏览</span></li>
    						</ul>
    					</div>
    					<div class="c-content">
    						<div>
    							<h4><a href="${pageContext.request.contextPath}/answer">2017首届由Java黄埔军校发起的《我要做Java大牛》免费直播课特训营紧急集结中！</a></h4>
    						</div>
    						<div class="q-content">
                       			 我要华丽转身，我要大牛指导   活动时间：2017-3-10至 2017-3-17 活动地址：OSChina开源中国社区 活动简介：教你从web前端到后台...
    						</div>
    						<div class="answer">
    							<span class="last_answer">
	                                <a href="#">小悦悦</a>
							                                发布于 1天前
		                        </span>
		                        <div class="tooltipstered" >
                                    <a href="#" class="tag project">Sharding-JDBC</a>
                                </div>
    						</div>
    					</div>
    					<div class="r-author">
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    					</div>
    				</div>
    			</div>
    		</div>
    		<div class="other-content">
    			<div class="tags-list">
    				<div class="tag-title">
    					<h4><a href="#">所有标签&nbsp;»&nbsp;</a>热门标签</h4>
    				</div>
    				<div class="tag-items">
    					<div class="tooltipstered" >
                            <a href="#" class="tag project">Java(152)</a>
                        </div>
                        <div class="tooltipstered" >
                            <a href="#" class="tag project">PHP(70)</a>
                        </div>
                        <div class="tooltipstered" >
                            <a href="#" class="tag project">MySQL(66)</a>
                        </div>
                        <div class="tooltipstered" >
                            <a href="#" class="tag project">Python(59)</a>
                        </div>
                        <div class="tooltipstered" >
                            <a href="#" class="tag project">Eclipse(49)</a>
                        </div>
                        <div class="tooltipstered" >
                            <a href="#" class="tag project">Spring(46)</a>
                        </div>
                        <div class="tooltipstered" >
                            <a href="#" class="tag project">Android(40)</a>
                        </div>
                        <div class="tooltipstered" >
                            <a href="#" class="tag project">JFinal(39)</a>
                        </div>
                        <div class="tooltipstered" >
                            <a href="#" class="tag project">Tomcat(38)</a>
                        </div>
    				</div>
    				<div class="attention-tags">
    					<div class="attention-title">
    						<h4>关注标签</h4>
    					</div>
    					<div class="tag_tip">
						                您还没有关注任何标签!<br>
						                快去 <a href="/question/tags?catalog=1" class="tagList">标签列表</a> 挑选吧！
					    </div>
					    <div class="vertical add-attention">
					        <input value="" class="tagName">
					        <a href="#" class="addTagBtn">添加</a>
					    </div>
    				</div>
    				<div class="activited-member">
    					<h4>活跃会员(TOP&nbsp;40)</h4>
    					<div class="members">
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    						<a  class="author-img" href="#"><img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="40px" height="40px" /></a>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    	<div class="nav-foot">
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
			$(".que-tab").click(function(){
				$(".que-tab").removeClass("tabActivited");
				$(this).addClass("tabActivited");
			});
			$(".que-sort").click(function(){
				$(".que-sort").removeClass("sort-current");
				$(this).addClass("sort-current");
			});
		});
	</script>
</body>
</html>