<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/5
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>菜单配置页面</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/boot.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/scripts/miniui/themes/pure/skin.css">
</head>
<body>

<!-- 左右布局方式 -->
<div class="mini-splitter" style="width:100%;height:100%;" borderStyle="border:0px">
    <!-- 左侧:菜单树 -->
    <div size="20%" showCollapseButton="false" expanded="true" style="padding:0px;border-right: 0;">
        <div class="mini-panel" title="菜单树" iconCls="" style="width: 100%;height: 100%;" showToolbar="false" showCloseButton="false">

            <ul id="tree1" class="mini-tree" style="width: 100%;height: 100%;padding: 5px;"
             url="${pageContext.request.contextPath}/menu/findAllMenu"
             showTreeIcon="true" textField="text" idField="id" parentField="pid" dataField="treeNodes"
             resultAsTree="false" onondeselect="" autoCheckParent="true" expandOnLoad="true">
            </ul>

        </div>
    </div>
    <!-- 右侧:菜单详情 -->
    <div size="80%" showCollapseButton="false" expanded="true" style="padding:0px;border-left: 0;">
        <div class="mini-panel" title="菜单信息" iconCls="" style="width: 100%;height: 100%;"
             showToolbar="true" showFooter="false" showCloseButton="false">
            <div property="toolbar" style="height: 30px;">
                <table style="width: 100%;">
                    <tr>
                        <td style="width:100%;">
                            <a class="mini-button" iconCls="icon-addnew" onclick="add()">新增</a>
                            <a class="mini-button" iconCls="icon-edit" onclick="edit()" enabled="false" id="menuEdit">修改</a>
                            <a class="mini-button" iconCls="icon-remove" onclick="remove()" enabled="false" id="menuRemove">删除</a>
                        </td>
                        <td style="white-space:nowrap;">
                            <a class="mini-button" onclick="search()">刷新URL</a>
                        </td>
                    </tr>

                </table>
            </div>

            <table style="width: 100%;height: 30%;">
                <tr>


                </tr>
            </table>


        </div>
    </div>


</div>

</body>
</html>
