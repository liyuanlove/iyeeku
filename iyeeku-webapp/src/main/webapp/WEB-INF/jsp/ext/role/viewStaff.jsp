<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/10
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>角色用户信息</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/boot.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/scripts/miniui/themes/pure/skin.css">
</head>
<body>
<input id="jsbh" name="jsbh" class="mini-hidden">
<div class="mini-fit">
    <div id="datagrid1" datafld="data" class="mini-datagrid" style="width:100%;height:100%;" borderStyle="border:0"
         url="${pageContext.request.contextPath}/role/listStaff" sortMode="client" pageSize="10"
    >
        <div property="columns">
            <div type="indexcolumn" width="30" headerAlign="center">序号</div>
            <div field="yhmc" width="100" headerAlign="center" allowSort="true">员工名称</div>
            <div field="ssjgmc" width="240" headerAlign="center" allowSort="true" renderer="ssjgmcRenderer">所属机构名称</div>
            <div field="notesid" width="100" headerAlign="center" allowSort="true">NotesID</div>
        </div>
    </div>
</div>

<div class="mini-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
    <a class="mini-button" style="width:60px;" id="btnOk" onclick="onOk()">确定</a>
    <span style="display:inline-block;width:25px;"></span>
    <a class="mini-button" style="width:60px;" onclick="onCancel()">取消</a>
</div>
</body>
<script type="text/javascript">
    mini.parse();

    var grid = mini.get("datagrid1");

    function SetData(data) {
        grid.load({jsbh:data.jsbh});
    }

    function ssjgmcRenderer(e) {
        if(e.value == "" || e.value == null) return "暂无归属部门";
    }

    function onCancel(e) {
        CloseWindow("cancel");
    }

    function CloseWindow(action) {
        if (action == "close" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow)
            return window.CloseOwnerWindow(action);
        else window.close();
    }

</script>

</html>
