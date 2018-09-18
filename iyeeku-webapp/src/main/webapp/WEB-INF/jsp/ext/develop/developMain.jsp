<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/7
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/tag_res.jsp"%>
<html>
<head>
    <sec:csrfMetaTags/>
    <title>个人开发日志主页面</title>
    <%@ include file="../../common/jscss_res.jsp"%>
</head>
<body>
<!-- 左右布局方式 -->
<div class="mini-splitter" style="width:100%;height:100%;" borderStyle="border:0px">
    <!-- 最近开发事项简介 -->
    <div size="20%" showCollapseButton="false" expanded="true" style="padding:0px;border-right: 0;">
        <div class="mini-panel" title="最近开发事项简介" iconCls="" style="width: 100%;height: 100%;" showToolbar="false" showCloseButton="false">


        </div>
    </div>

    <!-- 模块开发日志 -->
    <div size="80%" showCollapseButton="false" expanded="true" style="padding:0px;border-left: 0;">
        <div class="mini-panel" title="模块开发日志" iconCls="" style="width: 100%;height: 100%;"
             showToolbar="true" showFooter="false" showCloseButton="false">
            <div property="toolbar" style="height: 30px;">
                <table style="width: 100%;">
                    <tr>
                        <td style="width:100%;">
                            <a class="mini-button" iconCls="icon-addnew" onclick="addMenu()">新增</a>
                            <a class="mini-button" iconCls="icon-edit" onclick="edit()" enabled="false" id="delBtn">删除</a>
                            <a class="mini-button" iconCls="icon-remove" onclick="submitForm()" enabled="false" id="saveBtn">保存</a>
                        </td>
                        <td style="white-space:nowrap;">
                            <a class="mini-button" id="refreshUrl" onclick="refreshUrl()">刷新URL</a>
                        </td>
                    </tr>

                </table>
            </div>

            <div class="mini-fit">
                <div id="treegrid1" class="mini-treegrid" style="width:100%;height:100%"
                     url="${pageContext.request.contextPath}/testdataJson/tasks.txt" showTreeIcon="true"
                     treeColumn="taskname" idField="UID" parentField="ParentTaskUID" resultAsTree="false" expandOnLoad="true"
                >
                    <div property="columns">
                        <div type="indexcolumn"></div>
                        <div name="taskname" field="Name" width="200">任务名称</div>
                        <div field="Duration" width="60">工期</div>
                        <div field="Completion" width="60">完成度</div>
                        <div field="Start" width="100" dateFormat="yyyy-MM-dd">开始日期</div>
                        <div field="Finish" width="100" dateFormat="yyyy-MM-dd">完成日期</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
