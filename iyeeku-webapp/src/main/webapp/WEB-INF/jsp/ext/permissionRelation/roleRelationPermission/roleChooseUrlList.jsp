<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/19
  Time: 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../common/tag_res.jsp"%>
<html>
<head>
    <sec:csrfMetaTags/>
    <title>角色分配URL选择页面</title>
    <%@ include file="../../../common/jscss_res.jsp"%>
</head>
<body>
    <div class="mini-fit" borderStyle="border:0;">
        <input id="jsbh" name="jsbh" class="mini-hidden">
        <input id="cdurl" name="cdurl" class="mini-hidden">
        <input id="cdbh" name="cdbh" class="mini-hidden">
            <div class="mini-toolbar" style="border: 0;padding: 0px;">
                <table style="width: 100%">
                    <tr>
                        <td style="white-space: nowrap">
                            <input id="key" class="mini-textbox" emptyText="请输入URL路径" onenter="" maxlength="256" style="width: 150px;">
                            <a class="mini-button" iconCls="icon-search" id="searchBtn" onclick="search()">搜索</a>
                        </td>
                    </tr>
                </table>
            </div>

            <div id="datagrid1" datafld="data" class="mini-datagrid" style="width:100%;height: 90%;" borderStyle="border-left:0;border-bottom:0;border-right:0;"
                 sortMode="client" url="${pageContext.request.contextPath}/roleRelationPer/listSSmkUrl" multiSelect="true"
                 onselectionchanged="onSelectionChanged" showPager="false"
            >
                <div property="columns">
                    <div type="checkcolumn" name="select"></div>
                    <div type="indexcolumn" width="30" headerAlign="center">序号</div>
                    <div field="urlbh" headerAlign="center" visible="false">URL编号</div>
                    <div field="urllj" width="120" allowSort="true">URL路径</div>
                    <div field="urlms" width="120" allowSort="true">URL描述</div>
                </div>
            </div>
    </div>

    <div class="mini-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
        <a class="mini-button" iconCls="icon-cancel" onclick="onCancel()">取消</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="mini-button" iconCls="icon-ok" id="btnOk" onclick="onOk()" enabled="false">确定</a>
    </div>

</body>
<script type="text/javascript">
    mini.parse();

</script>


</html>
