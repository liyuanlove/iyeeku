<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/10
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../common/tag_res.jsp"%>
<html>
<head>
    <sec:csrfMetaTags/>
    <title>角色分配权限主页面</title>
    <%@ include file="../../../common/jscss_res.jsp"%>
</head>
<body>
<!--  -->
<div class="mini-splitter" style="width: 100%;height: 100%;" handlerSize="2" borderStyle="border:0;">
    <div size="285px" minSize="285px" showCollapseButton="false" expanded="true" style="padding:0px;border-right: 0;">
        <div class="mini-splitter" vertical="true" style="width: 100%;height: 100%;" borderStyle="border:0;">
            <div size="85%" showCollapseButton="false">
                <div class="mini-toolbar">
                    <input id="jsmc" class="mini-textbox" emptyText="请输入角色名称" style="width:150px;" maxlength="64" onenter="onKeyEnter"/>
                    <a class="mini-button" onclick="search()">查询</a>
                </div>
                <div class="mini-fit">
                    <div id="role_datagrid" datafld="data" class="mini-datagrid" style="width:100%;height:100%;" borderStyle="border-top:0px;border-bottom:0px"
                         allowMoveColumn="false" url="${pageContext.request.contextPath}/roleRelationPer/listRole"
                         onselectionchanged="onSelectionChanged" onrowclick="typeRowClick(this);" allowUnselect="false" selectOnLoad="true"
                         showPager="false" pager="#pager1"
                    >
                        <div property="columns" allowMove="false" allowResize="false">
                            <div type="indexcolumn" width="30px">序号</div>
                            <div field="jsbh" width="120" visible="false">角色编号</div>
                            <div field="jszt" width="64" visible="false">角色状态</div>
                            <div field="jsmc" width="120" headerAlign="center" allowSort="true">角色名称</div>
                        </div>
                    </div>
                </div>
                <div id="pager1" class="mini-pager" style="width:100%;" showPageSize="false" showPageInfo="false"
                     sizeList="[5,10,20,100]">
                </div>
            </div>
            <!-- 公共权限区 -->
            <div size="15%" showCollapseButton="false" style="border-top: 0;">
                <div class="mini-fit">
                    <div id="datagrid2" datafld="data" class="mini-datagrid" style="width:100%;height:100%;"
                         allowMoveColumn="false" url="${pageContext.request.contextPath}/roleRelationPer/commonPermissionList"
                         onselectionchanged="onSelectionChanged" onrowclick="typeRowClick(this);" allowUnselect="false" showPager="false"
                    >
                        <div property="columns" allowMove="false" allowResize="false">
                            <div field="jsbh" visible="false">角色编号</div>
                            <div field="jsmc" width="120" headerAlign="center" allowSort="false" allowMove="false" allowResize="false">公共权限</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div size="100%" showCollapseButton="false" expanded="true" style="border-left: 0;">
        <div id="tab1" class="mini-tabs" activeIndex="0" tabStyle="2" style="width: 100%;height: 100%;"
            datafld="tabs" borderStyle="border-right:0;border-left:0;border-bottom:0;">
            <div title="菜单权限" closeWhenDbClick="false">
                <div id="contentbox">
                    <div id="menutreediv" style="height: 100%;width: 300px;position: absolute;top: 0px;left: 0px;">
                        <div class="mini-panel" title="菜单树" iconCls="" style="width: 100%;height: 100%;"
                             showToolbar="false" showCloseButton="false" showFooter="true">
                            <ul id="menuTree" class="mini-tree" style="width: 100%;height: 100%;"
                                textField="text" idField="id" parentField="pid"
                                dataField="treeNodes" resultAsTree="false"
                                autoCheckParent="true" expandOnLoad="true"
                                onnodeselect="onNodeSelect" onload="onLoad">
                            </ul>
                            <div property="footer" class="custom_footer" style="text-align: right;padding: 2px;">
                                <a id="refreshMenu" iconCls="icon-reload" class="mini-button" onClick="refreshMenuCache()">刷新缓存</a>
                                <a id="chooseMenu" iconCls="icon-goto" class="mini-button" enabled="false" onClick="chooseMenu()">选择菜单</a>
                            </div>
                        </div>
                    </div>

                    <div id="urldiv" style="height: 100%;margin-top: 0px;margin-left: 302px;margin-bottom: 0px;margin-right: 0px;">
                        <div class="mini-panel" title="URL" iconCls="" style="width: 100%;height: 100%;"
                            showToolbar="false" showCloseButton="false" showFooter="true">
                            <div id="url_datagrid" datafld="data" class="mini-datagrid" style="width:100%;height:100%;" multiSelect="false" allowCellSelect="false"
                                 url="${pageContext.request.contextPath}/menu/findNotMenuUrl" showPager="false" allowUnselect="false"
                                 onrowdblclick="" onselectionchanged=""
                            >
                                <div property="columns">
                                    <div type="indexcolumn" width="30" headerAlign="center">序号</div>
                                    <div field="urlbh" width="50" visible="false">URL编号</div>
                                    <div field="urllj" width="120" allowSort="true">URL路径</div>
                                    <div field="urlms" width="120" allowSort="true">URL描述</div>
                                </div>
                            </div>
                            <div property="footer" class="custom_footer" style="text-align: right;padding: 2px;">
                                <a id="chooseUrl" iconCls="icon-goto" class="mini-button" enabled="false" onClick="chooseURL()" enabled="false">选择URL</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div title="功能权限" closeWhenDbClick="false">

            </div>

        </div>
    </div>


