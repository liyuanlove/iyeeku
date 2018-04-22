<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图片裁剪测试</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.Jcrop.css" />
<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.Jcrop.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	
	$('#element_id').Jcrop({
		  allowSelect: false,
		  baseClass: 'jcrop',
		  boxWidth : 500,
		  boxHeight : 500 ,
		  setSelect : [100,100,300,300],
		  createHandles : ['se'],
		  maxSize : [200 , 200],
		  aspectRatio:1
		}, function() {
		  jcropApi = this;
	});
	
})

</script>
</head>

<body>
	<img id="element_id" alt="" src="${pageContext.request.contextPath}/images/pool.jpg">
</body>



</html>