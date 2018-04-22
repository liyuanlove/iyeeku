<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="baidu-site-verification" content="2EGsKUN13v" />
<title>技术问答 - 艺酷博</title>
<style type="text/css">
	body{
		background-color: #f8f8f8;
		font-family: "Pingfang SC", "STHeiti", "Lantinghei SC", "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei", "WenQuanYi Micro Hei", SimSun, sans-serif;
	}
	
	*{
		-webkit-box-sizing: border-box;
	}

	a {
    	background-color: transparent;
    	-webkit-text-decoration-skip: objects;
    	text-decoration: none;
    	outline: 0;
	}
	
	p {
    display: block;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
	}
	
	button, html [type=button] {
    	-webkit-appearance: button;
	}
	
	[type=button], img {
    	border: none;
    	outline: 0;
	}
	
	button, input, select, textarea {
    	font: inherit;
    	margin: 0;
    	outline: 0;
	}
	
	button, hr, input {
    	overflow: visible;
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
	
	.question-banner{
	    height: 274px;
    	background: url(${pageContext.request.contextPath}/images/ask_header.jpg) no-repeat;
    	background-size: cover;
	}
	
	.question-banner .sec-link {
    	font-size: 16px;
    	line-height: 22px;
    	position: relative;
    	display: block;
    	height: 22px;
    	padding: 0 14px;
    	cursor: pointer;
    	text-decoration: none;
    	color: #3db159;
	}
	
	.question-banner .hor-line:after {
    	position: absolute;
    	top: 10%;
    	right: 0;
    	width: 1px;
    	height: 80%;
    	content: '';
   		background: #3db159;
	}
	
	.question-banner .banner-box{
		height: 70px;
		width: 100%;
		max-width: 1200px;
		margin: auto;
	}
	
	.sc-container {
    	width: 100%;
    	max-width: 1200px;
    	margin: 0 auto;
	}
	
	.main-container{
		margin: -203px 0 0;
    	padding: 20px 30px 100px;
    	background: #fff;
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
	
	.main-container .sub-nav {
    	margin-bottom: 30px;
	}
	
	.main-container .sub-nav a {
    	font-size: 14px;
    	color: #4a4a4a;
	}
	
	.auto-height{
		height: auto!important;
	}
	
	.fields-container .field-row {
    	height: 50px;
    	margin-bottom: 30px;
	}
	
	.fields-container .f-label {
    font-size: 16px;
    line-height: 50px;
    display: block;
    width: 92px;
    color: #4a4a4a;
}

.box-fl {
    transition: width .2s;
    -ms-flex-order: 1;
    -webkit-order: 1;
    -webkit-box-ordinal-group: 2;
    order: 1;
}
.fields-container .f-input.invalid, .fields-container .f-input.invalid:hover {
    border-color: #fd6161;
}
.fields-container .f-input {
    position: relative;
    height: 50px;
    padding: 0 20px;
    -webkit-transition: all .2s;
    transition: all .2s;
    color: #4a4a4a;
    border: 1px solid #e9eaeb;
    border-radius: 2px;
    background: #f5f5f5;
}
.fields-container .large {
    width: 100%;
}

.best-tip{
    font-size: 14px;
    line-height: 20px;
    height: 20px;
    margin: 8px 0 0;
    color: #898989;
}
.fields-container .f-tip {
    font-size: 14px;
    line-height: 30px;
    height: 30px;
    margin: -30px 0 0 92px;
    color: #ff525a;
}

input[type=radio]:checked+.f-radio {
    color: #49ab4f;
}

.f-radio {
    font-size: 0;
    margin: 0 23px 0 0;
    cursor: pointer;
    -webkit-transition: color .2s;
    transition: color .2s;
    text-align: center;
    color: #898989;
}

input[type=radio]:checked+.f-radio .type-bg {
    background-color: #f0fdf1;
    -webkit-box-shadow: inset 0 0 0 2px #49ab4f;
    box-shadow: inset 0 0 0 2px #49ab4f;
}

.type-bg {
    width: 80px;
    height: 80px;
    margin: 0 0 13px;
    -webkit-transition: background .2s,-webkit-box-shadow .2s;
    transition: background .2s,-webkit-box-shadow .2s;
    transition: background .2s,box-shadow .2s;
    transition: background .2s,box-shadow .2s,-webkit-box-shadow .2s;
    border-radius: 2px;
    background-color: #f7f7f7;
    background-repeat: no-repeat;
    background-position: center;
    -webkit-box-shadow: inset 0 0 0 1px #ebebeb;
    box-shadow: inset 0 0 0 1px #ebebeb;
}

.type-bg.bg1 {
    background-image: url(${pageContext.request.contextPath}/svg/ask-t1.svg);
}
.type-bg.bg2 {
    background-image: url(${pageContext.request.contextPath}/svg/ask-t2.svg);
}
.type-bg.bg3 {
    background-image: url(${pageContext.request.contextPath}/svg/ask-t3.svg);
}
.type-bg.bg100 {
    background-image: url(${pageContext.request.contextPath}/svg/ask-t100.svg);
}
.type-bg.bg4 {
    background-image: url(${pageContext.request.contextPath}/svg/ask-t4.svg);
}

.f-radio .type-txt {
    font-size: 14px;
    height: 20px;
}

.opt-add-soft {
    font-size: 14px;
    line-height: 40px;
    width: 82px;
    height: 40px;
    margin: 0 15px;
    padding: 0;
    cursor: pointer;
    text-align: center;
    color: #fff;
    border-radius: 2px;
    background: #49ab4f;
}

.add-soft-desc {
    margin: 0;
    font-size: 14px;
    line-height: 20px;
    color: #898989;
}

.input-help-tip {
    font-size: 14px;
    line-height: 20px;
    margin: -20px 0 20px 92px;
    color: #898989;
}

.tags-wrapper {
    margin: -20px 0 20px;
}
.fields-container .no-f-label {
    padding-left: 92px;
}

.box.column {
    flex-direction: column;
    -ms-flex-direction: column;
    -webkit-flex-direction: column;
    -moz-box-direction: normal;
    -webkit-box-direction: normal;
}

.box.column, .box.column-reverse {
    -moz-box-orient: vertical;
    -webkit-box-orient: vertical;
}

.editor-desc {
    margin: 0 0 6px;
    font-size: 14px;
    line-height: 20px;
    color: #898989;
}

.ask-editor{
	width: 100%;
    height: 178px;
    resize: none;
    border: 1px solid #898989;
    border-radius: 2px;
}

.vc-wrapper {
    position: relative;
    width: 50%;
    margin: 0 15px 0 0;
}

.vc-wrapper #f_vcode {
    padding: 0 164px 0 20px;
}

.fields-container .large {
    width: 100%;
}

.vc-wrapper #img-vcode {
    position: absolute;
    z-index: 10;
    top: 1px;
    right: 1px;
    width: auto;
    max-width: 200%;
    height: 48px;
    cursor: pointer;
    background: #ddd;
}

