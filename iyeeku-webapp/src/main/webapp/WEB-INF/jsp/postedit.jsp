<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>写博客 - 杨旭东</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
	<meta name="keywords" content="free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
	<style>
		*{
			margin: 0;
		}
		@media screen and (max-width: 800px) {
			.edit-main{
				width:100%;
				margin:auto;
			}
		}
		@media screen and (min-width: 800px) {
			.edit-main{
				width:800px;
				margin:auto;
			}
		}
		.sss {
			height: 12px;
			width:100%;
	
		/*  background: -webkit-linear-gradient(white, #E0ECFF); 
    		background: -o-linear-gradient(white, #E0ECFF);
   			background: -moz-linear-gradient(white, #E0ECFF);
    		background: linear-gradient(white, #E0ECFF); */
    
		/*  background: -webkit-linear-gradient(#E0ECFF,white);
    		background: -o-linear-gradient(#E0ECFF,white); 
    		background: -moz-linear-gradient(#E0ECFF,white); 
    		background: linear-gradient(#E0ECFF,white);   */
    
    		background: -webkit-linear-gradient(#f9f9f9, #ededed); 
    		background: -o-linear-gradient(#f9f9f9, #ededed);
    		background: -moz-linear-gradient(#f9f9f9, #ededed);/*火狐*/
    		background: linear-gradient(#f9f9f9, #ededed);
    
    
		/*  background: -webkit-linear-gradient(left top,white, #E0ECFF); 
    		background: -o-linear-gradient(bottom right, white, #E0ECFF); 
    		background: -moz-linear-gradient(bottom right, white, #E0ECFF); 
    		background: linear-gradient(to bottom right, white, #E0ECFF); */ 
    
		}		
		
		.minus_margin_70 {
			margin-left:-70px;
		}
		
		::-webkit-scrollbar{  
		   width:8px;  
		   height:8px;  
		}
		
		::-webkit-scrollbar-thumb {
		    height: 5px;
		    border: 1px solid transparent;
		    border-top: none;
		    border-bottom: none;
		    -webkit-border-radius: 6px;
		    background-color: rgba(0,0,0,.3);
		    background-clip: padding-box;
		}
		
		::-webkit-scrollbar-track-piece{  
		   background-color:#fff;  
		   -webkit-border-radius:8;  
		}
		
		::-webkit-scrollbar-thumb:hover{  
		   background-color:#404040;  
		 
		   -webkit-border-radius:8px;  
		}
		body{
			font-family: "Pingfang SC", "STHeiti", "Lantinghei SC", "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei", "WenQuanYi Micro Hei", SimSun, sans-serif;
		}
		
		.post-abstract{
			resize: none;
			scrollbar-face-color:#7f7f7f; /*滚动条3D表面（ThreedFace）的颜色*/ 
			scrollbar-highlight-color:#f9f9f9; /*滚动条3D界面的亮边（ThreedHighlight）颜色*/ 
			scrollbar-shadow-color:#eeeeee; /*滚动条3D界面的暗边（ThreedShadow）颜色*/ 
			scrollbar-3dlight-color:#eeeeee; /*滚动条亮边框颜色*/ 
			scrollbar-arrow-color:#f9f9f9; /*滚动条方向箭头的颜色 */ 
			scrollbar-track-color:#fff; /*滚动条的拖动区域(TrackBar)颜色*/
			scrollbar-darkshadow-color:#fff; /*滚动条暗边框（ThreedDarkShadow）颜色*/ 
		}
		.list-item{
			text-align: right;
			line-height: 30px; 
			cursor: pointer;
			padding-right:30px;
		}
		/* .list-item:hover{
			background-color: #eee;
    		color: #4eaa4c;
		} */
		.post-title{
			font-size: 18px;outline:none; color: #4a4a4a;width:540px;height:31;padding:5px 10px;border:none;
		}
		.post-abstract{
			outline:none; color: #bbb;width:540px;height:28px;padding:5px 10px;border:none;font-size: 13px;
		}
		#self-switch-style{
			width: 40px!important;
    		height: 20px!important;
		}
		#self-switch-style span{
			width: 18px;
    		height: 18px;
		}
	</style>
	<%@ include file="header.jspf" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/honeySwitch.css" type="text/css" />
	<script src="${pageContext.request.contextPath}/js/honeySwitch.js" type="text/javascript"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
	<script src="${pageContext.request.contextPath}/js/postedit.js"></script>
	
	<script>
		$(document).ready(function(){
			
			$(".post-abstract").focus(function(){
				$(this).animate({height:'180px'});
			});
			
			$(".post-abstract").blur(function(){
				$(this).animate({height:'28px'});
			});
			
			$(".drop-down,.drop-down-list").hover(function(){
			    $(".drop-down-list").css("display","block");
		    },function(){
		    	$(".drop-down-list").css("display","none");
		  	});
			
			$(".list-item").hover(function(){
			    $(this).css({background: '#eee',color: '#4eaa4c'});
		    },function(){
		    	$(this).css({background: '#ffffff',color: '#4a4a4a'});
		  	});
			
			$(".list-item").click(function(){
				$(".list-item").hover(function(){
				    $(this).css({background: '#eee',color: '#4eaa4c'});
			    },function(){
			    	$(this).css({background: '#ffffff',color: '#4a4a4a'});
			  	});
				$(this).unbind('mouseenter').unbind('mouseleave');
				$(".list-item").css({background: '#ffffff',color:'#4a4a4a'});
				$(".drop-down").children("span").html($(this).children("span").html());
				$(this).css({background: '#eee',color: '#4eaa4c'});
			});
		});
	</script>
	
</head>
<body>

 <%@ include file="nav.jspf" %>
    
    <!-- 预留200,标题和摘要 -->
	<div class="edit-main" style="margin-top:15px">
	    <div style="width:100%;background-color: #ffffff;">
	    	<!-- 选择分类 -->
		    <div style=" position: relative; height: 32px; width: 250px;float: right;    color: #4a4a4a; ">
		    	<div class="drop-down" style=" height: 32px; width: 250px; text-align: right; ">分类&nbsp;<B>:</B>&nbsp;<span>工作日志</span></div>
		    	<div class="drop-down-list" style="background:#ffffff;position: absolute;display:none; max-height: 360px; min-width: 210px; max-width: 240px; border: 1px solid #ddd; padding-bottom: 10px; right: 0; top: 30px; z-index: 100;">
		    		<div class="list-item"><span>工作日志</span></div>
		    		<div class="list-item"><span>日常记录</span></div>
		    		<div class="list-item"><span>转帖的文章</span></div>
		    		<div style="text-align: center;line-height: 30px;padding:0 30px 0 15px;">
		    			<input type="text" style="border-radius: 3px;margin:5px 0;padding: 0 10px;border: 1px solid #ddd;width: 100%;line-height: 26px;" placeholder="新的分类/回车确认" >
		    		</div>
		    	</div>
		    </div>
		    <!-- 标题 -->
		    <div>
		    	<input type="text" id="title" class="post-title" placeholder="无标题博客" value=""  />
		    </div>
		    <!-- 摘要 -->
		    <div>
		    	<textarea id="abstract" class="post-abstract" name="abstracts" placeholder="无摘要" value=""
		    	style="height: 28px;"></textarea>
		    </div>
	    </div>
	</div>
	

    <div style="width: 100%;background-color: #f9f9f9;border-top: 1px solid #d1d1d1;border-bottom: 1px solid #d1d1d1;">
    	&nbsp;
    	<div class="edit-main" style="margin-top: 0px;">
    		<textarea id="editor" name="editor" rows="30" style="width: 99.4%; display: none;" class="ckeditor">
			</textarea>
       		<script type="text/javascript">
  				var editor=CKEDITOR.replace('editor',{customConfig:"config.js",codeSnippet_theme: 'monokai_sublime'});
  			</script>
    	</div>
    	
    	<div class="edit-main" style="height: 45px;background-color:white; margin-top: 12px;border: 1px solid #d1d1d1;">
    		
    	</div>
    	
    	<div class="edit-main" style="margin-top: 20px;">
			<div class="row" style="height: 30px;">
				<div class="col-sm-3 col-md-3">
				系统分类:
				</div>
				<div class="col-sm-9 col-md-9 minus_margin_70"></div>
			</div>
			<div class="row" style="height: 30px;">
				<div class="col-sm-3 col-md-3">
				文章类型:
				</div>
				<div class="col-sm-9 col-md-9 minus_margin_70"></div>
			</div>
			<div class="row" style="height: 30px;">
				<div class="col-sm-3 col-md-3">
				是否对所以人可见:
				</div>
				<div class="col-sm-9 col-md-9 minus_margin_70"><span class="switch-on" id="self-switch-style" themeColor="gold" id="fly"></span></div>
			</div>
			<div class="row" style="height: 30px;">
				<div class="col-sm-3 col-md-3">
				是否允许评论:
				</div>
				<div class="col-sm-9 col-md-9 minus_margin_70"><span class="switch-on" id="self-switch-style" themeColor="gold" id="fly"></span></div>
			</div>
			<div class="row" style="height: 30px;">
				<div class="col-sm-3 col-md-3">
				是否置顶:
				</div>
				<div class="col-sm-9 col-md-9 minus_margin_70"><span class="switch-off" id="self-switch-style" themeColor="gold" id="fly"></span></div>
			</div>
			
    	</div>
    	<br>

    	
    </div>
    
    <div style="width: 100%;height: 90px;background-color: #f8f8f8;">
    
    </div>
    <div style="width:100% ;height: 75px;" ></div>
    <div style="width:100% ;background-color: #f9f9f9;position:fixed;bottom:0;height: 78px;">
    	<div class="sss"></div>
    	<div class="edit-main">
    		<button class="btn btn-success btn-lg" style="float: left;margin: 10px auto auto 10px;">保存草稿</button>
    		<button class="btn btn-success btn-lg" style="float: right;margin-right: 10px;margin-top: 10px;" onclick="publish()">发布</button>
    	</div>
    </div>


</body>

<script type="text/javascript">



	function publish(){
	    console.info(editor.getData());

	    $.post("/user/newblog",{content:editor.getData()},function (result) {
			console.info(result);
        })

	}


</script>

</html>