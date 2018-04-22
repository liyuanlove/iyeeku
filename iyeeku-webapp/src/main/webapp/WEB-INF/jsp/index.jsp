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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/share.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.Jcrop.css" type="text/css" />
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/share.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.Jcrop.js" type="text/javascript"></script>

<script>
	$(function() {
		
	    var jcrop_api;
	    var boundx;
	    var boundy;
	    var $preview = $('#preview-pane'); 

		$("#socialShare").socialShare({
			content: '',
			url:'',
			titile:''
		});
		
		$(".user-icon").hover(function(){
			$(".upload-logo").css({display: 'block'});
		},function(){
			$(".upload-logo").css({display: 'none'});
		});
		
		$("#signatureShow").click(function(){
			$(this).css({display: 'none'});
			$(this).next().css({display: 'block'}).focus();
		});
		
		$("#signatureTextarea").focusout(function(){
			$(this).css({display: 'none'});
			$(this).prev().css({display: 'block'});
		});
		
		$("#imgShow").change(function(){
			
/* 			var file_url = getvl(this);
			console.info(file_url);
			$("#aaaa").attr("src",file_url); */
			
			
/* 		    function showimg(src) {
		        var img = $('imgview');
		        img.src = src;
		        img.style.display = 'block';
		    } */
			
	        if (this.files && this.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function (evt) {
	            	
			        var img = document.getElementById("aaaa");
			        img.src = evt.target.result;
			        img.style.display = 'block';
	               /*  showimg(evt.target.result); */
	            };
	            reader.readAsDataURL(this.files[0]);
	        } else {
	            this.select();
	            var src = document.selection.createRange().text;
	            
		        var img = document.getElementById("aaaa");
		        img.src = evt.target.result;
		        img.style.display = 'block';
	          /*   showimg(src); */
	        }
			
			
	/* 		   $('#aaaa').Jcrop({
			      	  allowSelect: false,
			      	  boxWidth : 360,
			      	  boxHeight : 360,
			      	  setSelect : [50,50,310,310],
			      	  maxSize : [360 , 360],
			          onChange: updatePreview,
			          onSelect: updatePreview,
			            aspectRatio: 1
			          },function(){
						console.info("执行到这里 ！！！！");
			            var bounds = this.getBounds();
			            console.info("bounds ==>> "+bounds[0]);
			            boundx = bounds[0];
			            boundy = bounds[1];
			            
			            jcrop_api = this;
			            $preview.appendTo(jcrop_api.ui.holder);
			      	  
			 });  */
			
		});
		
		// signatureTextarea
		
		// TODO 
		// 图片裁剪 的全局变量
		
		function showPicture(obj){
			var file_url = getvl(obj);
		//	console.info(file_url);
		$("#aaaa").attr("src",file_url);
	    	
	        $('#aaaa').Jcrop({
	      	  allowSelect: false,
	      	  boxWidth : 360,
	      	  boxHeight : 360,
	      	  setSelect : [50,50,310,310],
	      	  maxSize : [360 , 360],
	          onChange: updatePreview,
	          onSelect: updatePreview,
	            aspectRatio: 1
	          },function(){
				console.info("执行到这里 ！！！！");
	            var bounds = this.getBounds();
	            console.info("bounds ==>> "+bounds[0]);
	            boundx = bounds[0];
	            boundy = bounds[1];
	            
	            jcrop_api = this;
	            $preview.appendTo(jcrop_api.ui.holder);
	      	  
	          });
	    		
	    }
	    
	    
	    function updatePreview(c)
	    {
	      if (parseInt(c.w) > 0)
	      {
	        var rx1 = 100 / c.w;
	        var ry1 = 100 / c.h;
	        
	        var rx2 = 50 / c.w;
	        var ry2 = 50 / c.w;

	        $("#img1").css({
	          width: Math.round(rx1 * boundx) + 'px',
	          height: Math.round(ry1 * boundy) + 'px',
	          marginLeft: '-' + Math.round(rx1 * c.x) + 'px',
	          marginTop: '-' + Math.round(ry1 * c.y) + 'px'
	        });
	        
	        $("#img2").css({
	            width: Math.round(rx2 * boundx) + 'px',
	            height: Math.round(ry2 * boundy) + 'px',
	            marginLeft: '-' + Math.round(rx2 * c.x) + 'px',
	            marginTop: '-' + Math.round(ry2 * c.y) + 'px'
	        });
	        
	      }
	    };
	    	
	    	//FX获取文件路径方法
	    	function readFileFirefox(fileBrowser) {
	    	  try {
	    	    netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
	    	  } 
	    	  catch (e) {
	    	    alert('无法访问本地文件，由于浏览器安全设置。为了克服这一点，请按照下列步骤操作：(1)在地址栏输入"about:config";(2) 右键点击并选择 New->Boolean; (3) 输入"signed.applets.codebase_principal_support" （不含引号）作为一个新的首选项的名称;(4) 点击OK并试着重新加载文件');
	    	    return;
	    	  }
	    	  var fileName=fileBrowser.value; //这一步就能得到客户端完整路径。下面的是否判断的太复杂，还有下面得到ie的也很复杂。
	    	  var file = Components.classes["@mozilla.org/file/local;1"]
	    	    .createInstance(Components.interfaces.nsILocalFile);
	    	  try {
	    	    // Back slashes for windows
	    	    file.initWithPath( fileName.replace(/\//g, "\\\\") );
	    	  }
	    	  catch(e) {
	    	    if (e.result!=Components.results.NS_ERROR_FILE_UNRECOGNIZED_PATH) throw e;
	    	    alert("File '" + fileName + "' cannot be loaded: relative paths are not allowed. Please provide an absolute path to this file.");
	    	    return;
	    	  }
	    	  if ( file.exists() == false ) {
	    	    alert("File '" + fileName + "' not found.");
	    	    return;
	    	  }
	    	 
	    	 return file.path;
	    	}
	    	 
	    	 
	    	//根据不同浏览器获取路径
	    	function getvl(obj){
	    	//判断浏览器
	    	 var Sys = {}; 
	    	 var ua = navigator.userAgent.toLowerCase(); 
	    	 var s; 
	    	 (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] : 
	    	 (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] : 
	    	 (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] : 
	    	 (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] : 
	    	 (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
	    	 var file_url="";
	    	 if(Sys.ie<="6.0"){
	    	  //ie5.5,ie6.0
	    	  file_url = obj.value;
	    	 }else if(Sys.ie>="7.0"){
	    	  //ie7,ie8
	    	  obj.select();
	    	  obj.blur();
	    	  file_url = document.selection.createRange().text;
	    	 }else if(Sys.firefox){
	    	  //fx
	    	  //file_url = document.getElementById("file").files[0].getAsDataURL();//获取的路径为FF识别的加密字符串
	    	  file_url = readFileFirefox(obj);
	    	 }else if(Sys.chrome){
	    	  file_url = obj.value;
	    	 }
	    	 //alert(file_url);
	    	//  document.getElementById("text").innerHTML="获取文件域完整路径为："+file_url;
	    	return file_url;
	    	// console.info("执行到这里");
	    	// console.info(file_url);
	    	}
		
		
	});
</script>


<style>
	body{
		background-color: #fafafa;
		font-family: "Pingfang SC", "STHeiti", "Lantinghei SC", "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei", "WenQuanYi Micro Hei", SimSun, sans-serif;
	}
	
	a,a:hover,a:visited,a:active,a:link{
		text-decoration: none;
	    color: #6a6a6a;
	}
     .tag li{
      float:left;
      display: list-item;
	   	text-align: -webkit-match-parent;
	   	list-style: none;
     } 
     .tag li a{
     	padding:5px 20px;
     	font-size: 14px;
     	border-radius: 13px;
      	line-height: 26px;
     	color:#6a6a6a;
    	background-color:#f0f0f0;
    	margin-right: 10px;
    	font-size: 14px;
    	
     }
     .tag li a:hover{
	    color: #ffffff;
	    background-color:#4eaa4c;
	 }
	 
	 .myfavore {
	    display: block;
	    background: #f5a623;
	    font-size: 20px;
	    padding: 12px 0;
	    margin-top: 20px;
	    text-align: center;
	    border-radius: 3px;
	}
	.myfavore a{
	    color: #fff;
	}
	#socialShare a{
		-webkit-box-sizing: content-box; 
        box-sizing: content-box;
	}
	.layout-flex{
		display: -webkit-box;
		display: -ms-flexbox;
		display: flex;
		-webkit-box-align: center;
		-ms-flex-align: center;
		align-items: center;
	}
	
	.space-banner{
		min-height:180px;
		background: url(${pageContext.request.contextPath}/images/space-banner.jpg) no-repeat center, radial-gradient(ellipse at 0 100%, #fef6eb 2%, rgba(255, 255, 255, 0) 80%), linear-gradient(130deg, #f8f7f2 40%, #e2e2e0, #cfd7e1);
		background-size: cover;
	}
	.space-banner .content-wrapper{
		position: relative;
		min-height: 180px;
	}
	.content-wrapper{
		display: flex;
		-webkit-box-align:center;
		align-items:center;
		max-width: 1200px;
		margin: auto;
	}
	
	.space-banner .user-icon{
		width: 100px;
		height: 100px;
		margin-right: 22px;
		-ms-flex-item-align: center;
		-ms-grid-row-align: center;
		align-self:center;
		border-radius:50%;
		display: inline-block;
		position: relative;
		background-color: gray;
	}
	
	.user-space .user-icon .user-gender {
    	position: absolute;
    	bottom: 3px;
    	right: 3px;
    	width: 24px;
    	height: 24px;
    	background: #58bcf6;
    	border-radius: 50%;
    	border: 2px solid #fff;
    	line-height: 15px;
    	text-align: center;
    	z-index: 10;
	}
	
	.user-space .user-icon .upload-logo {
    	display: none;
    	position: absolute;
    	top: 0;
    	left: 0;
    	background: rgba(0, 0, 0, 0.5);
    	width: 100%;
    	height: 100%;
    	overflow: hidden;
    	cursor: pointer;
    	border-radius: 50%;
	}
	
	.user-space .user-icon .text-muted {
    	color: #fff;
    	text-align: center;
    	margin-top: 40px;
	}
	
	.user-space .user-icon img {
    	width: 100px;
    	max-width: 100px;
    	height: 100px;
    	float: left;
    	border-radius: 50%;
    	overflow: hidden;
	}
	
	.space-banner .user-info{
		padding-top: 40px;
		-webkit-box-flex: 1;
		flex:1;
	}
	.space-banner .user-info-detail{
		-webkit-box-flex: 1;
		flex:1;
	}
	.space-banner .user-signature {
    	line-height: 20px;
    	position: relative;
   		display: inline-block;
    	width: 100%;
    	margin: 5px 0 10px;
    	padding: 5px;
    	word-break: break-all;
    	word-break: break-word;
    	color: #666;
	}
	
	.space-banner .user-signature [data-signature='text'] {
    	position: relative;
    	display: inline;
    	padding-right: 10px;
    	border: 1px solid transparent;
    	border-radius: 5px;
	}
	
	.space-banner .user-signature textarea {
    	font-size: 14px;
    	line-height: 20px;
    	display:none;
    	width: 100%;
    	height: 60px;
    	color: #666;
    	border-color: #66a757;
    	background: rgba(255, 255, 255, 0.5);
    	padding: 5px 10px;
    	border-radius: 3px;
	}
	
	.a-btn {
    	border-radius: 3px;
    	padding: .4rem .8rem;
    	outline: 0;
    	border: 0;
    	margin: 0;
    	color: #fff;
    	background-color: transparent;
    	font-size: 1.4rem;
    	display: inline-block;
    	cursor: pointer;
	}
	
	.space-banner .a-btn-green-border {
    	color: #4eaa4c;
    	border: 1px solid #66a757;
	}
	
	.space-banner .a-btn-edit {
    	margin-right: 14px;
    	padding: .3rem .8rem;
    	border-radius: 2px;
    	background-color: transparent;
	}
	
	.space-banner .user-info-detail .join-time {
    	margin-bottom: 10px;
    	color: #999;
	}
	.tabs{
		font-size: 18px;
	    line-height: 2;
	    padding-top: 30px;
	    border-bottom: 1px solid #ddd;
    }
    .tabs a{
    	padding:0 15px;
   	    display: inline-block;
   	    cursor: pointer;
    }
    .tabs a:hover{
    	border-bottom: 2px solid #4eaa4c;
    	color: #4eaa4c;
    }
	.space-banner .user-score{
		padding-top: 40px;
		min-width: 350px;
		text-align: right;
		align-self: flex-start;
	}
	
	.layout-right {
    	float: right;
	}
	
	.space-banner .user-score .score-item {
    	font-size: 16px;
    	display: inline-block;
    	margin-left: 30px;
    	text-align: center;
    	color: #666;
	}
	
	.space-banner .user-score .score-item .score-num {
    	font-size: 36px;
   		font-weight: 600;
    	display: block;
    	margin-top: 5px;
    	color: #4eaa4c;
	}
	.user-score a{
    	transition: color .3s;
    	text-decoration: none;
    	border: none;
    	outline: none;
	}
	
	/*  修改input的样式 */
	
.file {
	
 	position: relative;
    display: inline-block;
    padding: 6px 12px;
   	overflow: visible;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
    background-color: #f0ad4e;
    
}

.inputfile{
	opacity: 0;
    position: absolute;
    right: 0;
    bottom: 0;
    width: 200%;
    height: 200%;
    cursor: pointer;
}

.jcrop-holder #preview-pane {
  display: block;
  position: absolute;
  z-index: 2000;
  top: 10px;
  right: -280px;
  padding: 6px;
  border: 1px rgba(0,0,0,.4) solid;
  background-color: white;

  -webkit-border-radius: 6px;
  -moz-border-radius: 6px;
  border-radius: 6px;

  -webkit-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
  -moz-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
  box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
}

/* The Javascript code will set the aspect ratio of the crop
   area based on the size of the thumbnail preview,
   specified here */
#preview-pane .preview-container {
  width: 100px;
  height: 100px;
  overflow: hidden;
}

    </style>
</head>
<body>

    <%@ include file="nav.jspf" %>
    
    <!-- 预留400,展示个人基本信息 -->
    <div class="user-space">
    <div class="space-banner">
    	<div class="layout-flex content-wrapper">
    		<!-- 头像 -->
    		<div class="user-icon" data-toggle='modal' data-target='#uploadPortrait' data-backdrop='static'>
    			<span class="user-gender male"></span>
    			<img id="upload_img" alt="杨旭东love" src="${pageContext.request.contextPath}/images/3280697_100.jpg">
    			<div class="upload-logo">
    				<div class="text-muted">上传头像</div>
    			</div>
    		</div>
    		<!-- 用户基本信息 -->
    		<div class="user-info">
    			<div class="layout-flex">
    				<div class="user-info-detail">
    					<div class="user-title" style="color: #111;">
    						<span class="nickname" style="font-size: 24px;margin-right: 12px;">杨旭东love</span>
    						<span class="post" style="margin-right: 5px;"></span>
    						<span class="address">上海 - 浦东新区</span>
    					</div>
    					<div class="user-signature">
    						<span id="signatureShow" data-signature='text' title="点击修改签名">
    							杨旭东love很懒,啥签名啥也没写
    						</span>
    						<textarea type="hidden" id="signatureTextarea" maxlength="120">杨旭东love很懒,啥签名啥也没写</textarea>
    						<span id="git_url" style="line-height: 30px;border: 1px solid transparent;"></span>
    					</div>
    					<div class="info-edit">
    						<a href="${pageContext.request.contextPath}/modifyPersonInfo" target="_blank" class="a-btn a-btn-green-border a-btn-edit">
    							<i></i>编辑个人资料
    						</a>
    					</div>
    					<div class="join-time">
    						加入于 2017/02/18
    					</div>
    				</div>
    			</div>
    		</div>
    		<!-- 相关数据 - 积分 - 粉丝 - 关注 -->
    		<div class="user-score" id="user-score-pjax">
    			<div class="layout_right">
    				<div class="score-item integral">
    				积分
    				<a href="#" target="_blank" class="score-num">0</a>
    				</div>
    				<div class="score-item fans">
    				粉丝
    				<a href="#" target="_blank" class="score-num">0</a>
    				</div>
    				<div class="score-item follow">
    				关注
    				<a href="#" target="_blank" class="score-num">0</a>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
    </div>
    
    <!-- 内容区 -->
    <div class="container" style="position: relative;">
    	<!-- 浮动按钮 -->
    	<div id="socialShare" style=" position: absolute; top: -30px; right: 100px; z-index: 5;"></div>
    	<div class="form-group">
    		<!-- 个人中心左边导航栏 -->
    		
    		<div class="col-sm-3" style="border-right: 1px solid #e6e6e6;">
				<div class="form-group"></div>
				<div class="form-group myfavore">
					<a href="#">我的收藏夹</a>
				</div>
				<div class="form-group" style="border-bottom: 1px solid #e6e6e6;">
					<h4>我的团队</h4>
				</div>
				<div class="form-group" style="border-bottom: 1px solid #e6e6e6;">
					<br><h4>职位技能</h4>
				</div>
				<div class="form-group">
					开发平台
				</div>
				<div class="form-group">
					无
				</div>
				<div class="form-group">
					专长领域
				</div>
				<div class="form-group">
					无
				</div>
				<div class="form-group" style="border-bottom: 1px solid #e6e6e6;">
					<br><h4>访问统计</h4>
				</div>
				<div class="form-group" style="font-size: 12px;">
					今日访问：0<br>
					昨日访问：0<br>
					本周访问：0<br>
					本月访问：0<br>
					所有访问：0<br>
				</div>
    		</div>
    		<div class="col-sm-9">
    			<div class="form-group"></div>
				<div class="form-group" style="border-bottom: 1px solid #e6e6e6;">
					<h4>最新博客</h4>
				</div>				
				<div class="form-group">
					杨旭东很懒,一篇博客也没有写过,现在写博客<br><br>
				</div>
				<div class="form-group">
					<div class="tabs">
  						<span><a href="#" style="border-bottom: 2px solid #4eaa4c;color: #4eaa4c;">全部动态</a></span>
  						<span><a href="#">动弹</a></span>
  						<span><a href="#">讨论</a></span>
  						<span><a href="#">新闻</a></span>
  						<span><a href="#">翻译</a></span>
					</div>
				</div>
				<!-- 选项卡（全部动态,动弹,讨论,新闻,翻译）信息的展示区 -->
				<div class="form-group">
    				<ul class="tag">
						<li><a href="#" style="color: #ffffff;background-color:#4eaa4c;">所有</a></li>
						<li><a href="#">我自己</a></li>
						<li><a href="#">@提到我</a></li>
						<li><a href="#">评论</a></li>
						<li><a href="#">赞过我</a></li>
					</ul>
				</div>
    			
    		</div>
    	</div>
    	
    </div>
    
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="newPopup" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="background-color: #fafafa;">
				<div class="modal-header" style="border: none;margin: 0px 0px 0px 15px;">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">动弹一下</h4>
				</div>
				<div class="modal-body" style="margin: -15px 15px -20px 15px;padding-left: 15px;">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							
							<div class="col-sm-12">
								<textarea class="form-control" rows="4"></textarea>
							</div>
						</div>
					</form>
				</div>
				
				<div class="modal-footer" style="border: none;">
					<button type="button" class="btn btn-warning">
					&nbsp;&nbsp;&nbsp;&nbsp;发布&nbsp;&nbsp;&nbsp;&nbsp;
					</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 头像上传模态框 -->
	<div class="modal fade" id="uploadPortrait" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="background-color: #fafafa;width: 590px;height: 484px;">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="margin: 5px 10px 0px 0px;z-index: 1000">&times;</button>
				<div class="modal-body" style="width: 540px;margin: auto;padding-left: 0px;margin-bottom: -10px;">
					<h4>头像裁剪</h4>
					<div style="width: 540px;height: 360px;">
						<div style="width: 360px;height: 360px;float: left;background-color: #f3f3f3;">
							<table width="360" height="360">
								<tr>
									<td valign="middle" align="center">
										<img id="aaaa" alt="" src="" style="max-height: 350px;max-width: 350px;display: none;">
									</td>
								</tr>
							</table>
								
								
						</div>
						<div style="text-align:center;padding:10px 20px;margin-left:10px;width: 170px;height: 360px;float: right;background-color: #f3f3f3;">
							<div style="color: #666;margin-bottom: 15px;">预览</div>
							<ul style="margin: 0;padding: 0;list-style-type: none;">
								<li style="margin: 0;padding: 0;margin-bottom: 15px;">
									<div style="width: 100px;height: 100px;border-radius: 50%;overflow: hidden;margin: 0 auto;">
											
										  <div id="preview-pane" style="border-radius: 50%;">
    											<div class="preview-container" style="border-radius: 50%;">
      												<img id="img1" src="${pageContext.request.contextPath}/images/3280697_100.jpg" class="jcrop-preview" alt="Preview" width="100" height="100" />
    											</div>
  										  </div>
									
      									<%-- <img id="img1" src="${pageContext.request.contextPath}/images/3280697_100.jpg" width="100" height="100" alt="Preview" /> --%>
									</div>
									<span style="line-height: 20px;color: #999;font-size: 13px;">100 × 100</span>
								</li>
								<li style="margin: 0;padding: 0;margin-bottom: 15px;">
									<div style="width: 50px;height: 50px;border-radius: 50%;overflow: hidden;margin: 0 auto;">
      									<img id="img2" src="${pageContext.request.contextPath}/images/3280697_100.jpg" width="50" height="50" alt="Preview" />
									</div>
									<span style="line-height: 20px;color: #999;font-size: 13px;">100 × 100</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="modal-footer" style="border: none;">
					
					<span class="btn btn-warning" style="position: relative;">
						&nbsp;&nbsp;&nbsp;&nbsp;选择&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="file" class="inputfile" name="" id="imgShow">
					</span>
					
					<button type="button" class="btn btn-warning">
					&nbsp;&nbsp;&nbsp;&nbsp;上传&nbsp;&nbsp;&nbsp;&nbsp;
					</button>
				</div>
			</div>
		</div>
	</div>
    <script type="text/javascript">
    
/*     var boundx;
    var boundy;
    var $preview = $('#preview-pane'); */ 

    
   
    </script>
       
</body>
</html>