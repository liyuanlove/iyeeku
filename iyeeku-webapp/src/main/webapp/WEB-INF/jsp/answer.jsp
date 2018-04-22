<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="baidu-site-verification" content="2EGsKUN13v" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<title>iyeeku - 艺博酷</title>

<%@ include file="header.jspf" %>

<style>

	*{
		box-sizing: border-box;
	}
	body{
		background-color: #f5f5f5;
		font-family: 'PingFang SC','Helvetica Neue','Microsoft YaHei UI','Microsoft YaHei','Noto Sans CJK SC',Sathu,EucrosiaUPC,sans-serif;
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
	.head-content,.nav-answer{
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
	.answer-left{
		float:left;
		width:900px;
	    padding: 20px 30px;
		background:#ffffff;
	}
	.answer-right{
		width: 270px;
    	margin: 0 0 0 30px;
		float:right;
	}
	.nav-foot{
		both:clear;
	}
	.que-title{
		padding: 0 0 15px;
		border-bottom:1px solid #c7c7c7;
	}
	.parent-link{
	    margin: 0 0 28px;
    }
    .parent-link,.parent-link a{
   	    font-size: 14px;
    	color: #4a4a4a!important;
    }
    .jump-answer{    
	    float: right;
	    display: list-item;
	    text-align: center;
	    list-style: none;
	    font-size: 16px;
        margin: -24px 0 0 10px;
	    overflow: hidden;
	    width: 55px;
	    cursor: pointer;
	    height: 46px;
	}
    .count-box-lighter{
		color: #41aa53!important;
	    border: 1px solid #60b25e;
	    background: #ebf5ed;
	    height: 46px;
	    padding-top: 2px;
	}
	.count-box-lighter span{
	    font-size: 12px;
	    display: block;
	    padding-top: 2px;
	}
	.question-title-content{
	    font-size: 20px;
	    line-height: 28px;
	    color: #111;
	}
	.text-jj{
		font-size: 14px!important;
	    font-weight: bolder!important;
	    color: #d65152!important;
	}
	.que-remark{
	    display: flex;
    }
    .que-collect{
    	float:left;
	    margin: 0 18px 0 0;
    }
    .que-detail{
    	float:right;
    }
    .vote-count-info{
   	    min-width: 44px;
	    padding: 5px 0;
	    text-align: center;
	    border: 1px solid #dfdfdf;
	    border-radius: 2px;
	    background: #f3f3f3;
    }
    .vote-up,.vote-down{
    	position: relative;
	    display: block;
	    height: 9px;
	    cursor: pointer;
    }
    .vote-count{
    	line-height: 22px;
	    display: block;
	    height: 22px;
        font-size: 16px;
    }
    .vote-up:after{
    	border-width: 0 8px 9px;
    	border-color: transparent transparent #aaa;
    }
    .vote-down:after{
	    border-width: 9px 8px 0;
	    border-color: #aaa transparent transparent;
    }
    .vote-ico:after{
	    position: absolute;
	    top: 0;
	    left: 50%;
	    width: 0;
	    height: 0;
	    content: '';
	    -webkit-transition: border-color .2s;
	    transition: border-color .2s;
	    -webkit-transform: translate3d(-50%,0,0);
	    transform: translate3d(-50%,0,0);
	    border-style: solid;
    }
    .collect-btn{
	    height: 26px;
	    padding: 24px 0 0;
	    cursor: pointer;
    	background:url(${pageContext.request.contextPath}/svg/icon-staroff.svg) top no-repeat;
    	font-size: 12px;
	    display: block;
	    margin: 10px 0 0;
	    text-align: center;
	    color: #898989;
    }
    .collect-btn:hover{
    	background:url(${pageContext.request.contextPath}/svg/icon-staron.svg) top no-repeat;
    }
    .que-detail{
    	width:100%;
    }
    .que-content{    
    	margin: 1em 0px 1em;
   	    padding: 0.5em;
	    display: block;
	    overflow-x: auto;
	    padding: 0.5em;
	    background: #3f3f3f;
	    color: #dcdcdc;
	    height:800px;
    }
    .share-iocn{
        padding-left: 17px;
    	background:url(${pageContext.request.contextPath}/images/icons_share.png) no-repeat;
    }
    .opt-left{
    	float:left;
    	display: flex;
    }
    .opt-right{
    	float:right;
    	text-align:right;
    }
    .opt{
   	    font-size: 14px;
	    line-height: 20px;
	    display: block;
	    height: 20px;
	    margin: 0 6px 0 0;
	    cursor: pointer;
	    color: #4668b8!important;
    }
    .left-item{
    	position: relative;
    	padding: 0 20px 0 0;
    }
    .left-item:after{
   	    position: absolute;
	    top: 10%;
	    right: 6px;
	    display: block;
	    width: 1px;
	    height: 80%;
	    content: '';
	    background: #bbb;
    }
    .icon-item-sina{
    	background-position: 0 -104px;
    }
    .icon-item-qq{
    	background-position: 1px -258px;
    }
    .user-info{
    	float:left;
   	    padding: 0 10px 0 0;
    }
    .que-info{
    	float:right;
    }
    .user-info .user-name{
   	    font-size: 14px;
	    display: block;
	    height: 20px;
	    margin: 2px 0 7px;
    	color: #111;
    }
    .user-info .que-info,.reply-time,.user-info .que-info a{
    	font-size: 12px;
	    height: 20px;
	    color: #898989!important;
    }
    .user-img{
    	display:flex;
    }
    .ahthor-img{
   	    font-size: 12px;
	    display: block;
	    overflow: hidden;
	    width: 50px;
	    min-width: 50px;
	    max-width: 50px;
	    height: 50px;
	    min-height: 50px;
	    margin: 0;
	    padding: 0;
	    border: none;
	    border-radius: 50%;
	    outline: 0;
    }
    .answer-count{
   	    font-size: 14px;
	    height: 32px;
	    margin: 20px 0 15px;
		border-bottom:1px solid #D8D8D8;
    }
    .count-info{
    	float:left;
    }
    .question_answer_count{
        font-size: 16px;
    	color: #111;
    }
    .last_answers{
        font-size: 14px;
    	color: #898989;
    }
    .sort-list{
    	float:right;
    }
    .sort-list a{
        font-size: 12px;
    	color: #111;
    }
    .current{
   	    color: #49AB4F!important;
    }
    .answer-content{
     	float:left;
    }
    .answer-content a{
   	    line-height: 16px;
	    position: relative;
	    display: block;
	    height: 16px;
	    padding: 0 11px 0 0;
	    cursor: pointer;
    }
    .answer-content .cursor:after{
   	    position: absolute;
	    top: 10%;
	    right: 5px;
	    display: block;
	    width: 1px;
	    height: 80%;
	    content: '';
	    background: #898989;
    }
    .other-opt{
    	display:flex;
    }
    .answer-content p{
    	font-size: 14px;
	    line-height: 22px;
	    color: #111;
    }
    .answer-edit{
    	margin: 40px 0;
    	height:200px;
    }
    .author-info{
   		padding: 21px 14px 14px;
	    margin: 20px 0 0;
	    background:#ffffff;
   	}
   	.answer-item{
   		width:100%;
   	}
   	.answer-list{
   		display: flex;
   	}
   	.left{
   		float:left;
   	}
   	.author-info-name{
   		padding: 0 0 0 10px;
   	}
   	.author-info-name{
   		font-size: 14px;
	    color: #4a4a4a;
   	}
   	.lineheight{
   		margin: 5px 0 0;
   	}
   	.other-ques{
   	    margin: 20px 0 0;
   		padding: 24px 20px 16px;
  		    background: #fff;
   	}
   	.other-ques-title{
   	    font-size: 16px;
	    height: 22px;
	    margin: 0 0 12px;
	    color: #111;
	    position: relative;
   	}
   	.other-ques-title a{
  		    font-size: 12px;
  			color: #49ab4f;
   	}
   	.other-ques-allCount{
  		    height: inherit;
	    position: absolute;
	    right: 0;
   	}
   	ul{
   		list-style: none;
   		padding:0;
   		margin:0;
   	}
   	ul .list-item{
  		    padding: 8px 0;
   	}
   	ul .que-item{
   		font-size: 14px;
	    line-height: 20px;
	    display: block;
	    margin: 0 0 6px;
	    color: #111;
   	}
   	ul .toolbar{
  		    font-size: 12px;
	    line-height: 16px;
	    color: #898989;
   	}
   	
   	.answer-editor{
		width: 100%;
    	height: 300px;
    	resize: none;
    	border: 1px solid #898989;
    	border-radius: 2px;
	}
	
	.answer-edit .toolbar {
    	margin: 15px 0 0 0;
    	height: 26px;
	}
	
	.box {
    	display: -webkit-box;
    	display: -webkit-flex;
    	display: -ms-flexbox;
    	display: flex;
	}
	
	.vertical {
    	-webkit-box-align: center;
    	-webkit-align-items: center;
    	-ms-grid-row-align: center;
    	-ms-flex-align: center;
    	align-items: center;
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
	
	.box-fr {
    	transition: width .2s;
    	-ms-flex-order: 3;
    	-webkit-order: 3;
    	-webkit-box-ordinal-group: 4;
    	order: 3;
	}
	
	.answer-edit .submit_button {
    	text-align: center;
    	font-size: 14px;
    	height: 26px;
    	background: #49AB4F;
    	color: #fff;
    	padding: 0 8px;
    	border-radius: 2px;
    	border: none;
    	outline: none;
    	cursor: pointer;
	}
	
	
	
    </style>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>

</head>

<body>

      
      <%@ include file="nav.jspf" %>
    
    
    <div style="width:100%;height: 100%;">
    	<div class="vertical question-head">
    		<div class="vertical head-content">
    			<div class="vertical header-left">
    				<div style="float:left">
	    				<a class="vertical question-link" href="#">
		    				<label class="lfont" style="cursor: pointer;">开源</label>
		    				<label class="rfont" style="cursor: pointer;">问答</label>
	    				</a>
    				</div>
    				<a class="quiz quiz-line" href="${pageContext.request.contextPath}/ask">我的发帖</a>
    				
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
    	<div class="nav-answer">
    		<div class="answer-left">
    			<div class="que-title">
    				<div class="vertical parent-link">
                		<a href="#">技术问答</a>&nbsp;&gt;&nbsp;
                	</div>
                	<a class="jump-answer"><div class="count-box-lighter">62<span>回答</span></div></a>
                	<div class="question-title-content">
			        	求助大神帮忙，找遍了方法都不明白。checkbox取值问题
                	</div>
   				</div>
   				
    			<div style="padding: 5px 0;">
    				<a class="text-jj">独家直播！大数据应用场景全解析>&nbsp;>&nbsp;>&nbsp;&nbsp;<img style="max-height: 32px; max-width: 32px;" src="${pageContext.request.contextPath}/images/hot3.png"></a>
    			</div>
    			<div class="que-remark">
    				<div class="que-collect">
    					<div class="vote-count-info">
	                        <a class="vote-ico vote-up" onclick="" title="顶">
	                        </a>
	                        <span class="vote-count">0</span>
	                        <a class="vote-ico vote-down" onclick="" title="踩">
	                        </a>
    					</div>
    					<a class="collect-btn">
    						<span class="collect-count">
    							收藏(0)
    						</span>
    					</a>
    				</div>
    				<div class="que-detail">
    					<div class="que-content">
    						
    					</div>
    					<p style="font-size:1.5em;">跪求哪位大神写下如何取值不，5555 实在技穷了</p>
    					<div class="user-operator">
    						<div class="opt-left">
    							<a class="opt left-item" href="#">举报</a>
    							<a class="opt right-item" href="#">分享</a>
    							<a class="opt share-iocn icon-item-sina" href="#"></a>
    							<a class="opt share-iocn icon-item-qq" href="#"></a>
    							<a class="opt other-item" href="#">补充话题</a>
    						</div>
    						<div class="opt-right">
    							<div class="user-info">
    								<a class="user-name">淡漠呐情</a>
    								<div class="que-info">
                                        <span class="pub_time">发帖于4小时前</span>
                                        <span class="answer_view_count">
                                            <a href="#" class="answer_count">1回</a>/<a class="view_count">14阅</a>
                                        </span>
    								</div>
    							</div>
    							<div class="user-img">
    								<a class="ahthor-img" href="#" target="_blank">
                                        <img src="${pageContext.request.contextPath}/images/3291868_50.jpg" alt="淡漠呐情" title="淡漠呐情" class="SmallPortrait">
                                    </a>
    							</div>
    						</div>
    					</div>
    				</div>
    				
    			</div>
    			<div class="answer-count">
   					<div class="count-info">
			            <span class="question_answer_count">共有<span id="question_comment_total_count">1</span>个答案</span>
			            <a class="last_answers" href="#">
							最后回答: 3小时前
			            </a>
   					</div>
   					<div class="sort-list">
			            <a href="#" class="answer_sort current">按票数排序</a>
				        <a href="#" class="answer_sort "> 显示最新答案</a>
   					</div>
   				</div>
   				<div class="answer-list">
   					<div class="answer-item">
   						<div class="que-collect">
	    					<div class="vote-count-info">
		                        <a class="vote-ico vote-up" onclick="" title="顶">
		                        </a>
		                        <span class="vote-count">0</span>
		                        <a class="vote-ico vote-down" onclick="" title="踩">
		                        </a>
	    					</div>
	    				</div>
	    				<div class="answer-content">
	    					<p>jquery: $("input[name='period']:checked").val();</p>
	    					<p>&nbsp;</p>
	    					<div class="other-opt">
            					<a class="answer_tool cursor">评论(0)</a>
                            	<a class="answer_tool cursor" href="#">引用此答案</a>
                                <a class="answer_report">举报</a>
	    					</div>
	    				</div>
   						<div class="opt-right">
   							<div class="user-info">
   								<a class="user-name current">淡漠呐情</a>
   								<div class="reply-time">
                                       4小时前
   								</div>
   							</div>
   							<div class="user-img">
   								<a class="ahthor-img" href="#" target="_blank">
                                       <img src="${pageContext.request.contextPath}/images/3291868_50.jpg" alt="淡漠呐情" title="淡漠呐情" class="SmallPortrait">
                                </a>
   							</div>
   						</div>
					</div>
   				</div>
   				
				<div class="answer-edit">
					<form id="form_answer" method="post" action="#">
						<div class="" style="height: 232px;">
							<textarea id="answerEditor" name="answerEditor" style="visibility:hidden;width:99.9%;display: none;" class="ckeditor">
							</textarea>
							<script type="text/javascript">
  								var editor=CKEDITOR.replace('answerEditor',{customConfig:"answerConfig.js"});
  							</script>
  						</div>
  						<div class="box vertical toolbar">
  							<div class="box-aw">
  								<span class="error_msg"></span>
  							</div>
  							<div class="box-fr">
  								<input type="button" class="submit_button" value="提交回答问题">
  							</div>
  						</div>
					</form>
				</div>
				
    		</div>
    		
    		
    		<div class="answer-right">
    			<div class="author-info vertical">
	    			<div class="author-img left">
						<a class="ahthor-img" href="#" target="_blank">
							<img src="${pageContext.request.contextPath}/images/3291868_50.jpg" alt="淡漠呐情" title="淡漠呐情" class="SmallPortrait">
						</a>
					</div>
					<div class="author-info-name">
						作者&nbsp;:&nbsp;<a class="author-name current">@淡漠呐情</a>
						<div class="reply-time lineheight">
					        	最近登录&nbsp;:&nbsp;4小时前
						</div>
					</div>
    			</div>
    			
    			<div class="other-ques">
    				<div class="other-ques-title vertical">
    					<div>淡漠呐情的其它问题</div>
    					<div class="vertical other-ques-allCount"><a class="current" href="#">全部(32)</a></div>
    				</div>
    				<ul>
		                <li class="list-item">
                            <a class="que-item" href="#" title="跪求哪位大神指导如何用FFmpeg实现视频合并">跪求哪位大神指导如何用FFmpeg实现视频合并</a>
					    <div class="toolbar">
					        (0回/4阅,3天前)
					    </div>
						</li>
		                <li class="list-item">
                            <a class="que-item" href="#" title="求教：从视频表video中查出所有的视频，然后将选中的视频合并成一个视频，并将这个视频的地址保存到另一张表fastied中的url字段">求教：从视频表video中查出所有的视频，然后将选中的视频合并成一个视频，并将这个视频的地址保存到另一张表fastied中的url字段</a>
						    <div class="toolbar">
						        (0回/6阅,4天前)
						    </div>
						</li>
		                <li class="list-item">
                            <a class="que-item " href="#" title="求解，培训后工作半年了，发现很严重的问题，请问各位前辈，如何能快速扎实基础呢！！！">求解，培训后工作半年了，发现很严重的问题，请问各位前辈，如何能快速扎实基础呢！！！</a>
						    <div class="toolbar">
						        (21回/3K+阅,2周前)
						    </div>
						</li>
		                <li class="list-item">
                            <a class="que-item " href="#" title="新人求帮忙，关于优化批量删除效率的问题">新人求帮忙，关于优化批量删除效率的问题</a>
						    <div class="toolbar">
						        (2回/65阅,1个月前)
						    </div>
						</li>
		                <li class="list-item">
                            <a class="que-item" href="#" title="checkbox批量删除问题，新人求助，请求大神进来解惑！！！">checkbox批量删除问题，新人求助，请求大神进来解惑！！！</a>
						    <div class="toolbar">
						        (1回/102阅,1个月前)
						    </div>
						</li>
		        	</ul>
    			</div>
    			
    			<div class="other-ques">
    				<div class="other-ques-title vertical">
    					<div>类似话题</div>
    				</div>
    				<ul>
                    	<li class="list-item">
						    <a class="que-item" href="#" title="如何改版checkbox选框大小">如何改版checkbox选框大小</a>
						    <div class="toolbar">(1回/1K+阅, 6年前)</div>
						</li>
                        <li class="list-item">
						    <a class="que-item" href="#" title="表单 多个checkbox 怎么回显？">表单 多个checkbox 怎么回显？</a>
						    <div class="toolbar">(2回/215阅, 12个月前)</div>
						</li>
                        <li class="list-item">
						    <a class="que-item" href="#" title="checkbox批量删除问题，新人求助，请求大神进来解惑！！！">checkbox批量删除问题，新人求助，请求大神进来解惑！！！</a>
						    <div class="toolbar">(1回/102阅, 1个月前)</div>
						</li>
                        <li class="list-item">
						    <a class="que-item" href="#" title="使用jquery操作checkbox的问题">使用jquery操作checkbox的问题</a>
						    <div class="toolbar">(1回/3K+阅, 5年前)</div>
						</li>
                        <li class="list-item">
						    <a class="que-item" href="#" title="js问题：按住shift键选中多个文件，而且不仅仅如此。">js问题：按住shift键选中多个文件，而且不仅仅如此。</a>
						    <div class="toolbar">(5回/1K+阅, 2年前)</div>
						</li>
                        <li class="list-item">
						    <a class="que-item" href="#" title="为什么jquery写的checkbox全选和全不选只有一次管用？">为什么jquery写的checkbox全选和全不选只有一次管用？</a>
						    <div class="toolbar">(3回/186阅, 7个月前)</div>
						</li>
                   	</ul>
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
			
		});
	</script>
</body>
</html>