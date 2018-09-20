<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/20
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>错误信息展示页面</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/boot.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/scripts/miniui/themes/pure/skin.css">
</head>
<body>
<div class="mini-panel-body" style="overflow: hidden;">
    <div class="mini-messagebox-centent">
        <table class="mini-messagebox-table" id="messagebox" style="width: 100%;" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td align="right" style="padding-right: 5px;" width="320">错误信息：</td>
                    <td align="left" id="messagecontent" class="mini-messagebox-content-text" width="378"></td>
                </tr>
            </tbody>
        </table>
        <div class="mini-messagebox-buttons">
            <a class="mini-button" id="okBtn">展开详情</a>
        </div>
        <div id="detailStackRow" style="display:block ;overflow: auto;border: 1px solid #E3E6E8;height: 240px;"></div>
    </div>
</div>
</body>
<script type="text/javascript">
    mini.parse();

    function SetData(data) {
        var errMsg = data.errMsg;
        if (errMsg != null && errMsg.length > 42){
            errMsg = errMsg.substring(0,42) + "...";
        }
        $("#messagecontent").text(errMsg);
        $("#detailStackRow").text(data.errStack);
    }

</script>
</html>
