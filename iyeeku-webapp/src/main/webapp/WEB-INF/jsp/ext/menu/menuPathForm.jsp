<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/10
  Time: 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/boot.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/scripts/miniui/themes/pure/skin.css">
</head>
<body>
<div style="width: 100%;">
    <div class="mini-toolbar" style="border-bottom: 0;padding:0px;" borderStyle="border:0px">
        <table style="width:100%;">
            <tr>
                <td style="white-space:nowrap;">
                    <input id="key" class="mini-textbox" emptyText="请输入条目编号或条目值" style="width:200px;" maxlength="256" onenter="onKeyEnter"/>
                    <a class="mini-button" onclick="search()">查询</a>
                </td>
            </tr>
        </table>
    </div>

        <div id="datagrid1" datafld="data" class="mini-datagrid" style="width:100%;height:350px;" borderStyle="border-left:0;border-right:0;border-bottom:0;" allowResize="true" multiSelect="false"
             url="${pageContext.request.contextPath}/menu/findNotMenuUrl" showPager="false" allowUnselect="false" sortMode="client" editNextOnEnterKey="true"
             onrowdblclick="" onselectionchanged=""
        >
            <div property="columns">
                <div type="indexcolumn" width="50" headerAlign="center">序号</div>
                <div field="urlbh" width="50" visible="false">URL编号</div>
                <div field="urllj" width="120" allowSort="true">URL路径</div>
                <div field="urlms" width="120" allowSort="true">URL描述</div>
            </div>
        </div>

    <div class="mini-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
        <a class="mini-button" style="width:60px;" id="btnOk" onclick="onOk()">确定</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="mini-button" style="width:60px;" onclick="onCancel()">取消</a>
    </div>

</div>

</body>

<script type="text/javascript">
    mini.parse();

    var grid = mini.get("datagrid1");
    grid.load();

    function search() {
        var key = mini.get("key").getValue();
        grid.load({ key : key});
        mini.get("btnOk").disable();
    }
    
    function getData() {
        var row = grid.getSelected();
        return row;
    }
    
    function onOk() {
        CloseWindow(getData());
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
