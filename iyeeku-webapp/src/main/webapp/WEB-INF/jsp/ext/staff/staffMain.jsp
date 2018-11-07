<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/4
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/tag_res.jsp"%>
<html>
<head>
    <sec:csrfMetaTags/>
    <title>用户信息管理主页面</title>
    <%@ include file="../../common/jscss_res.jsp"%>
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
                    <td>用户名称：</td>
                    <td>
                        <input name="yhmc" id="yhmc" class="mini-textbox" width="120px" maxlength="64">
                    </td>
                </tr>
                <tr>
                    <td>NOTESID：</td>
                    <td>
                        <input name="notesid" id="notesid" class="mini-textbox" width="120px" maxlength="6" vtype="rangeChar:0,6;">
                    </td>
                </tr>
                <tr>
                    <td>用户登陆名：</td>
                    <td>
                        <input name="yhdlm" id="yhdlm" class="mini-textbox" width="120px" maxlength="32">
                    </td>
                </tr>
                <tr>
                    <td>所属机构：</td>
                    <td>
                        <input name="ssjg" id="ssjg" class="mini-buttonedit" width="120px" allowInput="false">
                    </td>
                </tr>
                <tr>
                    <td>含子机构：</td>
                    <td>
                        <div id="bhzjg" name="bhzjg" class="mini-checkbox" text="包含子机构" value="true" trueValue="1" falseValue="0" checked="true" readOnly="false" style="margin-right: 10px;"></div>
                    </td>
                </tr>
                <tr>
                    <td>用户状态：</td>
                    <td>
                        <input name="zt" id="yhzt" class="mini-combobox" width="120px"
                               textField="text" valueField="id"  url="/directory/loadDict/staffType">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <a class="mini-button" iconCls="icon-search" id="advancedBtn" onclick="advancedSearch()">查询</a>
                        <a class="mini-button" iconCls="icon-reload" id="resetBtn" onclick="advancedReset()">重置</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <div title="center" region="center" style="border: 0px;">
        <div class="mini-toolbar" style="border-bottom: 0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        <a class="mini-button" iconCls="icon-addnew" id="addBtn" onclick="addStaff()">新增</a>
                        <a class="mini-button" iconCls="icon-edit"id="editBtn" onclick="editStaff()">编辑</a>
                        <a class="mini-button" iconCls="icon-remove" id="removeBtn" onclick="removeStaff()">删除</a>
                        <a class="mini-button" iconCls="icon-close" id="cancel_removeBtn" onclick="cancelRemove()" visible="false">删除</a>
                        <a class="mini-button" iconCls="icon-ok" id="confirm_removeBtn" onclick="confirmRemove()" visible="false">删除</a>
                        <span class="separator"></span>
                        <a class="mini-button" iconCls="icon-goto" id="viewRoleBtn" onclick="viewRole()">查看角色</a>
                        <a class="mini-button" iconCls="icon-addnew"id="addRoleBtn" onclick="addRole()">分配角色</a>
                        <a class="mini-button" iconCls="icon-remove" id="removeRoleBtn" onclick="removeRole()">删除角色</a>
                    </td>
                    <td style="white-space:nowrap;">
                        <input id="key" class="mini-textbox" emptyText="请输入用户名称" style="width:150px;" onenter="search()" maxlength="64"/>
                        <a class="mini-button" iconCls="icon-search" onclick="search()">查询</a>
                        <a id="advancedSearchBtn" class="mini-button" oncheckedchanged="showHeader()" checkOnClick="true">高级查询</a>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100%;" colspan="2">
                        <a class="mini-button" iconCls="icon-edit" id="stateManageBtn" onclick="stateManage()">状态管理</a>
                        <a class="mini-button" iconCls="icon-close" id="cancelManageBtn" onclick="cancelManage()" visible="false">取消</a>
                        <a class="mini-button" iconCls="icon-lock"id="lockBtn" onclick="lock()" visible="false">锁定</a>
                        <a class="mini-button" iconCls="icon-unlock" id="unlockBtn" onclick="unlock()" visible="false">解锁</a>
                        <a class="mini-button" iconCls="icon-edit" id="changePwdBtn" onclick="changePwd()" visible="false">修改密码</a>
                        <span class="separator"></span>
                        <a class="mini-button" iconCls="icon-goto" id="viewPermissionBtn" onclick="viewPermission()">查看权限</a>
                        <span class="separator"></span>
                        <a class="mini-button" iconCls="icon-redo" id="exportStaffBtn" onclick="exportStaff()">导出用户</a>
                    </td>
                </tr>
            </table>
        </div>

        <div class="mini-fit">
            <div id="datagrid_staff" datafld="data" class="mini-datagrid" style="width:100%;height:100%;" borderStyle="border-left:0px;border-right:0px;" allowResize="true" multiSelect="false"
                 url="${pageContext.request.contextPath}/staff/list" onselectionchanged="onSelectionChanged()" onload="controlBtnState()" allowUnselect="false" sortMode="client"
                 allowResize="true" pageSize="10"
            >
                <div property="columns">
                    <div type="checkcolumn"></div>
                    <div type="indexcolumn" width="50" headerAlign="center">序号</div>
                    <div field="yhbh" width="50" headerAlign="center" allowSort="false" visible="false">员工编号</div>
                    <div field="yhmc" width="100" headerAlign="center" autoEscape="true" allowSort="true">员工名称</div>
                    <div field="yhdlm" width="120" headerAlign="center" autoEscape="true" allowSort="true">员工登录名</div>
                    <div field="ssjgbh" width="120" headerAlign="center" allowSort="true" renderer="ssjgmcRenderer">所属机构名称</div>
                    <div field="notesid" width="60" headerAlign="center" allowSort="true">notesid</div>
                    <div field="zt" width="100" headerAlign="center" allowSort="true" renderer="yhztRenderer">员工状态</div>
                    <div field="sdsj" width="120" headerAlign="center" allowSort="true">锁定时间</div>
                </div>
            </div>
        </div>

    </div>

