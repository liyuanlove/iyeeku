<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/13
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/tag_res.jsp"%>
<html>
<head>
    <sec:csrfMetaTags/>
    <title>查看用户角色</title>
    <%@ include file="../../common/jscss_res.jsp"%>
</head>
<body>
    <input id="yhbh" name="yhbh" class="mini-hidden">
    <div class="mini-fit">
        <div id="datagrid1" datafld="data" class="mini-datagrid" style="width:100%;height:100%;" borderStyle="border:0"
             url="${pageContext.request.contextPath}/staff/listRole" sortMode="client" pageSize="10"
        >
            <div property="columns">
                <div type="indexcolumn" width="30" headerAlign="center">序号</div>
                <div field="jsmc" width="100" headerAlign="center" allowSort="true">角色名称</div>
                <div field="jsms" width="140" headerAlign="center" allowSort="true">角色描述</div>
            </div>
        </div>
    </div>

    <div class="mini-toolbar" style="text-align:center;padding-top:10px;padding-bottom:10px;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
        <a class="mini-button" style="width:60px;" onclick="onCancel()">取消</a>
    </div>
</body>

<script type="text/javascript">
    mini.parse();

    var grid = mini.get("datagrid1");

    function SetData(data) {
        var data = mini.clone(data);
        grid.load({yhbh:data.yhbh});
    }

</script>

</html>
