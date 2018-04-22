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
	$(document).ready(function(){
		$("#search").focus(function(){
			$(this).animate({width:'300px'},200,function(){
				$(".ent").css("display","block");
			});
			$(".search").css({borderBottom: '1px solid #666'});
			console.info("sasa");
		});
		
		$("#search").blur(function(){
			$(".ent").css("display","none");
			$(this).animate({width:'120px'},200,function(){
				$(".search").css({borderBottom: 'none'});
			});
		});
		$(".tab").click(function(){
			$(".tab").removeClass("tabActivited");
			$(this).addClass("tabActivited");
		});
	});
</script>


<style>
	body{
		background-color: #ffffff;
		font-family: "Pingfang SC", "STHeiti", "Lantinghei SC", "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei", "WenQuanYi Micro Hei", SimSun, sans-serif;
	}
	
	a,a:hover,a:visited,a:active,a:link{
		text-decoration: none;
	    color: #6a6a6a;
	}
		
	.nav-myblogs{
		width:1200px;
	    padding-top: 60px;
    	padding-bottom: 40px;
    	margin:auto;
    	height: 584px;
	}
	.myblogs-left{
		width:340px;
		float:left;
	    border-right: 1px dashed #d1d1d1;
        padding: 0 40px 10px 0;
    	color: #666;
	}
	
	.myblogs-right{
	    display: table-cell;
	    width:1200px;
	}
	
	.user-info{
   	    text-align: center;
	}
	.user-info .icon{
		margin:auto;
		width:100px;
	}
	.user-info .username{
	    font-size: 1.8rem;
    	line-height: 3;
	}
	.user-info .edit{
		margin-top:10px;
	}
	.inputButton{
   	    font-size: 14px;
	    padding: 3px 8px !important;
	    cursor: pointer;
	    color: #fff!important;
	    border: 1px solid transparent;
	    border-radius: 2px;
	    outline: none;
	    display: inline-block;
    }
    .post{
	    background: #4eaa4c;
        width: 100px;
        padding: .4rem 1.2rem!important;
    	font-size: 1.6rem;
    }
    .divide {
	    border-top: 1px dashed #d1d1d1;
	    height: 0;
	    overflow: hidden;
	    font-size: 0;
	    margin: 20px auto;
        width: 20%;
	}
	.user-sort{
		line-height: 2;
	}
	.user-sort .title{
		margin-bottom: 15px;
	    padding-left: 10px;
	    line-height: 30px;
	    border-bottom: 1px solid #e1e1e1;
	}
	.user-sort .name{
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    padding-right: 15px;
	}
	.user-sort .num{
		font-size: 1.2rem;
    	float: right;
	}
	.user-sort a{
		border-radius: 15px;
	    height: 28px;
	    line-height: 28px;
	    padding: 0 10px;
	    margin: 2px 0;
	    display: block;
	}
	.user-sort .active{
		background: #f2f2f2;
	    color: #4eaa4c;
	    font-weight: 500;
	}
	.user-sort a:hover{
		background: #f2f2f2;
	    color: #4eaa4c;
	    font-weight: 500;
	}
	.myblogs-right{
	    padding-left: 50px;
	}
	.myblogs-right .menu{
	    /* border-bottom: 1px solid #ddd; */
	    
	    line-height: 40px;
	}
	.myblogs-right .menu .search{
		float:right;
	}
	.menu .tabs .tab{
	    width: 120px;
	    float: left;
	    font-size: 1.8rem;
	    text-align: center;
	    color: #999;
	    cursor: pointer;
	}
	
    .tabActivited{
    	border-bottom: 1px solid #4eaa4c;
    	color: #4eaa4c!important;
    }
    .menu .search{
   	    position: relative;
    }
    .search .ent{
    	position: absolute;
    	right:0px;
    	top: 0px;
    }
    .menu .search input{
        border: none;
	    width: 120px;
	    background: 0 0;
	    font-size: 1.4rem;
	    outline:none;
	    padding-right:20px;
	    padding:0px;
    }
    .border{
    	border-bottom: 1px solid #ddd;
    	clear:both;
    }
    .nav-foot{
    	clear:both;
    	margin-top:40px;
    	width:100%;
    	height:100px;
    	background-color: #fafafa;
    }
    </style>
</head>
<body>

      
      
	<%@ include file="nav.jspf" %>
    
    <!-- 预留400,展示个人基本信息 -->
    <div style="width:100%;height: 100%;">
    	<div class="nav-myblogs">
    		<div class="myblogs-left">
				<div class="user-info">
					<div class="icon">
						<a href="#"><img src="${pageContext.request.contextPath}/images/myzone_100.jpg" style="border-radius: 50%;"/></a>
					</div>
					<div class="username">
						<a href="#" target="_blank">Y_Kvboo</a>
						<a href="#" target="_blank"><i class="icon-home"></i></a>
					</div>
					<div class="writewords">
						共码了 <span title="共 0 篇">0</span> 个字
					</div>
					<div class="edit">
						<a href="${pageContext.request.contextPath}/postedit" class="inputButton post">写博客</a>
					</div>
					<div class="edit">
						<a href="#">
							草稿箱 (0)
						</a>
					</div>
					<div class="edit">
						<a href="#">
							<span style="font-size: 12px;padding: .1em .5em;color: #FF6600;border: 1px solid #FF6600;border-radius: 9px!important;">RSS订阅</span>
						</a>
					</div>
				</div>
				<div class="divide"></div>
					<div class="user-sort">
						<div class="title">
							<span style="font-size: 1.8rem;color: #000;">分类</span>
							<em class="num" style="float: right; font-style: inherit; font-size: 1.2rem; color: #666;">共 0 篇</em>
						</div>
						<div class="sort-list">
							<ul style="margin:0px;padding:0px;">
								<a href="#" class="active">
									<span class="num">0</span>
									<div class="name">
									工作日志
									</div>
								</a>
								<a href="#">
									<span class="num">0</span>
									<div class="name">
									日常记录
									</div>
								</a>
								<a href="#">
									<span class="num">0</span>
									<div class="name">
									转贴的文章
									</div>
								</a>
							</ul>
						</div>
					</div>
    			</div>
    		<div class="myblogs-right">
    			<div class="menu">
    				<div class="tabs">
	    				<a href="#" class="tab tabActivited">最新</a>
	    				<a href="#" class="tab">最热</a>
    				</div>
    				<div class="search">
    					<i>icon</i>
    					<input type="text" name="search" id="search" placeholder="#> 搜索博客">
    					<i class="ent" style="display:none">enter</i>
    				</div>
    				<div class="border"></div>
    			</div>
    			<div class="content">
    				<p style="margin:14px 0;">
			            Y_Kvboo 很懒,一篇博客也没写过
			        </p>
    			</div>
    		</div>
    	</div>
    	<div class="nav-foot">
    	</div>
    </div>
       
</body>
</html>