.refreshvc {
    font-size: 14px;
    line-height: 20px;
    height: 20px;
    cursor: pointer;
    color: #57b661;
}

.fields-container .no-f-label {
    padding-left: 92px;
}

.bn-publish:disabled {
    color: #111;
    background: #e9eaeb;
}

.bn-publish {
    font-size: 14px;
    line-height: 40px;
    width: 82px;
    height: 40px;
    padding: 0;
    cursor: pointer;
    text-align: center;
    color: #fff;
    border-radius: 2px;
    background: #49ab4f;
}

.aside-container {
    font-size: 0;
    width: 339px;
    height: 272px;
    margin: 0 0 0 31px;
    padding: 0 24px;
    color: #fff;
    background: url(${pageContext.request.contextPath}/svg/tip.svg) center no-repeat #00e19d;
    background-size: cover;
}

.box-fr {
    transition: width .2s;
    -ms-flex-order: 3;
    -webkit-order: 3;
    -webkit-box-ordinal-group: 4;
    order: 3;
}

.box-fl, .box-fr {
    -webkit-transition: width .2s;
}

.aside-container h2 {
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
    height: 24px;
    margin: 15px 0 17px;
}

.aside-container ol {
    font-size: 14px;
    margin: 0;
    padding: 0 0 0 26px;
    list-style: none;
    counter-reset: li;
    white-space: nowrap;
}

.aside-container ol li {
    line-height: 18px;
    position: relative;
    margin: 9px 0 0;
}

.aside-container ol li:before {
    font-size: 12px;
    position: absolute;
    left: -26px;
    display: block;
    width: 18px;
    height: 18px;
    content: counter(li);
    counter-increment: li;
    text-align: center;
    color: #528fcc;
    border-radius: 50%;
    background: #fff;
}

