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
                 pageSize="10"
            >
                <div property="columns">
                    <div type="indexcolumn">序号</div>
                    <div field="zj" width="120" headerAlign="center" allowSort="false" visible="false">主键</div>
                    <div field="sjlxbh" width="120" headerAlign="center" autoEscape="true" allowSort="true">码表编号</div>
                    <div field="sjlxmc" width="120" headerAlign="center" autoEscape="true" allowSort="true">码表名称</div>
                    <div field="sfzccj" width="64" headerAlign="center" autoEscape="true" allowSort="true">支持层级</div>
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
                        <a class="mini-button" iconCls="icon-addnew" enabled="false" onclick="addInfo()">新增</a>
                        <a class="mini-button" iconCls="icon-edit" enabled="false" onclick="editInfo()" plain="true">修改</a>
                        <a class="mini-button" iconCls="icon-remove" enabled="false" onclick="removeInfo()">删除</a>
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
            <div id="datagrid_codeInfo" datafld="data" class="mini-datagrid" style="width:100%;height:100%;" borderStyle="border:0px" allowResize="true"
                 url="${pageContext.request.contextPath}/codeinfo/findAllInfos" multiSelect="false"
                 pageSize="10"
            >
                <div property="columns">
                    <div type="indexcolumn">序号</div>
                    <div field="zj" width="50" headerAlign="center" allowSort="false" visible="false">主键</div>
                    <div field="mblxbh" width="100" headerAlign="center" autoEscape="true" allowSort="true">码表条目编号</div>
                    <div field="mbtmz" width="120" headerAlign="center" autoEscape="true" allowSort="true">码表条目值</div>
                    <div field="mbtmms" width="120" headerAlign="center" allowSort="true">码表条目描述</div>
                    <div field="sfkj" width="60" headerAlign="center" allowSort="true">是否可见</div>
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
    grid_codeType.load({},selectFirstRow());

    function selectFirstRow() {
        var row = grid_codeType.getRow(0);
        if(row){
            grid_codeType.select(row);
        }else{
            grid_codeType.clearRows();
        }
        typeRowClike("true");
    }

    function typeRowClike(e) {
        if(e){
            mini.get("typeEdit").enable();
            mini.get("typeRemove").enable();
        }else{
            mini.get("typeEdit").disable();
            mini.get("typeRemove").disable();
        }
    }

    function search() {
        var key = mini.get("key1").getValue();
        grid_codeType.load({"typeCode":key},selectFirstRow());
    }

    function add() {
        mini.open({
            targetWindow: window,
            url: "${pageContext.request.contextPath}/codetype/form1",
            title: "新增码表", width: 600, height: 240,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = { action: "new" };
                // iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
                if( action == "ok") {
                    showTips("码表添加成功","success");
                    grid_codeType.reload();
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

</html>
