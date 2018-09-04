<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/4
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息管理主页面</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/boot.js"></script>
</head>
<body>

<div id="layout1" class="mini-layout" style="width: 99.8%;height: 99.7%;" borderStyle="border-right:1px #aaa solid;">

    <div title="高级查询" region="east" showCloseButton="false" width="250" showSplitIcon="false"
    showCollapseButton="false">
        <form id="form1" method="post">

        </form>
    </div>

    <div title="center" region="center" style="border: 0px;">
        <div class="mini-toolbar" style="border-bottom: 0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        <a class="mini-button" iconCls="icon-addnew" id="addBtn" onclick="add()">新增</a>
                        <a class="mini-button" iconCls="icon-edit"id="editBtn" onclick="edit()">编辑</a>
                        <a class="mini-button" iconCls="icon-remove" id="removeBtn" onclick="remove()">删除</a>
                        <a class="mini-button" iconCls="icon-close" id="cancel_removeBtn" onclick="cancelRemove()" visible="false">删除</a>
                        <a class="mini-button" iconCls="icon-ok" id="confirm_removeBtn" onclick="confirmRemove()" visible="false">删除</a>
                        <span class="separator"></span>
                        <a class="mini-button" iconCls="icon-goto" id="viewRoleBtn" onclick="add()">查看角色</a>
                        <a class="mini-button" iconCls="icon-addnew"id="addRoleBtn" onclick="edit()">分配角色</a>
                        <a class="mini-button" iconCls="icon-remove" id="removeRoleBtn" onclick="remove()">删除角色</a>
                    </td>
                    <td style="white-space:nowrap;">
                        <input id="key" class="mini-textbox" emptyText="请输入用户名称" style="width:150px;" onenter="search()" maxlength="64"/>
                        <a class="mini-button" iconCls="icon-search" onclick="search()">查询</a>
                        <a id="advancedSearchBtn" class="mini-button" oncheckedchanged="showHeader()" checkOnClick="true">高级查询</a>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100%;" colspan="2">
                        <a class="mini-button" iconCls="icon-addnew" id="stateManageBtn" onclick="add()">状态管理</a>
                        <a class="mini-button" iconCls="icon-edit"id="cancelManageBtn" onclick="edit()">编辑</a>
                        <a class="mini-button" iconCls="icon-remove" id="lockBtn" onclick="remove()">锁定用户</a>
                    </td>
                </tr>
            </table>
        </div>

        <div class="mini-fit">
            <div id="datagrid_staff" datafld="data" class="mini-datagrid" style="width:100%;height:100%;" borderStyle="border:0px" allowResize="true" multiSelect="false"
                 url="${pageContext.request.contextPath}/staff/findAllInfos" onrowclick="" onload="" allowUnselect="false" sortMode="client"
                 allowResize="true"
                 pageSize="10"
            >
                <div property="columns">
                    <div type="checkcolumn"></div>
                    <div type="indexcolumn" width="50" headerAlign="center">序号</div>
                    <div field="yhbh" width="50" headerAlign="center" allowSort="false" visible="false">员工编号</div>
                    <div field="yhmc" width="100" headerAlign="center" autoEscape="true" allowSort="true">员工名称</div>
                    <div field="yhdlm" width="120" headerAlign="center" autoEscape="true" allowSort="true">员工登录名</div>
                    <div field="ssjgbh" width="120" headerAlign="center" allowSort="true">所属机构名称</div>
                    <div field="notesid" width="60" headerAlign="center" allowSort="true">notesid</div>
                    <div field="zt" width="100" headerAlign="center" allowSort="true">员工状态</div>
                    <div field="sdsj" width="120" headerAlign="center" allowSort="true">锁定时间</div>
                </div>
            </div>
        </div>

    </div>

</div>

<script type="text/javascript">
    mini.parse();

    var grid = mini.get("datagrid_staff");
    var form = new mini.Form("#form1");

    grid.load();

    var layout1 = mini.get("layout1");
    hideHeader();

    function hideHeader() {
        layout1.updateRegion("east",{visible:false});
    }

    function showHeader() {
        if(layout1.getRegion("east").visible == true){
            layout1.updateRegion("east",{visible:false});
            mini.get("advancedSearchBtn").setText("高级查询");
        }else {
            layout1.updateRegion("east",{visible:true});
            mini.get("advancedSearchBtn").setText("关闭查询");
        }
    }

    function add() {
        mini.open({
            // targetWindow: window,
            url: "${pageContext.request.contextPath}/staff/form1",
            title: "新增员工", width: 600, height: 530,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = { action: "new" };
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
                if( action == "ok") {
                    showTips("员工添加成功","success");
                    grid.reload();
                }
            }
        });
    }

    function showTips(Msg,state) {
        var x = "center";
        var y = "top";
        var state = state;
        mini.showTips({
            content: "<b>成功</b> <br/>"+Msg,
            state: state,
            x: x,
            y: y,
            timeout: 3000
        });
    }


</script>

</body>
</html>
