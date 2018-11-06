<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/7
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/tag_res.jsp"%>
<html>
<head>
    <sec:csrfMetaTags/>
    <title>个人开发日志主页面</title>
    <%@ include file="../../common/jscss_res.jsp"%>
</head>
<body>
<!-- 左右布局方式 -->
<div class="mini-splitter" style="width:100%;height:100%;" borderStyle="border:0px">
    <!-- 最近开发事项简介 -->
    <div size="20%" showCollapseButton="false" expanded="true" style="padding:0px;border-right: 0;">
        <div class="mini-panel" title="最近开发事项简介" iconCls="" style="width: 100%;height: 100%;" showToolbar="false" showCloseButton="false">


        </div>
    </div>

    <!-- 模块开发日志 -->
    <div size="80%" showCollapseButton="false" expanded="true" style="padding:0px;border-left: 0;">
        <div class="mini-panel" title="模块开发日志" iconCls="" style="width: 100%;height: 100%;"
             showToolbar="true" showFooter="false" showCloseButton="false">

        </div>
    </div>

</div>
</body>
</html>
