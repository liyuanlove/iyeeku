<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/13
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/tag_res.jsp"%>
<html>
<head>
    <title>Title</title>
    <sec:csrfMetaTags/>
    <%@ include file="../../common/jscss_res.jsp"%>
</head>
<body>
    <div class="mini-toolbar" style="text-align:left;padding-left: 10px;">
            <input id="yhbh" name="yhbh" class="mini-hidden">
            <input id="jsmc" name="jsmc" width="160" class="mini-textbox" emptyText="请输入角色名称" onenter="" maxlength="64">
            <a class="mini-button" iconCls="icon-search" id="searchBtn" style="margin-right: 10px;" onclick="search()">搜索</a>
    </div>

    <div class="mini-fit">
        <div id="datagrid1" datafld="data" class="mini-datagrid" style="width:100%;height:100%;" borderStyle="border-left:0;border-bottom:0;border-right:0;" sortMode="client"
            url="${pageContext.request.contextPath}/staff/listNotAddedRole" multiSelect="true"
            onselectionchanged="onSelectionChanged" onload="turnPage()" pageSize="10"
        >
            <div property="columns">
                <div type="checkcolumn"></div>
                <div type="indexcolumn" width="30" headerAlign="center">序号</div>
                <div field="jsbh" headerAlign="center" visible="false">角色编号</div>
                <div field="jsmc" width="100" headerAlign="center" allowSort="true">角色名称</div>
                <div field="jsms" width="140" headerAlign="center" allowSort="true">角色描述</div>
            </div>
        </div>
    </div>

    <div class="mini-toolbar" style="text-align:center;padding-top:10px;padding-bottom:10px;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
        <a class="mini-button" style="width:60px;" onclick="onCancel()">取消</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="mini-button" style="width:60px;" id="btnOk" onclick="onOk()" enabled="false">确定</a>
    </div>

</body>

<script type="text/javascript">
    mini.parse();

    var grid = mini.get("datagrid1");

    function SetData(data) {
        //跨页面传递的数据对象，克隆后才可以安全使用
        data = mini.clone(data);
        mini.get("yhbh").setValue(data.yhbh);
        grid.load({yhbh:data.yhbh});
    }

    function turnPage() {
        mini.get("btnOk").disable();
    }

</script>

</html>
