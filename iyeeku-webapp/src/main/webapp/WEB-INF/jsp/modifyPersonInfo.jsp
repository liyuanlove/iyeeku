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
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script>
	$(function() {
		$(".tabs span").click(function(){
			$(".tabs span").removeClass("tabActivited");
			$(this).addClass("tabActivited");
			$(".tabContent").css("display","none");
			$($(".tabContent")[$(this).index()]).css("display","block");
		});
	})
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
	.caption ol .active{
		color: #4eaa4c !important;
	}
	.foot{
		height:90px;
		clear:both;
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
    table{
   	    font-size: 14px;
   	    padding:25px 15px 15px;
   	    color: #333;
    }
    table th{
    	font-weight: 400;
	    min-width: 110px;
	    padding-right: 10px;
	    text-align: right;
    }
    table td{    
    	padding: 5px 8px;
    }
    a{
   		text-decoration: none;
	    border: none;
	    outline: none;
	    color: #4eaa4c;
    }
    .baseInfo select{
   	    line-height: 30px;
	    height: 30px;
	    padding: 5px;
	    border: 1px solid #ddd;
	    border-radius: 2px;
	    background: #fff;
    }
    .baseInfo textarea,.contcatInfo input{
   	    padding: 5px 10px;
	    border: 1px solid #ddd;
	    border-radius: 3px;
		resize: none;
    }
    .inputButton{
   	    font-size: 14px;
	    line-height: 1.6;
	    padding: 3px 8px !important;
	    cursor: pointer;
	    color: #fff;
	    border: 1px solid transparent;
	    border-radius: 2px;
	    outline: none;
    }
    .saveButton{
	    background: #4eaa4c;
    }
    .resetButton{
        color: #666;
	    border-color: #eee;
	    background: #fff;
    }
    .contcatInfo{
    	display:none;
    }
    .tabActivited{
    	border-bottom: 2px solid #4eaa4c;
    	color: #4eaa4c;
    }
    </style>
</head>
<body>

 	<%@ include file="nav.jspf" %>   
    
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
                                <li><a href="${pageContext.request.contextPath}/personalBox">我的私信</a></li>
                                <li><a class="active" href="${pageContext.request.contextPath}/modifyPersonInfo">修改个人资料</a></li>
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
    		
    		<div class="personInfo-content">
    			<div class="tabs">
    				<span class="tabActivited">会员基本资料</span>
    				<span>联系信息</span>
    			</div>
		    	<div class="baseInfo tabContent">
		    		<form>
			    		<table>
							<tbody>
							<tr>
								<th>登录帐号</th>		
								<td>
									496154750@qq.com
									<a href="#">更改邮箱地址</a>
								</td>
							</tr>
							<tr>
								<th>昵称</th>		
								<td>
									<input type="text" name="name" size="20" maxlength="16" class="TEXT" value="Y_Kvboo">
									<span class="Info" id="name_msg">至少2个字符，至多20个</span>
								</td>
							</tr>
							<tr>
						    	<th>性别</th>		
								<td>
									<input disabled="disabled" type="radio" value="1" checked="checked">男
									<input disabled="disabled" type="radio" value="2">女
									<span class="Info">不允许修改性别</span>
								</td>	
						    </tr>
							<tr>
						    	<th>出生年月</th>		
								<td>
									<select name="y"><option value="0">--</option></select> 年
						            <select name="m"><option value="0">--</option></select> 月
						            <select name="d"><option value="0">--</option></select> 日
								</td>
						    </tr>
							<tr>
								<th>居住地区</th>		
								<td>
									<select onchange="showcity(this.value, document.getElementById('userCity'));" name="province" id="userProvince">
									<option value="" selected="selected">--请选择省份--</option>
									</select>
									<select name="city" id="userCity"><option value="" selected="selected"></option></select>
								</td>
							</tr>
							<tr>
								<th>个性签名<br>不超过100字</th>		
								<td><textarea name="signature" style="width:300px;height:100px;" class="TEXT"></textarea></td>    		
							</tr>
							<tr>
								<th></th>		
								<td><input type="checkbox" name="weekly_report" value="1" checked="checked"> 邮件订阅每周精粹 </td>    		
							</tr>
							<tr>
								<th></th>		
								<td><input type="checkbox" name="notify" value="1" checked="checked"> 有回复或者关注软件的新闻发布时邮件提醒我 </td>    		
							</tr>
							<tr><th colspan="2"></th></tr>
							<tr class="submit">
								<th></th>
								<td><input type="submit" value="保存修改" class="inputButton saveButton"></td>
							</tr> 
						</tbody>
					</table>
				</form>
		    	</div>
		    	<div class="contcatInfo tabContent">
		    		<table>
						<tbody>
							<tr>
								<th>联系电话</th>		
								<td><input type="text" name="tel" size="20" value="13297051950" class="TEXT">&nbsp;&nbsp;
									<input type="checkbox" name="open_tel" value="1"> 对外公开
								</td>    		
							</tr>
							<tr>
								<th>邮箱地址</th>
								<td>
									<input type="text" id="f_email" name="email" value="32F4C1D7EBA2B14865BEC6C26E3D5DA0" size="40" class="TEXT">&nbsp;&nbsp;
									<input type="checkbox" name="open_email" value="1"> 对外公开
									<a href="#" >使用跟帐号相同Email地址</a>
								</td>		
							</tr>
							<tr>
								<th>MSN</th>		
								<td><input type="text" id="f_msn" name="msn" size="40" class="TEXT" value=""></td>    		
							</tr>
							<tr>
								<th>QQ</th>		
								<td><input type="text" name="qq" size="20" class="TEXT" value=""></td>    		
							</tr>
							<tr>
								<th>我的其它网站</th>
								<td><input type="text" name="website" size="40" class="TEXT" value=""></td>    		
							</tr>
							<tr><th colspan="2"></th>
							</tr>
							<tr class="submit">
								<th></th>	
								<td>
								<input type="submit" value="保存修改" class="inputButton saveButton">
								<input type="reset" value="重置" class="inputButton resetButton" style="margin-left: 10px;">
								</td>
							</tr>
						</tbody>
					</table>
		    	</div>
    		</div>
    		
    		
    	</div>
    	
    	<div class="foot">
    	</div>
    	
    </div>
    
    
       
</body>
</html>