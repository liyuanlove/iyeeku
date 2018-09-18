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
                    <div id="datagrid1" datafld="data" class="mini-datagrid" style="width:100%;height:100%;" borderStyle="border-top:0px;border-bottom:0px"
                         allowMoveColumn="false" url="${pageContext.request.contextPath}/role/findAllRoleInfos"
                         onselectionchanged="" onrowclick="typeRowClick(this);" allowUnselect="false"
                    >
                        <div property="columns" allowMove="false" allowResize="false">
                            <div type="indexcolumn" width="30px">序号</div>
                            <div field="jsbh" width="120" visible="false">角色编号</div>
                            <div field="jszt" width="64" visible="false">角色状态</div>
                            <div field="jsmc" width="120" headerAlign="center" allowSort="true">角色名称</div>
                        </div>
                    </div>
                </div>
            </div>
            <div size="15%" showCollapseButton="false" style="border-top: 0;">
                <div class="mini-fit">

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
                            <ul id="menuTree" class="mini-tree" style="width: 100%;height: 100%;">

                            </ul>
                            <div property="footer" class="custom_footer" style="text-align: right;padding: 2px;">
                                <a id="refreshMenu" iconCls="icon-reload" class="mini-button" onClick="">刷新缓存</a>
                                <a id="chooseMenu" iconCls="icon-goto" class="mini-button" onClick="">选择菜单</a>
                            </div>
                        </div>
                    </div>

                    <div id="urldiv" style="height: 100%;margin-top: 0px;margin-left: 302px;margin-bottom: 0px;margin-right: 0px;">
                        <div class="mini-panel" title="URL" iconCls="" style="width: 100%;height: 100%;"
                            showToolbar="false" showCloseButton="false" showFooter="true">
                            <div id="urldatagrid" datafld="data" class="mini-datagrid" style="width:100%;height:100%;" multiSelect="false" allowCellSelect="false"
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
                                <a id="chooseUrl" iconCls="icon-goto" class="mini-button" onClick="" enabled="false">选择URL</a>
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
</html>
