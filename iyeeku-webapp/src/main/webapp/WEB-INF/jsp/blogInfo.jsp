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
  	body{
		background-color: #f5f5f5;
		font-family: "Pingfang SC", "STHeiti", "Lantinghei SC", "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei", "WenQuanYi Micro Hei", SimSun, sans-serif;
	}
	a,a:hover,a:visited,a:active,a:link{
		text-decoration: none;
	    color: #6a6a6a;
	}
	.autoCenter{
  		width:800px;
  		margin:auto;
	}
  	.nav{
  		padding:15px 0;
  	}
  	.vertical{
		display: flex;
	    -webkit-box-align: center;
	    -webkit-align-items: center;
	    -ms-grid-row-align: center;
	    -ms-flex-align: center;
	    align-items: center;
	}
  	.back-list{
	    text-align: left;
	    font-size: 14px;
	    margin-bottom: 15px;
  	}
  	.back-list a{
  		color: #4eaa4c;
  	}
  	.blog-content{
	    text-align: left;
	    position: relative;
	    margin: auto;
  	}
  	.blog-heading,.title{
  		font-size: 28px;
    	word-break: break-all;
  	}
  	.blog-heading .title span{
	    vertical-align: middle;
    	margin-bottom: 4px;
  	}
  	.status-tag {
	    border: 2px solid transparent;
	    border-radius: 50%;
	    width: 25px;
	    height: 25px;
	    vertical-align: text-bottom;
	    text-align: center;
	    font-size: 16px;
	    line-height: 26px;
	    float: left;
	    display: inline-block;
    	margin-right: 5px;
	}
  	.original {
	    border-color: #51BAE3;
	    color: #51BAE3;
	}
	.recommend {
	    border-color: #FB7081;
	    color: #FB7081;
	}
	.info-opr{
		font-size: 16px;
	    color: #666;
	    margin-top: 8px;
	    padding-bottom: 20px;
        position: relative;
	    border-bottom: 1px solid #ccc;
	}
	.layout-column{
        padding: 10px 0;
	}
	.user{
		float:left;
	    display: inline-block;
    }
	.user .name{
		color: #46B;
	    display: inline-block;
    	margin: 0 3px;
	}
	.data-info{
		float:left;
	}
	ul{
	    list-style-type: none;
	}
	lu,li{
	    margin: 0;
    	padding: 0;
	}
	.data-info li{
		margin: 0 8px;
		display: inline-block;
	}
	.link-blue{
		color: #46B!important;
	}
	.layout-right{
		position: absolute;
	    right: 0px;
	    top: 0px;
	}
	.favor-btn{    
		width: 67px;
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
	.reward{
		background:url(${pageContext.request.contextPath}/svg/icon-reward.svg) center no-repeat;
	}
	.share{
		background:url(${pageContext.request.contextPath}/svg/icon-share.svg) center no-repeat;
	}
	.thumbs{
		background:url(${pageContext.request.contextPath}/svg/icon-thumbs.svg) center no-repeat;
	}
	.start{
		background:url(${pageContext.request.contextPath}/svg/red-start.svg) center no-repeat;
	}
	.optionStyle{
		width: 25px;
    	height: 25px;
   	    margin-right: 5px;
	}
	.btn{
	    padding: .4rem .8rem;
	    outline: 0;
	    margin: 0;
	    display: inline-block;
	    cursor: pointer;
	}
	.message-content{
		height:500px;
		background:grey;
		margin-top:20px;
	}
	.blog-opr{
	    text-align: right;
	    border-bottom: 1px solid #ccc;
	    padding-bottom: 17px;
	    font-size: 16px;
	}
	.blog-copyright{
	    color: #999;
    	margin-top: 30px;
	}
	.related-info{
	    line-height: 3;
    	color: #666;
	}
	.related-info li{
		display: inline-block;
    	margin-right: 10px;
	}
	.operator-btn{
	    width: 140px;
	    height: 50px;
	    line-height: 50px;
	    font-size: 18px;
	    padding: 0;
	    display: block;
	}
	.operate{
	    text-align: center;
	    position: relative;
	    margin: 74px 0;
	}
	.operate li{
		display: inline-block;
    	margin-right: 25px;
	}
	.author-card{
	    background: #5B5C5F;
	    padding: 30px 0;
	    margin-bottom: 40px;
	    font-size: 16px;
	    color: #fff;
	    display: flex;
   	}
   	.author-img{
    	margin:auto;
   	}
   	.article_editor_head_img{
   		width: 76px;
  		height: 76px;
	    display: block;
	    border-radius: 50%;
	    overflow: hidden;
       border: 2px solid #ddd;
   	}
   	.btn-green{
   		background-color: #4eaa4c;
   	}
   	.btn-follow{
   		width: 100%;
	    text-align: center;
	    margin-top: 10px;
	    border-radius: 1px;
	    box-sizing: border-box;
   	}
   	.author-info{
   		float:left;
   		width: 85px;
	    margin-right: 30px;
	    display: inline-block;
   	}
   	.opus-info{
   		float:left;
   	}
   	.article_editor_name{
   		color: #40E23B!important;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    font-size: 22px;
	    display: block;
	    line-height: 40px;
	    padding: 0!important;
   	}
   	.card-post{
   		margin-right: 15px;
   	}
   	.card-post-info{
   		color: #fff;
	    font-size: 16px;
	    padding: 5px 0;
	    line-height: 2;
   	}
   	.icon-svg{
	    vertical-align: middle;
	    display: inline-block;
	    background-size: contain!important;
   	}
   	.icon-post-blog{
	   width: 9px;
	   height: 15px;
	    background: url(${pageContext.request.contextPath}/svg/icon-post-blog.svg) center no-repeat;
   	}
   	.icon-address-blog{    
   		width: 11px;
  		height: 15px;
   		background: url(${pageContext.request.contextPath}/svg/icon-address-blog.svg) center no-repeat;
   	}
   	.opus-opr{
   		line-height: 2;
   	}
   	.opus-opr-item{
   		display: inline-block;
  		color: #D7D7D7;
   	}
   	.opus-opr-item span{
	    color: #18ED6F;
   	}
   	.panel-heading,.blog-replay-title{
   		font-size: 1.8rem;
  		line-height: 2;
   	}
   	.related-blogs-list{
   		display: flex;
   	}
   	.related-blog-item{
   		width: 33.3%;
   		background: #fff;
	    border: 1px solid #ededed;
	    border-radius: 2px;
	    padding: 15px;
        height: 80px;
   		margin-right: 10px;
   	}
   	.related-blog-item-title .title{
 		    font-size: 16px;
   	}
   	.related-blog-item-title .related-blog-author-info{
   		font-size: 12px;
	    color: #666;
	    margin-top: 6px;
   	}
   	.related-blog-item-title .related-blog-author-info span{
   		width: 19px;
	    height: 19px;
	    border-radius: 50%;
	    display: inline-block;
	    overflow: hidden;
	    vertical-align: middle;
   	}
   	.data-item{
	    font-size: 12px;
  		color: #202020;
   	}
   	.reply{
	    margin-left: 10px;
   	}
   	.icon-reply{
   	    width: 15px;
  		height: 13px;
	    margin-right: 3px;
  		background: url(${pageContext.request.contextPath}/svg/icon-reply.svg) center no-repeat;
   	}
   	.icon-eye{
   	    width: 15px;
  		height: 13px;
	    margin-right: 3px;
  		background: url(${pageContext.request.contextPath}/svg/icon-eye.svg) center no-repeat;
   	}
   	.blog-replay{
   		margin-top:20px;
   	}
   	.panel-body{
	    background: #fff;
  		padding: 12px 20px 60px;
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
   	.blg_submit_btn{
   		color:#ffffff;
   		border-radius: 3px;
   	}
   	.text-muted{
   		color: #999;
	    font-size: 16px;
    	margin-right: 5px;
   	}
   	.opus-opr-item:not(:first-child):before{
	    content: " | ";
	    display: inline-block;
	    padding: 0 11px 0 7px;
   	}
  </style>
  <body>
     <%@ include file="nav.jspf" %>
     <div class="nav">
     	<div class="back-list autoCenter">
     		<a href="#">博客管理</a>&nbsp;&gt;&nbsp;<a href="#">IamOkay的博客</a>&nbsp;&gt;&nbsp;博客详情
     	</div>
     	<div class="blog-content autoCenter">
     		<div class="blog-heading">
     			<div class="title">
                    <span class="status-tag original" title="原创博客">原</span>                    
                    <span class="status-tag recommend" title="首页推荐过的博客">荐</span>
                    CentOS  搭建Postfix+Dovecot简单邮件系统
                </div>
                <div class="info-opr">
                	<div class="layout-column vertical">
	                	<div class="user">
	                		<a class="name" href="#">IamOkay</a>
	                	</div>
	                	<div class="data-info">
	                		<ul>
                                <li class="time">发表于 <span id="">3小时前</span></li>
                                <li class="read">阅读 <span id="read">74</span></li>
                                <li class="favor">收藏 <span id="">3</span></li>
                                <li class="vote">点赞 <span id="">0</span></li>
                                <li class="comment">
                                    <a href="#" class="link-blue">
                                        	评论 <span id="comment">0</span>
                                    </a>
                                </li>
                            </ul>
	                	</div>
	                </div>
	                <div class="layout-right">
	                	<a class="btn favor-btn" href="#">
	                		<i class="operator-icon start"></i>
	                		<span class="favor-label">收藏</span>
	                	</a>
	                </div>
                </div>
     		</div>
     		<div class="message-content">
     			
     		</div>
     		<div class="blog-opr">
                <!-- 版权 -->
                <div class="blog-copyright">
			        <span title="OSCHINA 博客文章版权属于作者，受法律保护。未经作者同意不得转载。">© 著作权归作者所有</span>
				</div>
                <!-- 分类、标签、字数 -->
                <div class="related-info">
                    <ul>
                         <li class="classify">分类：<span id="classify"><a href="#">Server&amp;Database</a></span></li>
	                     <li class="Words">字数：<span id="Words">1647</span></li>
	                 </ul>
                </div>
            </div>
            <div class="operate">
            	<ul>
            		<li>
            			<a class="operator-btn favor-btn" href="#">
	                		<i class="operator-icon reward optionStyle"></i>
	                		<span class="favor-label">打赏</span>
	                	</a>
	                </li>
            		<li>
            			<a class="operator-btn favor-btn" href="#">
	                		<i class="operator-icon thumbs optionStyle"></i>
	                		<span class="favor-label">点赞</span>
	                	</a>
	                </li>
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
     	<div class="author-card">
     		<div class="autoCenter">
     			<div class="author-info">
	     			<div class="author-img">
	     				<a href="#" class="article_editor_head_img">
	     					<img src="${pageContext.request.contextPath}/images/3291868_50.jpg" width="100%" height="100%" />
	     				</a>
	     			</div>
	     			<div class="follow-status">                                                        
						<span class="btn btn-green btn-follow">+ 关注</span>
	                </div>
                </div>
                <div class="opus-info">
                	<div class="opus-info-title">
                		<a href="#" class="article_editor_name">IamOkay</a>
                	</div>
                	<div class="card-post-info">
                    	<span class="card-post">
                        	<i class="icon-svg icon-post-blog"></i>
                        	程序员
                        </span>
                    	<span class="card-address">
                        	<i class="icon-svg icon-address-blog"></i>
                        	海淀
                    	</span>
            		</div>
            		<div class="opus-opr">
	                    <div class="opus-opr-item">粉丝 <span>143</span></div>
	                    <div class="opus-opr-item">博文 <span>380</span></div>
	                    <div class="opus-opr-item">码字总数 <span>274592 </span></div>
                    </div>
                </div>
     		</div>
     	</div>
     	<div class="autoCenter">
     		<div class="panel-heading">相关博客</div>
     		<div class="related-blogs-list">
     			<div class="related-blog-item">
     				<div class="related-blog-item-title">
     					<a href="#" class="title"target="_self">
                        	CentOS - 搭建yum源
                        </a>
                        <div class="related-blog-author-info">
                             <span class="icon">
                                 <img src="${pageContext.request.contextPath}/images/3291868_50.jpg"  width="100%" height="100%">
                             </span>
                             Sirv
                         </div>
                         <div style="text-align:right;">
                            <span class="view data-item"><i class="icon-svg icon-eye"></i>84</span>
                            <a class="reply data-item" href="#" target="_blank"><i class="icon-svg icon-reply"></i>0</a>
                        </div>
     				</div>
     			</div>
     			<div class="related-blog-item">
     				<div class="related-blog-item-title">
     					<a href="#" class="title"target="_self">
                        	CentOS - 搭建yum源
                        </a>
                        <div class="related-blog-author-info">
                             <span class="icon">
                                 <img src="${pageContext.request.contextPath}/images/3291868_50.jpg"  width="100%" height="100%">
                             </span>
                             Sirv
                         </div>
                         <div style="text-align:right;">
                            <span class="view data-item"><i class="icon-svg icon-eye"></i>84</span>
                            <a class="reply data-item" href="#" target="_blank"><i class="icon-svg icon-reply"></i>0</a>
                        </div>
     				</div>
     			</div>
     			<div class="related-blog-item">
     				<div class="related-blog-item-title">
     					<a href="#" class="title"target="_self">
                        	CentOS - 搭建yum源
                        </a>
                        <div class="related-blog-author-info">
                             <span class="icon">
                                 <img src="${pageContext.request.contextPath}/images/3291868_50.jpg"  width="100%" height="100%">
                             </span>
                             Sirv
                         </div>
                         <div style="text-align:right;">
                            <span class="view data-item"><i class="icon-svg icon-eye"></i>84</span>
                            <a class="reply data-item" href="#" target="_blank"><i class="icon-svg icon-reply"></i>0</a>
                        </div>
     				</div>
     			</div>
     		</div>
     	</div>
   		<div class="blog-replay autoCenter">
			<div class="blog-replay-title">
				评论(0)
			</div>
			<div class="panel-body">
				<div>
					<textarea name="content" class="" id="wmd-input"></textarea>
				</div>
				<div style="position: relative;">
					<div class="layout-right">
						<span class="text-muted">Ctrl+Enter</span>
						<button type="submit" class="btn btn-green blg_submit_btn">发表评论</button>
					</div>
				</div>
			</div>
		</div>
     </div>
  </body>
</html>
