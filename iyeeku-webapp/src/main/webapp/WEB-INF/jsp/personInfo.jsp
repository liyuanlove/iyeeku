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

<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" />
<!-- 
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
-->

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script>
	$(function() {
		$(".personInfo-content").html("<iframe frameborder='no' border='0' width='100%' height='100%' src='${pageContext.request.contextPath}/personInfoManager/modifyPersonInfo.jsp'/>");
	});
	
	function forward(url){
		var forward_url = "<iframe frameborder='no' border='0' width='100%' height='100%' src='${pageContext.request.contextPath}/personInfoManager/"+url+"'/>";
		$(".personInfo-content").html(forward_url);	
	}
	
</script>


<style>
	body{
		background-color: #fafafa;
		font-family: "Pingfang SC", "STHeiti", "Lantinghei SC", "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei", "WenQuanYi Micro Hei", SimSun, sans-serif;
	}
	@media screen and (max-width: 1200px) {
		.nav-personInfo{
			width:1200px;
		}
	}
	@media screen and (min-width: 1200px) {
		.nav-personInfo{
			width:1200px;
		}
	}
	.nav-personInfo{
		margin:auto;
		height: 780px;
		background-color:#ffffff;
	}
	.personInfo-menue{
		width:300px;
		height: 100%;
		border-right: 1px solid #e6e6e6;
		float:left;
	}
	.personInfo-menue{
		float:left;
		height: 100%;
	}
	.personInfo-menue a{
	    transition: color .3s;
	    text-decoration: none;
	    color: #333;
	    border: none;
	    outline: none;
	}
	.personInfo-content{
		height:100%;
		padding:0 30px 30px;
		width:900px;
		float:left;
	}
	.admin-menue{
	    padding:20px;
    	width: 300px;
	}
	.admin-menue ul, li,ol {
	    margin: 0;
	    padding: 0;
	    list-style-type: none;
	}
	.caption strong{
		font-size: 18px;
	    font-weight: 400;
	    line-height: 30px;
	    display: block;
	    color: #6a6a6a;
	    border-bottom: 1px solid #ddd;
	}
	.caption ol{
		font-size: 14px;
	    line-height: 1.8;
	    margin: 10px 0!important;
	}
	.caption ol li{
		padding-left: 15px;
	}
	.caption ol li a{
    	color: #888;
	}
	.foot{
		height:90px;
		clear:both;
	}
    </style>
</head>
<body>

      
      
 	<%@ include file="head.jsp" %>
    
    
<!--         <div style="height:50px;width: 100%;"></div> -->
<div style="width:100%;height: 100%;"> 
   <!--  <div class="container" style="position: relative;"> -->
    	<div class="nav-personInfo">
    	
    		<div class="personInfo-menue">
    			<div style="padding:20px;margin-buttom:20px;background-color:#e2dfda;">
    				<a href="#"><img src="${pageContext.request.contextPath}/images/myzone.jpg" style="border-radius: 50%;"/></a>
    				<a href="#" style="font-size: 24px;margin-left: 20px;">空间管理</a>
    			</div>
    			<div class="admin-menue">
    				<ul>
                        <li class="caption">
                            <strong>个人信息管理</strong>
                            <ol>
                                <li><a href="personalBox.jsp">我的私信</a></li>
                                <li><a href="personInfo.jsp">修改个人资料</a></li>
                               	<li><a href="#">修改登录密码</a></li>
                         		<li><a href="#">空间个性化设置</a></li>
                                <li><a href="#">个人隐私设置</a></li>
                                <li><a href="#">群动态设置</a></li>
                                <li><a href="#">邮件提醒设置</a></li>
		                        <li><a href="#">修改登录邮箱</a></li>
		                    	<li><a href="#">第三方账号绑定</a></li>
                                <li><a href="#">绑定手机</a></li>
                            </ol>
                        </li>
                    </ul>
    				<ul>
                        <li class="caption">
                            <strong>博客管理</strong>
                            <ol>
                                <li><a href="myblogs.jsp">博客管理</a></li>
                                <li><a href="postedit.jsp">发表博客</a></li>
                                <li><a href="#">草稿箱(0)</a></li>
                               	<li><a href="#">博客设置</a></li>
                         		<li><a href="#">博客评论管理</a></li>
                                <li><a href="#">博客导出</a></li>
                                <li><a href="#">博客导入</a></li>
                            </ol>
                        </li>
                    </ul>
    				<ul>
                        <li class="caption">
                            <strong>其他方面管理</strong>
                            <ol>
                                <li><a href="#">新闻投递</a></li>
                                <li><a href="#">发布开源软件</a></li>
                               	<li><a href="#">友情链接管理</a></li>
                            </ol>
                        </li>
                    </ul>
               	</div>
    		</div>
    		
    		<div class="personInfo-content">
    		</div>
    		
    		
    	</div>
    	
    	<div class="foot">
    	</div>
    	
    </div>
    
    
       
</body>
</html>