<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>角色列表</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/boot.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/scripts/miniui/themes/pure/skin.css">
</head>

<body>

<div id="layout1" class="mini-layout" style="width: 99.8%;height: 99.7%;" borderStyle="border-right:1px #aaa solid;">
    <div title="高级查询" region="east" showCloseButton="false" width="250" showSplitIcon="false"
         showCollapseButton="false">
        <form id="form1" method="post">
            <table border="0" cellpadding="1" cellspacing="2">
                <colgroup>
                    <col width="40%">
                    <col width="60%">
                </colgroup>
                <tr>
                    <td>角色名称：</td>
                    <td>
                        <input name="jsmc" id="jsmc" class="mini-textbox" width="120px" maxlength="64">
                    </td>
                </tr>
                <tr>
                    <td>角色类型：</td>
                    <td>
                        <input name="jslx" id="jslx" class="mini-combobox" width="120px"
                               textField="text" valueField="id"  url="/directory/loadDict1/roleType">
                    </td>
                </tr>
                <tr>
                    <td>角色状态：</td>
                    <td>
                        <input name="jszt" id="jszt" class="mini-combobox" width="120px"
                               textField="text" valueField="id"  url="/directory/loadDict1/roleState">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <a class="mini-button" iconCls="icon-search" id="addBtn" onclick="">查询</a>
                        <a class="mini-button" iconCls="icon-reload" id="resetBtn" onclick="">重置</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <div title="center" region="center" style="border: 0px;">
        <div class="mini-toolbar" style="border-bottom:0;padding:2px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        <a class="mini-button" iconCls="icon-add" onclick="add()">增加</a>
                        <a class="mini-button" iconCls="icon-add" onclick="edit()">编辑</a>
                        <a class="mini-button" iconCls="icon-remove" onclick="remove()">删除</a>
                        <span class="separator"></span>
                        <a class="mini-button" iconCls="icon-goto" id="viewStaffBtn" onclick="viewStaff()">查看用户</a>
                        <a class="mini-button" iconCls="icon-addnew"id="addStaffBtn" onclick="edit()">分配用户</a>
                        <a class="mini-button" iconCls="icon-remove" id="removeStaffBtn" onclick="remove()">删除用户</a>
                    </td>
                    <td style="white-space:nowrap;">
                        <input id="key" class="mini-textbox" emptyText="请输入角色名" style="width:150px;" onenter="onKeyEnter"/>
                        <a class="mini-button" onclick="search()">查询</a>
                        <a id="advancedSearchBtn" class="mini-button" oncheckedchanged="showHeader()" checkOnClick="true">高级查询</a>
                    </td>
                </tr>
            </table>
        </div>

        <div class="mini-fit">
            <div id="datagrid1" class="mini-datagrid" style="width:100%;height:100%;" allowResize="true"
                 url="${pageContext.request.contextPath}/role/findAllRoleInfos"  idField="id" multiSelect="true" pageSize="10"
            >
                <div property="columns">
                    <div type="checkcolumn"></div>
                    <div type="indexcolumn"></div>
                    <div field="jsbh" width="120" headerAlign="center" allowSort="false" visible="false">角色编号</div>
                    <div field="jsmc" width="120" headerAlign="center" allowSort="false">角色名称</div>
                    <div field="jslx" width="120" headerAlign="center" allowSort="false" renderer="jslxRenderer">角色类型</div>
                    <div field="jszt" width="120" headerAlign="center" allowSort="false" renderer="jsztRenderer">角色状态</div>
                    <div field="jsms" width="120" headerAlign="center" allowSort="false">角色描述</div>
                </div>
            </div>
        </div>

    </div>
</div>



<script type="text/javascript">
    mini.parse();
    var grid = mini.get("datagrid1");
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
            url: "${pageContext.request.contextPath}/role/roleForm",
            title: "新增角色", width: 540, height: 300,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = { action: "new"};
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
                if( action == "ok") {
                    showTips("角色添加成功","success");
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

    function edit() {
        var row = grid.getSelected();
        if (row) {
            mini.open({
                url: "${pageContext.request.contextPath}/role/roleForm",
                title: "编辑员工", width: 600, height: 400,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "edit", jsbh : row.jsbh};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                    if(action == "ok") {
                        grid.reload();
                        showTips("角色修改成功", "success");
                    }
                }
            });
        } else {
            mini.alert("请先选择一条记录");
        }
    }

    function remove() {

        var rows = grid.getSelecteds();
        if (rows.length > 0) {

            mini.confirm("确定删除记录？", "确定？",
                function (action) {
                    if (action == "ok") {
                        var jsbh = rows[0].jsbh;
                        $.ajax({
                            url: "${pageContext.request.contextPath}/role/delete",
                            type: "post",
                            data: {jsbh:jsbh} ,
                            success: function (text) {
                                showTips("角色删除成功","danger");
                                grid.reload();
                            },
                            error: function () {
                            }
                        });
                    }
                }
            );

        } else {
            mini.alert("请先选择一条记录");
        }
    }

    function viewStaff() {
        var rows = grid.getSelecteds();
        if (rows.length > 0) {
            mini.open({
                url: "${pageContext.request.contextPath}/role/viewStaff",
                title: "用户信息", width: 650, height: 400,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "query", jsbh : row.jsbh};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: null
            });
        }else{
            mini.alert("请先选择一条记录");
        }
    }

    function search() {
        var key = mini.get("key").getValue();
        grid.load({ jsmc: key });
    }

    function onKeyEnter(e) {
        search();
    }

    function onBirthdayRenderer(e) {
        var value = e.value;
        if (value) return mini.formatDate(value, 'yyyy-MM-dd');
        return "";
    }
    function onMarriedRenderer(e) {
        if (e.value == 1) return "是";
        else return "否";
    }

    var roleStates , roleTypes;
    $.getJSON("/directory/loadDict1/roleState",null,function (data) {roleStates = data;})
    $.getJSON("/directory/loadDict1/roleType",null,function (data) {roleTypes = data;})

    function jslxRenderer(e) {
        for ( var i = 0 , l = roleTypes.length ; i < l ; i++){
            var v = roleTypes[i];
            if(v.id == e.value) return v.text;
        }
        return "";
    }

    function jsztRenderer(e) {
        for ( var i = 0 , l = roleStates.length ; i < l ; i++){
            var v = roleStates[i];
            if(v.id == e.value) return v.text;
        }
    }


</script>

</body>

</html>
