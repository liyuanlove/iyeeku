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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />

<style type="text/css">

	body{
		background-color: #fafafa;
		font-family: "Pingfang SC", "STHeiti", "Lantinghei SC", "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei", "WenQuanYi Micro Hei", SimSun, sans-serif;
	}
		
	a,a:hover,a:visited,a:active,a:link{
		text-decoration: none;
	    color: #6a6a6a;
	}
		
	@media screen and (max-width: 1200px) {
		.personInfo{
			width:100%;
		}
	}
	
	@media screen and (max-width: 900px) {
		.personInfo-content{
			width:100%;
		}
	}
	
	
	.personInfo-menue{
		/* width:300px; */
		height: 100%;
		border-right: 1px solid #e6e6e6;
		float:left;
	}
	
	.personInfo-menue a{
	    transition: color .3s;
	    text-decoration: none;
	    color: #333;
	    border: none;
	    outline: none;
	}
	
	.admin-menue{
	    padding:20px;
/*     	width: 300px; */
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
	.caption ol .active{
		color: #4eaa4c !important;
	}
	
	.personInfo-content{
		height:100%;
		width:900px;
		float:right;
	}
	
	.tabs{
		font-size: 18px;
		line-height: 2;
		padding-top: 30px;
		color: #6a6a6a;
		border-bottom: 1px solid #ddd;
	 }
	 .tabs span{
	    padding:0 15px;
    	display: inline-block;
    	cursor: pointer;
	 }
    
    .tabActivited{
    	border-bottom: 2px solid #4eaa4c;
    	color: #4eaa4c;
    }
	
</style>

	<script>
		$(function() {
			$(".tabs span").click(function(){
				$(".tabs span").removeClass("tabActivited");
				$(this).addClass("tabActivited");
 				$(".box-content").css("display","none");
				$($(".box-content")[$(this).index()]).css("display","block"); 
			});
		});
	</script>

</head>

<body>

	<%@ include file="nav.jspf" %>
    
    <!-- 内容区 -->
    <div class="container personInfo" style="width:100%;height: 100%;background-color: #ffffff;">
    	<div class="form-group" style="padding: 0px;">
    	
    		<div class="col-sm-3 personInfo-menue" style="padding: 0px;">
    				<div style="padding:20px;margin-buttom:20px;background-color:#e2dfda;">
    					<a href="#"><img src="${pageContext.request.contextPath}/images/myzone.jpg" style="border-radius: 50%;"/></a>
    					<a href="#" style="font-size: 24px;margin-left: 20px;">空间管理</a>
    				</div>
    				<div class="col-sm-12 admin-menue">
    					<ul>
                        	<li class="caption">
                            	<strong>个人信息管理</strong>
                            	<ol>
                                    <li><a class="active" href="${pageContext.request.contextPath}/personalBox">我的私信</a></li>
                                	<li><a href="${pageContext.request.contextPath}/modifyPersonInfo">修改个人资料</a></li>
                               		<li><a href="${pageContext.request.contextPath}/modifyEmailPwd">修改登录密码</a></li>
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
                            		<li><a href="${pageContext.request.contextPath}/myblogs">博客管理</a></li>
                                	<li><a href="${pageContext.request.contextPath}/postedit">发表博客</a></li>
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
    		
    		<div class="col-sm-9" style="height: 100%;padding-left: 48px;padding-right: 48px;">
    			<div class="form-group">
					<div class="tabs">
  						<span class="tabActivited">所有私信</span>
  						<span>用户私信</span>
  						<span>系统私信</span>
					</div>
				</div>
				
				<div class="form-group box-content" style="padding: 15px 20px 0px 20px;">
					<div class="form-group" style="margin:0px;border-bottom: 1px solid #ddd;padding-bottom:15px;">
						共有 1 个联系人
					</div>
					<div class="form-group" style=" margin:0px; border-bottom: 1px solid #ddd;padding: 10px 0px 10px 0px;">
						<table style="width: 100%;table-layout: fixed;">
							<tr>
								<td class="user" style="width: 60px;">
									<a href="#" style="margin-right: 10px;display: inline-block;overflow: hidden;width: 50px;height: 50px;vertical-align: middle;border-radius:50%;">
										<img alt="" src="${pageContext.request.contextPath}/images/myzone.jpg" style="width: 100%;height: 100%;border: none;">
									</a>
								</td>
								<td>
								<div class="msg" style="line-height: 2;word-break:break-word;">
									恭喜你成为本站用户
								</div>
								<div class="bottom">
									<span class="date" style="width: 200px;font-size: 12px;margin-bottom: 8px;">1分钟前</span>
									<span class="opts" style="float: right;color: #999;">
										<a href="#">回复</a>&nbsp;|&nbsp;
										<a href="#">共有4条私信</a>&nbsp;|&nbsp;
										<a href="#">删除</a>&nbsp;&nbsp;
									</span>
								</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="form-group" style=" margin:0px; border-bottom: 1px solid #ddd;padding: 10px 0px 10px 0px;">
						<table style="width: 100%;table-layout: fixed;">
							<tr>
								<td class="user" style="width: 60px;">
									<a href="#" style="margin-right: 10px;display: inline-block;overflow: hidden;width: 50px;height: 50px;vertical-align: middle;border-radius:50%;">
										<img alt="" src="${pageContext.request.contextPath}/images/myzone.jpg" style="width: 100%;height: 100%;border: none;">
									</a>
								</td>
								<td>
								<div class="msg" style="line-height: 2;word-break:break-word;">
									dasdasdasd	dasdasdasd	dasdasdasd	dasdasdasd	dasdasdasd	dasdasdasd	dasdasdasd	dasdasdasd	dasdasdasd
								</div>
								<div class="bottom">
									<span class="date" style="width: 200px;font-size: 12px;margin-bottom: 8px;">1分钟前</span>
									<span class="opts" style="float: right;color: #999;">
										<a href="#">回复</a>&nbsp;|&nbsp;
										<a href="#">共有4条私信</a>&nbsp;|&nbsp;
										<a href="#">删除</a>&nbsp;&nbsp;
									</span>
								</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="form-group" style=" margin:0px; border-bottom: 1px solid #ddd;padding: 10px 0px 10px 0px;">
						<table style="width: 100%;table-layout: fixed;">
							<tr>
								<td class="user" style="width: 60px;">
									<a href="#" style="margin-right: 10px;display: inline-block;overflow: hidden;width: 50px;height: 50px;vertical-align: middle;border-radius:50%;">
										<img alt="" src="${pageContext.request.contextPath}/images/myzone.jpg" style="width: 100%;height: 100%;border: none;">
									</a>
								</td>
								<td>
								<div class="msg" style="line-height: 2;word-break:break-word;">
									大肆夸奖道路喀什独家试爱的打算开发商垫付会计法看见了附机萨芬健康撒酒疯空间释放空间撒旦看风景撒酒疯看电视剧啊饭卡上饭卡受到激发啊
								</div>
								<div class="bottom">
									<span class="date" style="width: 200px;font-size: 12px;margin-bottom: 8px;">1分钟前</span>
									<span class="opts" style="float: right;color: #999;">
										<a href="#">回复</a>&nbsp;|&nbsp;
										<a href="#">共有4条私信</a>&nbsp;|&nbsp;
										<a href="#">删除</a>&nbsp;&nbsp;
									</span>
								</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="form-group" style=" margin:0px; border-bottom: 1px solid #ddd;padding: 10px 0px 10px 0px;">
						<table style="width: 100%;table-layout: fixed;">
							<tr>
								<td class="user" style="width: 60px;">
									<a href="#" style="margin-right: 10px;display: inline-block;overflow: hidden;width: 50px;height: 50px;vertical-align: middle;border-radius:50%;">
										<img alt="" src="${pageContext.request.contextPath}/images/myzone.jpg" style="width: 100%;height: 100%;border: none;">
									</a>
								</td>
								<td>
								<div class="msg" style="line-height: 2;word-break:break-word;">
									你好
								</div>
								<div class="bottom">
									<span class="date" style="width: 200px;font-size: 12px;margin-bottom: 8px;">1分钟前</span>
									<span class="opts" style="float: right;color: #999;">
										<a href="#">回复</a>&nbsp;|&nbsp;
										<a href="#">共有4条私信</a>&nbsp;|&nbsp;
										<a href="#">删除</a>&nbsp;&nbsp;
									</span>
								</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				
				
				<div class="form-group box-content" style="padding: 15px 20px 0px 20px; display: none;">
					<div class="form-group" style="margin:0px;border-bottom: 1px solid #ddd;padding-bottom:15px;">
						共有 1 个联系人
					</div>
					<div class="form-group" style=" margin:0px; border-bottom: 1px solid #ddd;padding: 10px 0px 10px 0px;">
						<table style="width: 100%;table-layout: fixed;">
							<tr>
								<td class="user" style="width: 60px;">
									<a href="#" style="margin-right: 10px;display: inline-block;overflow: hidden;width: 50px;height: 50px;vertical-align: middle;border-radius:50%;">
										<img alt="" src="${pageContext.request.contextPath}/images/myzone.jpg" style="width: 100%;height: 100%;border: none;">
									</a>
								</td>
								<td>
								<div class="msg" style="line-height: 2;word-break:break-word;">
									大肆夸奖道路喀什独家试爱的打算开发商垫付会计法看见了附机萨芬健康撒酒疯空间释放空间撒旦看风景撒酒疯看电视剧啊饭卡上饭卡受到激发啊
								</div>
								<div class="bottom">
									<span class="date" style="width: 200px;font-size: 12px;margin-bottom: 8px;">1分钟前</span>
									<span class="opts" style="float: right;color: #999;">
										<a href="#">回复</a>&nbsp;|&nbsp;
										<a href="#">共有4条私信</a>&nbsp;|&nbsp;
										<a href="#">删除</a>&nbsp;&nbsp;
									</span>
								</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="form-group" style=" margin:0px; border-bottom: 1px solid #ddd;padding: 10px 0px 10px 0px;">
						<table style="width: 100%;table-layout: fixed;">
							<tr>
								<td class="user" style="width: 60px;">
									<a href="#" style="margin-right: 10px;display: inline-block;overflow: hidden;width: 50px;height: 50px;vertical-align: middle;border-radius:50%;">
										<img alt="" src="${pageContext.request.contextPath}/images/myzone.jpg" style="width: 100%;height: 100%;border: none;">
									</a>
								</td>
								<td>
								<div class="msg" style="line-height: 2;word-break:break-word;">
									你好
								</div>
								<div class="bottom">
									<span class="date" style="width: 200px;font-size: 12px;margin-bottom: 8px;">1分钟前</span>
									<span class="opts" style="float: right;color: #999;">
										<a href="#">回复</a>&nbsp;|&nbsp;
										<a href="#">共有4条私信</a>&nbsp;|&nbsp;
										<a href="#">删除</a>&nbsp;&nbsp;
									</span>
								</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				
				
				<div class="form-group box-content" style="padding: 15px 20px 0px 20px;display: none;">
					<div class="form-group" style="margin:0px;border-bottom: 1px solid #ddd;padding-bottom:15px;">
						共有 1 个联系人
					</div>
					<div class="form-group" style=" margin:0px; border-bottom: 1px solid #ddd;padding: 10px 0px 10px 0px;">
						<table style="width: 100%;table-layout: fixed;">
							<tr>
								<td class="user" style="width: 60px;">
									<a href="#" style="margin-right: 10px;display: inline-block;overflow: hidden;width: 50px;height: 50px;vertical-align: middle;border-radius:50%;">
										<img alt="" src="${pageContext.request.contextPath}/images/myzone.jpg" style="width: 100%;height: 100%;border: none;">
									</a>
								</td>
								<td>
								<div class="msg" style="line-height: 2;word-break:break-word;">
									恭喜你成为本站用户
								</div>
								<div class="bottom">
									<span class="date" style="width: 200px;font-size: 12px;margin-bottom: 8px;">1分钟前</span>
									<span class="opts" style="float: right;color: #999;">
										<a href="#">回复</a>&nbsp;|&nbsp;
										<a href="#">共有4条私信</a>&nbsp;|&nbsp;
										<a href="#">删除</a>&nbsp;&nbsp;
									</span>
								</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				
    		</div>
    		
    		</div>
    		
    		
    </div>
    
    
       
</body>
</html>