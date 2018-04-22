<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
<%-- <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js" type="text/javascript"></script> --%>
<script type="text/javascript">
/* $(function(){
	
	$(".question.menu-drop").hover(function(){
		$(".question.menu-drop-down").css({display: 'block'});
	},function(){
		$(".question.menu-drop-down").css({display: 'none'});
	});
	
	
	$(".user-menu.menu-drop").hover(function(){
		$(".myspace.menu-drop-down").css({display: 'block'});
	},function(){
		$(".myspace.menu-drop-down").css({display: 'none'});
	});
	
	
	$(".question.menu-drop li").hover(function(){
		$(this).children().css({background:'#f4f4f4',color:'#46ad2e'});
	},function(){
		$(this).children().css({background:'#ffffff',color:'#111111'});
	});
	
	$(".user-menu.menu-drop li").hover(function(){
		$(this).children().css({background:'#f4f4f4',color:'#46ad2e'});
	},function(){
		$(this).children().css({background:'#ffffff',color:'#111111'});
	});
	
}); */

function onDivChangeStyle(name){
	var obj = document.getElementById(name);
	obj.style.display = "block";
	
}

function outDivChangeStyle(name){
	var obj = document.getElementById(name);
	obj.style.display = "none";
}

function liBindEvent(){
	var q_ul = document.getElementById("questionUl");
	var s_ul = document.getElementById("myspaceUl");
	var q_lis = q_ul.childNodes;
	for(var i=0 ; i<q_lis.length ; i++){
		q_lis.item(i).onmouseover = onLiChangeStyle;
		q_lis.item(i).onmouseout = outLiChangeStyle;
	}
	var s_lis = s_ul.childNodes;
	for(var i=0 ; i<s_lis.length ; i++){
		s_lis.item(i).onmouseover = onLiChangeStyle;
		s_lis.item(i).onmouseout = outLiChangeStyle;
	}
}

function onLiChangeStyle(event){
	event = event ? event : window.event; 
	var obj = event.srcElement ? event.srcElement : event.target; 
	obj.style.color = '#46ad2e';
	obj.style.background = '#f4f4f4';
}

function outLiChangeStyle(event){
	event = event ? event : window.event; 
	var obj = event.srcElement ? event.srcElement : event.target; 
	obj.style.color = '#111111';
	obj.style.background = '#ffffff';
}

</script>

</head>
<body onload="liBindEvent()">

	<div class="header-navbar">
		<div class="layout-flex top-banner">
			<div class="flex-grow">
				<a href="${pageContext.request.contextPath}/question" class="osc-logo"></a>
				<div class="menus sm-hide">
					<a href="${pageContext.request.contextPath}/question" class="menu-item">首页</a>
				
					<div class="menu-item question menu-drop"	
						onmouseover="onDivChangeStyle('questionDrop')"
						onmouseout="outDivChangeStyle('questionDrop')" >
						<a href="${pageContext.request.contextPath}/question" class="question">
							问答<i class="icon-svg icon-arr-down-white"></i>
						</a>
						<div id="questionDrop" class="menu-drop-down">
							<ul id="questionUl" class="drop-list">
								<li><a href="${pageContext.request.contextPath}/question"> 技术问答</a></li>
								<li><a href="${pageContext.request.contextPath}/question2"> 技术分享</a></li>
								<li><a href="${pageContext.request.contextPath}/question3"> IT大杂烩</a></li>
								<li><a href="${pageContext.request.contextPath}/question4"> 职业生涯</a></li>
								<li><a href="${pageContext.request.contextPath}/question5"> 站务/建议</a></li>
							</ul>
						</div>
					</div>
					<a href="#" class="menu-item blog">博客</a>
					<a href="#" class="menu-item tweets">动弹</a>
					<a href="#" class="menu-item news">资讯</a>
					<a href="#" class="menu-item event">活动</a>
				</div>
				
			</div>
			
			<div class="user-bar">
				<div class="user-info">
					<span class="name">杨旭东love</span>，您好 
					<div class="user-menu menu-drop user-menu sm-hide"
						onmouseover="onDivChangeStyle('myspaceDrop')"
						onmouseout="outDivChangeStyle('myspaceDrop')">
						<a id="MySpace" href="index.jsp">
							我的空间
							<i class="icon-svg icon-arr-down-white"></i>
						</a>
						<div id="myspaceDrop" class="menu-drop-down">
							<ul id="myspaceUl" class="drop-list myspace">
								<li class="msg"><a href="${pageContext.request.contextPath}/personalBox">我的私信</a></li>
								<li class="code"><a href="#">我分享的代码</a></li>
								<li class="blog"><a href="${pageContext.request.contextPath}/myblogs">我的博客</a></li>
								<li class="friends"><a href="#">我关注的人</a></li>
								<li class="favorites"><a href="#">我的收藏夹</a></li>
								<li class="profile"><a href="${pageContext.request.contextPath}/modifyPersonInfo">个人资料修改</a></li>
							</ul>
						</div>
					</div>
					<a href="#" class="user-menu sm-hide">投递新闻</a>
					<a href="register.jsp" class="user-menu sm-hide">注册</a>
					<a href="#">退出</a>
				</div>
			</div>
			
		</div>
		
	</div>
	
</body>
</html>