</div>


</body>
<script type="text/javascript">
    mini.parse();

    var roleGrid = mini.get("role_datagrid");
    var urlGrid = mini.get("url_datagrid");
    roleGrid.load(); //加载角色列表
    
    function typeRowClick(e) {
        
    }

    function search() {
        var jsmc = mini.get("jsmc").getValue();
        roleGrid.load({jsmc:jsmc});
    }

    function onSelectionChanged(e) {
        var grid2 = e.sender;
        var record = grid2.getSelected();
        if(e.select){
            jsbh = record.jsbh;
            var tree = mini.get("menuTree"); //加载角色菜单树
            tree.load("/commonPer/findRoleMenuPer?jsbh="+jsbh);

            //加载角色的数据权限

            //加载角色的功能权限

            mini.get("chooseMenu").enable();

        }else{
            mini.get("chooseMenu").disable();
        }
    }
    
    function onNodeSelect(e) {
        var row = roleGrid.getSelected();
        if (!row){

        }
        if (row){
            var jsbh = row.jsbh;
            var cdbh = e.node.id;
            var cdurl = e.node.cdurl;
            //用户选择角色拥有的菜单节点，并选择的是 子节点
            if(e.select && e.isLeaf){
                urlGrid.load({cdbh:cdbh,jsbh:jsbh,gnssmk:cdurl});
                if (e.node.cdurl == ""){
                    mini.get("chooseUrl").disable();
                }else{
                    mini.get("chooseUrl").enable();
                }
            }else{
                urlGrid.load({cdbh:cdbh,jsbh:jsbh,gnssmk:cdurl});
                mini.get("chooseUrl").disable();
            }
        }else{
            mini.alert("请选择一条角色信息！");
            mini.get("chooseMenu").disable();
            mini.get("chooseUrl").disable();
        }
    }

    //菜单树加载的时候判断有无节点选中，没有选中节点则置为“灰色”
    function onLoad(e) {
        var tree = mini.get("menuTree");
        var rootNode = tree.getRootNode().children[0];
        if(rootNode){
            //选中根节点
            tree.selectNode(rootNode);
        }else{
            //清空urlGrid
            urlGrid.removeRows(urlGrid.data);
        }
        var selectNode = tree.getSelectedNode();
        if (selectNode && tree.isLeaf(selectNode)){
            mini.get("chooseUrl").enable();
        }else{
            mini.get("chooseUrl").disable();
        }
        if(selectNode && selectNode.cdurl == ""){
            mini.get("chooseUrl").disable();  //设置选择URL按钮不可用
        }
    }
    

    //弹出，选择菜单树界面
    function chooseMenu() {
        var row = roleGrid.getSelected(); //获取角色列表选中行对象
        if (row){
            var jszt = row.jszt;
            if (jszt == "2"){
                mini.alert("角色状态为无效，不可用分配菜单权限");
            }else{
                var jsbh = row.jsbh;
                var tree = mini.get("menuTree");
                var url = "/roleRelationPer/roleAssignMenu";
                mini.open({
                    url: url,
                    title: "菜单选择", width: 600, height: 450,
                    onload: function () {
                        var iframe = this.getIFrameEl();
                        var data = { action: "chooseMenuTree" , jsbh : jsbh };
                        iframe.contentWindow.SetData(data);
                    },
                    ondestroy: function (action) {
                        if( action == "ok") {
                            tree.load("/commonPer/findRoleMenuPer?jsbh="+jsbh);
                            urlGrid.load();
                            showTips("菜单选择成功!!","success");
                        }
                    }
                });
            }
        }else{
            mini.alert("请先选中一条角色数据");
        }
    }
    
    function chooseURL() {
        var row = roleGrid.getSelected(); //获取角色列表选中行对象
        if(row){
            var jszt = row.jszt;
            if (jszt == "2"){
                mini.alert("角色状态为无效，不可用分配URL权限");
            }else{
                var jsbh = row.jsbh;
                var tree = mini.get("menuTree");
                var treenode = tree.getSelectedNode();
                var cdurl = treenode.cdurl;
                var cdbh = treenode.id;

                var url = "/roleRelationPer/roleAssignUrl";
                mini.open({
                    url: url,
                    title: "URL选择", width: 650, height: 450,
                    onload: function () {
                        var iframe = this.getIFrameEl();
                        var data = { action: "chooseURLList" , jsbh:jsbh , cdurl:cdurl , cdbh:cdbh };
                        iframe.contentWindow.SetData(data);
                    },
                    ondestroy: function (action) {
                        if( action == "ok") {

                        }
                    }
                });
            }
        }else{
            mini.alert("请先选中一条角色数据");
        }
    }
    
    function refreshMenuCache() {
        var ajaxConf = new IyeekuAjaxConf();
        ajaxConf.setIsShowSuccMsg(false);
        $J.postByAjax({jsmc:"超级管理员"} , "/roleRelationPer/listRole" , ajaxConf);
    }


</script>

</html>