.footer {
    width: 100%;
    background: #f8f8f8;
}


.box-fr {
    transition: width .2s;
    -ms-flex-order: 3;
    -webkit-order: 3;
    -webkit-box-ordinal-group: 4;
    order: 3;
}

.sec-search {
    position: relative;
    margin: 0;
}

.sec-search .search-text {
    font-size: .875rem;
    width: 280px;
    height: 30px;
    padding: 0 50px 0 14px;
    -webkit-transition: -webkit-box-shadow .2s;
    transition: -webkit-box-shadow .2s;
    transition: box-shadow .2s;
    transition: box-shadow .2s,-webkit-box-shadow .2s;
    color: #111;
    border: none;
    border-radius: 1.5em;
    outline: 0;
    background: rgba(255,255,255,.6);
    -webkit-box-shadow: inset 0 0 0 1px rgba(0,0,0,.1);
    box-shadow: inset 0 0 0 1px rgba(0,0,0,.1);
}

.sec-search .ic-search {
    position: absolute;
    top: 0;
    right: 0;
    width: 40px;
    height: 30px;
    padding: 0;
    cursor: pointer;
    -webkit-transition: background .2s;
    transition: background .2s;
    border: none;
    border-top-right-radius: 1em;
    border-bottom-right-radius: 1em;
    outline: 0;
    background: url(${pageContext.request.contextPath}/images/ic_search.svg) center center no-repeat;
    background-size: 16px 16px;
}

