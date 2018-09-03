<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>角色列表</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/boot.js"></script>
</head>

<body>
<div style="width: 100%;">
    <div class="mini-toolbar" style="border-bottom:0;padding:2px;">
        <table style="width:100%;">
            <tr>
                <td style="width:100%;">
                    <a class="mini-button" iconCls="icon-add" onclick="add()">增加</a>
                    <a class="mini-button" iconCls="icon-add" onclick="edit()">编辑</a>
                    <a class="mini-button" iconCls="icon-remove" onclick="remove()">删除</a>
                </td>
                <td style="white-space:nowrap;">
                    <input id="jsmc" class="mini-textbox" emptyText="请输入角色名" style="width:150px;" onenter="onKeyEnter"/>
                    <a class="mini-button" onclick="search()">查询</a>
                </td>
            </tr>
        </table>
    </div>
</div>

<!--撑满页面-->
<div class="mini-fit">
<div id="datagrid1" class="mini-datagrid" style="width:100%;height:100%;" allowResize="true"
     url="${pageContext.request.contextPath}/role/findAllRoleInfos"  idField="id" multiSelect="true"
     pageSize="10"
>
    <div property="columns">
        <div type="checkcolumn"></div>
        <div type="indexcolumn"></div>
        <div field="jsbh" width="120" headerAlign="center" allowSort="false" visible="false">角色编号</div>
        <div field="jsmc" width="120" headerAlign="center" allowSort="false">角色名称</div>
        <div field="jslx" width="120" headerAlign="center" allowSort="false">角色类型</div>
        <div field="jszt" width="120" headerAlign="center" allowSort="false">角色状态</div>
        <div field="jsms" width="120" headerAlign="center" allowSort="false">角色描述</div>
    </div>
</div>
</div>

<script type="text/javascript">
    mini.parse();

    var grid = mini.get("datagrid1");
    grid.load();

    //var menu = new ColumnsMenu(grid);

    function add() {

        mini.open({
            targetWindow: window,
            //url: bootPATH + "roleForm",
            url: "${pageContext.request.contextPath}/role/roleForm",
            title: "新增角色", width: 540, height: 300,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = { action: "new" };
               // iframe.contentWindow.SetData(data);
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
                url: bootPATH + "../demo/CommonLibs/EmployeeWindow.html",
                title: "编辑员工", width: 600, height: 400,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "edit", id: row.id };
                    iframe.contentWindow.SetData(data);

                },
                ondestroy: function (action) {
                    //var iframe = this.getIFrameEl();

                    grid.reload();

                }
            });

        } else {
            alert("请选中一条记录");
        }

    }
    function remove() {

        var rows = grid.getSelecteds();
        if (rows.length > 0) {

            mini.confirm("确定删除记录？", "确定？",
                function (action) {
                    if (action == "ok") {

                        var jsbh = rows[0].jsbh;
                        grid.loading("操作中，请稍后......");
                        $.ajax({
                            url: "${pageContext.request.contextPath}/role/delete",
                            type: "post",
                            data: {jsbh:jsbh} ,
                            success: function (text) {
                                if(text == "ok") {
                                    //mini.alert("记录已删除！");
                                    showTips("角色删除成功","danger");
                                    grid.reload();
                                }
                            },
                            error: function () {

                            }
                        });
                    }
                }
            );

        } else {
            alert("请选中一条记录");
        }
    }
    function search() {
        var jsmc = mini.get("jsmc").getValue();
        grid.load({ jsmc: jsmc });
    }
    function onKeyEnter(e) {
        search();
    }
    /////////////////////////////////////////////////
    function onBirthdayRenderer(e) {
        var value = e.value;
        if (value) return mini.formatDate(value, 'yyyy-MM-dd');
        return "";
    }
    function onMarriedRenderer(e) {
        if (e.value == 1) return "是";
        else return "否";
    }
    var Genders = [{ id: 1, text: '男' }, { id: 2, text: '女'}];
    function onGenderRenderer(e) {
        for (var i = 0, l = Genders.length; i < l; i++) {
            var g = Genders[i];
            if (g.id == e.value) return g.text;
        }
        return "";
    }





</script>

</body>

</html>
