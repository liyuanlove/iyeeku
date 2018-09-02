<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>角色列表</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/boot.js"></script>

</head>

<body>
<div style="width: 100%;">
    <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
            <tr>
                <td style="width:100%;">
                    <a class="mini-button" iconCls="icon-add" onclick="add()">增加</a>
                    <a class="mini-button" iconCls="icon-add" onclick="edit()">编辑</a>
                    <a class="mini-button" iconCls="icon-remove" onclick="remove()">删除</a>
                </td>
                <td style="white-space:nowrap;">
                    <input id="key" class="mini-textbox" emptyText="请输入姓名" style="width:150px;" onenter="onKeyEnter"/>
                    <a class="mini-button" onclick="search()">查询</a>
                </td>
            </tr>
        </table>
    </div>
</div>
<div id="datagrid1" class="mini-datagrid" style="width:100%;height:100%;" allowResize="true"
     url="${pageContext.request.contextPath}/role/findAllRoleInfos"  idField="id" multiSelect="true"
>
    <div property="columns">
        <div type="checkcolumn"></div>
        <div type="indexcolumn"></div>
        <div field="jsmc" width="120" headerAlign="center" allowSort="false">角色名称</div>
        <div field="jslx" width="120" headerAlign="center" allowSort="false">角色类型</div>
        <div field="jszt" width="120" headerAlign="center" allowSort="false">角色状态</div>
        <div field="jsms" width="120" headerAlign="center" allowSort="false">角色描述</div>
    </div>
</div>


<script type="text/javascript">
    mini.parse();

    var grid = mini.get("datagrid1");
    grid.load();

    var menu = new ColumnsMenu(grid);

    function add() {

        mini.open({
            targetWindow: window,
            //url: bootPATH + "roleForm",
            url: "${pageContext.request.contextPath}/role/roleForm",
            title: "新增角色", width: 600, height: 400,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = { action: "new" };
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
                grid.reload();
            }
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
            if (confirm("确定删除选中记录？")) {
                var ids = [];
                for (var i = 0, l = rows.length; i < l; i++) {
                    var r = rows[i];
                    ids.push(r.id);
                }
                var id = ids.join(',');
                grid.loading("操作中，请稍后......");
                $.ajax({
                    url: "../data/AjaxService.aspx?method=RemoveEmployees&id=" +id,
                    success: function (text) {
                        grid.reload();
                    },
                    error: function () {
                    }
                });
            }
        } else {
            alert("请选中一条记录");
        }
    }
    function search() {
        var key = mini.get("key").getValue();
        grid.load({ key: key });
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