.clear:after {
    font-size: 0;
    display: block;
    visibility: hidden;
    clear: both;
    width: 0;
    height: 0;
    content: '.';
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

</style>

<%@ include file="header.jspf" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
</head>

<body>

    <%@ include file="nav.jspf" %>
    <!-- 内容区 -->
    <div>
    	<div class="question-banner">
    		<div class="banner-box box vertical">
    			<div class="box vertical box-aw">
    				<a class="question-link" href="${pageContext.request.contextPath}/question">
		    				<label class="lfont" style="cursor: pointer;">开源</label>
		    				<label class="rfont" style="cursor: pointer;">问答</label>
	    			</a>
    				<a class="sec-link hor-line" href="#">我的发帖</a>
    				<a class="sec-link" href="${pageContext.request.contextPath}/ask">我要提问</a>
    			</div>
    			<div class="box-fr">
    				<form class="clear sec-search">
    					<input type="text" class="search-text" placeholder="在 43416 款开源软件中搜索" name="q">
    					<input type="hidden" name="scope" value="bbs">
    					<button type="submit" class="ic-search box vertical"></button>
    				</form>
    			</div>
    		</div>
    	</div>
    	
    	<div class="sc-container" style="width: 1200px;">
    		<div class="box main-container" style="height: 1080px;">
    			<div class="box-aw form-question" style="width: 100%;max-width: 770px;">
    				<form id="v-askForm" class="fields-container" method="post">
    					
    					<div class="box-aw vertical sub-nav">
    						<a href="${pageContext.request.contextPath}/question">问答</a>&nbsp;>&nbsp;<a href="javascript:void(0);">我要提问</a>
    					</div>
    					<div class="box field-row auto-height">
    						<label class="box-fl text-base f-label">标题</label>
    						<div class="box-aw">
    							<input type="text" name="subject" class="f-input large dirty invalid touched" placeholder="你有什么技术问题，请在此处输入" tabindex="1" />
    							<div class="best-tip">
    								红薯：<a href="#">什么样的问题在OSC算一个好问题？</a>
    							</div>
    							
    						</div>
    					</div>
    					<p class="f-tip">标题不能为空!</p>
    					
    					<div class="box field-row auto-height">
    						<label class="box-fl text-base f-label">分类</label>
    						<div class="box vertical box-aw catalog">
    							<input type="radio" name="catalog" id="t1" value="1" checked="checked"
    							style="display: none;" bind="1">
    							<label for="t1" class="f-radio" title="问技术相关问题">
    								<div class="type-bg bg1"></div>
    								<div class="type-txt">技术问答</div>
    							</label>
    							<input type="radio" name="catalog" id="t2" value="2"
    							style="display: none;" bind="1">
    							<label for="t2" class="f-radio" title="分享你的技术心得">
    								<div class="type-bg bg2"></div>
    								<div class="type-txt">技术分享</div>
    							</label>
    							<input type="radio" name="catalog" id="t3" value="3"
    							style="display: none;" bind="1">
    							<label for="t3" class="f-radio" title="非技术问题请选择这里">
    								<div class="type-bg bg3"></div>
    								<div class="type-txt">IT大杂烩</div>
    							</label>
    							<input type="radio" name="catalog" id="t100" value="100"
    							style="display: none;" bind="1">
    							<label for="t100" class="f-radio" title="发布个人求职和职业信息">
    								<div class="type-bg bg100"></div>
    								<div class="type-txt">职业生涯</div>
    							</label>
    							<input type="radio" name="catalog" id="t4" value="4"
    							style="display: none;" bind="1">
    							<label for="t4" class="f-radio" title="网站Bug报告、站务">
    								<div class="type-bg bg4"></div>
    								<div class="type-txt">站务/建议</div>
    							</label>
    							
    						</div>
    					
    					</div>
    					
    					
    					<div class="box field-row auto-height">
    						<label class="box-fl text-base f-label">软件</label>
    						<div class="box vertical box-aw">
    							<input type="text" id="relatedProject" name="relatedProject" class="f-input ac_input"
    							tabindex="3" bind autocomplete="off">
    							<input type="button" class="opt-add-soft" value="添加">
    							<p class="add-soft-desc">准确的关联开源软件<br>可以让更多专家看到这个问题（最多5个）</p>
    						</div>
    					</div>
    					
    					<div class="input-help-tip">
    						输入软件名首字母，例如Ubuntu的u字，将会出现软件列表
    					</div>
    					<script type="text/javascript" defer="defer">
    						
    					</script>
    					
    					 <div class="box vertical wrap tags-wrapper field-row auto-height no-f-label">
    					 </div>
    					 
    					 <div class="box field-row auto-height">
    					 	<label class="box-fl text-base f-label">描述</label>
    					 	<div class="box column box-aw">
    					 		<p class="editor-desc">请对问题进行详细描述：如软件运行环境、详细错误信息等。</p>
    					 		<div class="askEdit-main" style="width: 700px;margin: auto; border-color: #fd6161;">
    					 			<textarea id="askEditor" name="askEditor" tabindex="4" bind style="visibility:hidden;width:99.9%;display: none;" class="ckeditor .ask-editor">
									</textarea>
									<script type="text/javascript">
  										var editor=CKEDITOR.replace('askEditor',{customConfig:"askConfig.js"});
  									</script>
  								</div>
    					 	</div>
    					 </div>
    					 <p class="f-tip">描述内容不能为空！</p>
    					 
    					 <div class="box field-row auto-height">
    					 	<label class="box-fl text-base f-label">验证码</label>
    					 	<div class="box vertical box-aw">
    					 		<div class="vc-wrapper">
    					 			<input class="f-input large touched dirty invalid" id="f_vcode" type="text"
    					 			name="verifyCode" bind />
    					 			<img id="img-vcode" align="absmiddle" src="#" title="点击我刷新验证码" onclick="javascript:_rvi()">
    					 		</div>
    					 		<a onclick="javascript:_rvi()" class="refreshvc">刷新验证码</a>
    					 	</div>
    					 </div>
    					 <p class="f-tip">请输入验证码！</p>
    					 
    					 <div class="f-btn-wrapper box vertical no-f-label">
    					 	<input class="f-btn bn-publish" type="button" value="发表问题" id="submit-question-btn" disabled>
    					 </div>
    				</form>
    			</div>
    			
    			<div class="box-fr aside-container question-tip">
    				<h2>提问和发帖必读</h2>
    				<ol>
    					<li>跟技术无关的问题请不要在此发布</li>
    					<li><a href="#">上传真实头像</a>，可使问题获更好排位</li>
    					<li>模糊或过于简单的标题会被降低排位</li>
    					<li>提问1小时后且有人回答即不允许修改和删除</li>
    					<li>请勿在此处发布招聘信息，<a href="#">我要招聘</a> </li>
    					<li>请勿在此处发布活动信息，<a href="#">我要发布活动</a> </li>
    				</ol>
    			</div>
    			
    		</div>
    		
    		
    		<div class=".footer" style="height: 96px;">
    			
    		</div>
    		
    		
    	</div>
    
    </div>
    
</body>
</html>