</div>

<script type="text/javascript">

    var websocket = null;

    var url = 'ws://' + window.location.host + '/echo';  //配置文件中配的path有关

    if(typeof(WebSocket) == "undefined"){
        alert("您的浏览器不支持WebSocket");
    }else {
        websocket = new WebSocket(url);
    }

    //连接发生错误的回调方法
    websocket.onerror = function (ev) {
        console.info("WebSocket连接发生错误");
    }

    //连接成功建立的回调方法
    websocket.onopen = function (ev) {
        websocket.send("start talk...");
    }

    //接收到消息的回调方法
    websocket.onmessage = function (ev) {
        console.info("服务器返回的消息：== >> " + ev.data);
    }

    //连接关闭的回调方法
    websocket.onclose = function (ev) {
        console.info("WebSocket链接关闭");
    }

    function send() {
        var message = "测试数据....";
        websocket.send(message);
    }


    mini.parse();

    var grid = mini.get("datagrid_staff");
    var form = new mini.Form("#form1");

    grid.load();

    //保存选中行的索引号
    var seletecIndex;

    var layout1 = mini.get("layout1");
    hideHeader();

    function hideHeader() {
        layout1.updateRegion("east",{visible:false});
    }
    
    function search() {
        var key = mini.get("key").getValue();
        grid.load({"yhmc":key});
    }

    function advancedSearch() {
        grid.load(form.getData());
    }

    function advancedReset() {
        form.reset();
    }
    
    function controlBtnState() {
       mini.get("editBtn").disable();
       mini.get("removeBtn").disable();

       mini.get("viewRoleBtn").disable();
       mini.get("addRoleBtn").disable();
       mini.get("removeRoleBtn").disable();
       mini.get("stateManageBtn").disable();
       mini.get("viewPermissionBtn").disable();
       if(mini.get("cancelManageBtn").visible == true){
           if(grid.getSelecteds().length > 0){
               mini.get("lockBtn").enable();
               mini.get("unlockBtn").enable();
               mini.get("changePwdBtn").enable();
           }else{
               mini.get("lockBtn").disable();
               mini.get("unlockBtn").disable();
               mini.get("changePwdBtn").disable();
           }
       }
    }

    function onSelectionChanged() {
        var rows = grid.getSelecteds();
        if(mini.get("datagrid_staff").showPager == true){
            seletecIndex = grid.indexOf(rows[0]);
        }
        if(rows.length > 0){
            if(mini.get("cancelManageBtn").visible == true){
                mini.get("lockBtn").enable();
                mini.get("unlockBtn").enable();
                mini.get("changePwdBtn").enable();
            }else {
                mini.get("editBtn").enable();
                mini.get("removeBtn").enable();
                mini.get("viewRoleBtn").enable();
                mini.get("addRoleBtn").enable();
                mini.get("removeRoleBtn").enable();
                mini.get("stateManageBtn").enable();
                mini.get("viewPermissionBtn").enable();
            }
        }
    }

    //状态管理
    function stateManage() {
        mini.get("datagrid_staff").setMultiSelect(true);
        mini.get("datagrid_staff").setAllowUnselect(true);
        mini.get("datagrid_staff").updateColumn("checkCloumn");
        mini.get("datagrid_staff").setShowPager(false);

        mini.get("addBtn").disable();
        mini.get("editBtn").disable();
        mini.get("removeBtn").disable();
        mini.get("viewRoleBtn").disable();
        mini.get("addRoleBtn").disable();
        mini.get("removeRoleBtn").disable();
        mini.get("viewPermissionBtn").disable();

        mini.get("stateManageBtn").setVisible(false);
        mini.get("cancelManageBtn").setVisible(true);
        mini.get("lockBtn").setVisible(true);
        mini.get("unlockBtn").setVisible(true);
        mini.get("changePwdBtn").setVisible(true);
        if( grid.getSelecteds().length > 0){
            mini.get("lockBtn").enable();
            mini.get("unlockBtn").enable();
            mini.get("changePwdBtn").enable();
        }else{
            mini.get("lockBtn").disable();
            mini.get("unlockBtn").disable();
            mini.get("changePwdBtn").disable();
        }
        
    }
    
    function cancelManage() {
        mini.get("datagrid_staff").setMultiSelect(false);
        mini.get("datagrid_staff").setAllowUnselect(false);
        mini.get("datagrid_staff").updateColumn("checkCloumn");
        mini.get("datagrid_staff").setShowPager(true);
        if( grid.getSelecteds().length > 0){
            grid.clearSelect();
            grid.select(grid.getRow(seletecIndex))
        }

        mini.get("stateManageBtn").setVisible(true);
        mini.get("cancelManageBtn").setVisible(false);
        mini.get("lockBtn").setVisible(false);
        mini.get("unlockBtn").setVisible(false);
        mini.get("changePwdBtn").setVisible(false);

        mini.get("addBtn").enable();

        if(grid.getSelected()) {
            mini.get("editBtn").enable();
            mini.get("removeBtn").enable();
            mini.get("viewRoleBtn").enable();
            mini.get("addRoleBtn").enable();
            mini.get("removeRoleBtn").enable();
            mini.get("viewPermissionBtn").enable();
        }else{
            mini.get("stateManageBtn").disable();
        }

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

    function addStaff() {
        send();
        return;
        mini.open({
            url: "${pageContext.request.contextPath}/staff/form1",
            title: "新增员工", width: 620, height: 530,
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

    function editStaff() {
        var row = grid.getSelected();
        if (row){
            mini.open({
                url: "${pageContext.request.contextPath}/staff/form1",
                title: "修改员工信息", width: 620, height: 530,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "edit" , id : row.yhbh };
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                    if( action == "ok") {
                        grid.reload();
                        showTips("员工信息修改成功","success");
                    }
                }
            });
        }else{
            mini.alert("请先选择一条记录");
        }
    }
    
    function removeStaff() {
        var row = grid.getSelected();
        if(row){
            mini.confirm("确定删除该用户？", "确定？",
                function (action) {
                    if (action == "ok") {

                    }
                }
            );
        }else{
            mini.alert("请先选择一条记录");
        }
    }

    function viewRole() {
        var row = grid.getSelected();
        if(row){
            mini.open({
                url: "${pageContext.request.contextPath}/staff/viewRole",
                title: "角色信息", width: 650, height: 400,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "query" , yhbh: row.yhbh };
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: null
            });
        }else{
            mini.alert("请先选择一条记录");
        }
    }

    function addRole() {
        var row = grid.getSelected();
        if(row){
            mini.open({
                url: "${pageContext.request.contextPath}/staff/addRole",
                title: "角色信息", width: 650, height: 400,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = {yhbh: row.yhbh};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                    if (action == "ok"){
                        showTips("角色添加成功","success");
                    }
                }
            });
        }else{
            mini.alert("请先选择一条记录");
        }
    }
    
    function removeRole() {
        var row = grid.getSelected();
        if(row){
            mini.open({
                url: "${pageContext.request.contextPath}/staff/removeRole",
                title: "角色信息", width: 650, height: 400,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = {yhbh: row.yhbh};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                    if (action == "ok"){
                        showTips("角色移除成功","success");
                    }
                }
            });
        }else{
            mini.alert("请先选择一条记录");
        }
    }
    
    function exportStaff() {
        window.location = "/staff/exportStaffExcel";
    }
    

    var staffStates;
    $.getJSON("/directory/loadDict/staffState",null,function (data) {staffStates = data;});

    function yhztRenderer(e) {
        for ( var i = 0 , l = staffStates.length ; i < l ; i++){
            var v = staffStates[i];
            if(v.id == e.value) return v.text;
        }
        return "";
    }

    function ssjgmcRenderer(e) {
        if(e.value == "" || e.value == null) return "暂无归属部门";
    }

</script>

</body>
</html>
