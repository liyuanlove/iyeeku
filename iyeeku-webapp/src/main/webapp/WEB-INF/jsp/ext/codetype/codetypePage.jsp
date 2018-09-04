<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/3
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>码表主页</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/boot.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/scripts/miniui/themes/pure/skin.css">
</head>
<body>
<!-- 左右布局方式 -->
<div class="mini-splitter" style="width:100%;height:100%;" borderStyle="border:0px">
    <!-- 左侧，码表类型列表 -->
    <div size="440" showCollapseButton="true">
        <div class="mini-toolbar" style="border-bottom: 0;padding:0px;" borderStyle="border-right:0px">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        <a class="mini-button" iconCls="icon-addnew" onclick="add()">新增</a>
                        <a class="mini-button" iconCls="icon-edit" onclick="edit()" enabled="false" id="typeEdit">修改</a>
                        <a class="mini-button" iconCls="icon-remove" onclick="remove()" enabled="false" id="typeRemove">删除</a>
                    </td>
                    <td style="white-space:nowrap;">
                        <input id="key1" class="mini-textbox" emptyText="请输入码值类型名称" style="width:150px;" onenter="onKeyEnter"/>
                        <a class="mini-button" onclick="search()">查询</a>
                    </td>
                </tr>
            </table>
        </div>

        <div class="mini-fit">
            <div id="datagrid_codeType" datafld="data" class="mini-datagrid" style="width:100%;height:100%;" borderStyle="border:0px" allowResize="true"
                 url="${pageContext.request.contextPath}/codetype/findAllTypes" multiSelect="false"
                 onselectionchanged="typeList_onSelectionChanged" onrowclick="typeRowClick(this);" onload="resetTypeBtn();" allowUnselect="false" sortMode="client"
                 pageSize="10"
            >
                <div property="columns">
                    <div type="indexcolumn">序号</div>
                    <div field="zj" width="120" headerAlign="center" allowSort="false" visible="false">主键</div>
                    <div field="sjlxbh" width="120" headerAlign="center" autoEscape="true" allowSort="true">码表编号</div>
                    <div field="sjlxmc" width="120" headerAlign="center" autoEscape="true" allowSort="true">码表名称</div>
                    <div field="sfzccj" width="64" headerAlign="center" autoEscape="true" allowSort="true" renderer="onBooleanRenderer">支持层级</div>
                    <div field="mblx" width="64" headerAlign="center" allowSort="true" visible="false">码表类型</div>
                </div>
            </div>
        </div>
    </div>
    <!-- 右侧，指定的码表类型对应的码表信息列表 -->
    <div showCollapseButton="true">
        <div class="mini-toolbar" style="border-bottom: 0;padding:0px;" borderStyle="border-left:0px">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        <a class="mini-button" iconCls="icon-addnew" enabled="false" id="infoAdd" onclick="addInfo()">新增</a>
                        <a class="mini-button" iconCls="icon-edit" enabled="false" id="infoEdit" onclick="editInfo()">修改</a>
                        <a class="mini-button" iconCls="icon-remove" enabled="false" id="infoRemove" onclick="removeInfo()">删除</a>
                        <a class="mini-button" iconCls="icon-reload" onclick="reload(1)">刷新缓存</a>
                    </td>
                    <td style="white-space:nowrap;">
                        <input id="key2" class="mini-textbox" emptyText="请输入条目编号或条目值" style="width:150px;" onenter="onKeyEnter"/>
                        <a class="mini-button" onclick="search()">查询</a>
                    </td>
                </tr>
            </table>
        </div>

        <div class="mini-fit">
            <div id="datagrid_codeInfo" datafld="data" class="mini-datagrid" style="width:100%;height:100%;" borderStyle="border:0px" allowResize="true" multiSelect="false"
                 url="${pageContext.request.contextPath}/codeinfo/findAllInfos" onrowclick="infoRowClick(this);" onload="resetInfoBtn();" allowUnselect="false" sortMode="client"
                 allowResize="true" frozenStartColumn="0" frozenEndColumn="3"
                 pageSize="10"
            >
                <div property="columns">
                    <div type="indexcolumn" width="50" headerAlign="center">序号</div>
                    <div field="zj" width="50" headerAlign="center" allowSort="false" visible="false">主键</div>
                    <div field="mblxbh" width="100" headerAlign="center" autoEscape="true" allowSort="true">码表条目编号</div>
                    <div field="mbtmz" width="120" headerAlign="center" autoEscape="true" allowSort="true">码表条目值</div>
                    <div field="mbtmms" width="120" headerAlign="center" allowSort="true">码表条目描述</div>
                    <div field="sfkj" width="60" headerAlign="center" allowSort="true" renderer="onBooleanRenderer">是否可见</div>
                    <div field="sjsxsy" width="70" headerAlign="center" allowSort="true">数据顺序索引</div>
                    <div field="fjdbm" width="64" headerAlign="center" allowSort="true" visible="false">父节点编码</div>
                    <div field="bmjb" width="64" headerAlign="center" allowSort="true" visible="false">编码级别</div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">
    mini.parse();

    var grid_codeType = mini.get("datagrid_codeType");
    var grid_codeInfo = mini.get("datagrid_codeInfo");

    //页面初始化，默认选中第一行
    grid_codeType.load({},selectFirstRow);

    function selectFirstRow() {
        var row = grid_codeType.getRow(0);
        if(row){
            grid_codeType.select(row);
        }else{
            grid_codeType.clearRows();
        }
        typeRowClick("true");
    }

    function typeRowClick(e) {
        if(e){
            mini.get("typeEdit").enable();
            mini.get("typeRemove").enable();
            mini.get("infoAdd").enable();
        }else{
            mini.get("typeEdit").disable();
            mini.get("typeRemove").disable();
            mini.get("infoAdd").disable();
        }
    }

    function infoRowClick(e) {
        if(e){
            mini.get("infoEdit").enable();
            mini.get("infoRemove").enable();
        }else{
            mini.get("infoEdit").disable();
            mini.get("infoRemove").disable();
        }
    }

    function resetTypeBtn() {
        mini.get("typeEdit").disable();
        mini.get("typeRemove").disable();
        mini.get("infoAdd").disable();
    }

    function resetInfoBtn() {
        mini.get("infoEdit").disable();
        mini.get("infoRemove").disable();
    }

    //当“类型列表中”，某行选择发生改变时触发
    function typeList_onSelectionChanged(e) {
        var grid = e.sender;
        var record = grid.getSelected();
        if(record){
            mini.get("infoEdit").disable();
            mini.get("infoRemove").disable();
            grid_codeInfo.load({"codetype": record.zj } , function () {

            });
        }
    }

    function search() {
        var key = mini.get("key1").getValue();
        grid_codeType.load({"typeCode":key},selectFirstRow);
    }

    function add() {
        mini.open({
            //targetWindow: window,
            url: "${pageContext.request.contextPath}/codetype/form1",
            title: "新增码表", width: 600, height: 240,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = { action: "new" };
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
                if( action == "ok") {
                    showTips("码表添加成功","success");
                    grid_codeType.reload();
                }
            }
        });
    }
    
    
    function edit() {
        var row = grid_codeType.getSelected();
        if(row){
            mini.open({
                targetWindow: window,
                url: "${pageContext.request.contextPath}/codetype/form1",
                title: "修改码表", width: 600, height: 240,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "edit" , id : row.zj };
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                    if( action == "ok") {
                        showTips("码表修改成功","success");
                        grid_codeType.reload();
                    }
                }
            });
        }else {
            alert("请选择一条码值");
        }
    }

    function remove() {
        var row = grid_codeType.getSelected();
        if(row){
            mini.confirm("确定删除该码值？", "确定？",
                function (action) {
                    if (action == "ok") {
                        $.ajax({
                            url: "${pageContext.request.contextPath}/codetype/delete",
                            type: "post",
                            data: { "zj" : row.zj } ,
                            success: function (text) {
                                grid_codeType.reload();
                                grid_codeInfo.reload();
                                showTips("码值删除成功","danger");
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                alert(jqXHR.responseText);
                            }
                        });
                    }
                }
            );
        }else{
            alert("请选择一条码值");
        }
    }

    function addInfo() {
        var row = grid_codeType.getSelected();
        if(row){
            mini.open({
                // targetWindow: window,
                url: "${pageContext.request.contextPath}/codeinfo/form1",
                title: "新增条目", width: 640, height: 260,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "new" , "sfzccj": row.sfzccj , "sjlx" : row.zj }; //传入页面的数据
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                    if( action == "ok") {
                        showTips("条目添加成功","success");
                        grid_codeInfo.reload();
                    }
                }
            });
        }else {
            alert("请选择码值")
        }
    }

    function editInfo() {
        var row = grid_codeInfo.getSelected();
        if(row){
            mini.open({
                url: "${pageContext.request.contextPath}/codeinfo/form1",
                title: "编辑条目", width: 640, height: 260,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "edit", id : row.zj };
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                    if( action == "ok") {
                        showTips("条目修改成功","success");
                        grid_codeInfo.reload();
                    }
                }
            });
        }else{
            alert("请先选择一个条目")
        }
    }

    function removeInfo() {
        var row = grid_codeInfo.getSelected();
        if(row){
            mini.confirm("确定删除记录？", "确定？",
                function (action) {
                    if (action == "ok") {
                        $.ajax({
                            url: "${pageContext.request.contextPath}/codeinfo/delete",
                            type: "post",
                            data: { "zj" : row.zj } ,
                            success: function (text) {
                                grid_codeInfo.reload();
                                showTips("记录删除成功","danger");
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                alert(jqXHR.responseText);
                            }
                        });
                    }
                }
            );
        }else{
            alert("请选择一个条目")
        }
    }

    function onBooleanRenderer(e) {
        if(e.value == 1){
            return "是";
        }else{
            return "否";
        }
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

</html>
