<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/26
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../common/tag_res.jsp"%>
<html>
<head>
    <sec:csrfMetaTags/>
    <title>权限关联角色主界面</title>
    <%@ include file="../../../common/jscss_res.jsp"%>
</head>
<body>

<div class="mini-splitter" style="width: 100%;height: 100%;" handlerSize="2" borderStyle="border:0;">
    <div size="100%" showCollapseButton="false" expanded="true" style="padding:2px;border-right: 0;">
        <!-- start left 权限资源区 -->
        <div id="tabs1" class="mini-tabs" activeIndex="0" tabStyle="2"
            style="width: 100%;height: 100%;" dataField="tabs" borderStyle="border-left:0;border-right:0;border-bottom:0;">
            <div title="菜单权限" closeWhenDblClick="false">
                <!-- 菜单权限 -->
                <div id="contentbox" style="position: relative;width: 100%;height: 100%;">
                    <div id="menutreediv" style="height: 100%;width: 300px;position: absolute;top: 0px;left: 0px;">
                        <div class="mini-panel" title="菜单树" iconCls="" style="width: 99%; height: 100%;" showToolbar="false"
                        borderStyle="border-right:solid 1px #aaa;" showFooter="true" showCloseButton="false">
                            <ul id="tree1" class="mini-tree" style="width: 100%;height: 100%;"
                                textField="text" idField="id" parentField="pid"
                                dataField="treeNodes" resultAsTree="false"
                                autoCheckParent="true" expandOnLoad="true"
                                onnodeselect="" onload="onLoad">
                            </ul>
                            <div property="footer" class="custom_footer" style="text-align: right;padding: 2px;">
                                <a id="refreshMenu" iconCls="icon-reload" class="mini-button" onClick="refreshMenuCache()">刷新缓存</a>
                                <a id="chooseMenu" iconCls="icon-goto" class="mini-button" enabled="false" onClick="chooseMenu()">选择菜单</a>
                            </div>
                        </div>
                    </div>

                    <div id="urldiv" style="height: 100%;margin-top: 0px;margin-left: 302px;margin-bottom: 0px;margin-right: 0px;">
                        <div class="mini-panel" title="URL" iconCls="" style="width: 100%;height: 100%;" showToolbar="true"
                            showCloseButton="false" showFooter="true" borderStyle="border:solid 0px 1px #aaa;">
                            <div property="toolbar" style="border-bottom: 0;padding: 2px;text-align: right;height: 25px">
                                <input id="key" class="mini-textbox" emptyText="请输入URL" style="width: 150px;margin-left: 5px;" maxlength="256">
                                <a class="mini-button" iconCls="icon-search" onclick="search()">搜索</a>
                            </div>
                            <div id="urlgrid" dataField="data" class="mini-datagrid" style="width:100%;height:100%;" multiSelect="false" allowCellSelect="false"
                                 url="${pageContext.request.contextPath}/roleRelationPer/listRoleMenunodeUrl" showPager="false" allowUnselect="false"
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

            <!-- 功能权限 -->
            <div title="功能权限" closeWhenDblClick="false">

            </div>

        </div>

    </div>

    <!-- 角色列表区 -->
    <div size="285px" minSize="285px" showCollapseButton="false" expanded="true" style="padding:2px;border-left: 0;">
        <div class="mini-fit">
            <div id="rolegrid" dataField="data" class="mini-datagrid" style="width:100%;height:100%;"
                 allowMoveColumn="false" url="${pageContext.request.contextPath}/roleRelationPer/listRole"
                 allowUnselect="false" showPager="false" pager="#pager1"
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

</div>

</body>
<script type="text/javascript">
    mini.parse();

</script>

</html>
