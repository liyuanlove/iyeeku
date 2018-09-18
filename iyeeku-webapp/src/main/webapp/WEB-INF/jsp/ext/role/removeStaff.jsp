<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/10
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/tag_res.jsp"%>
<html>
<head>
    <title>删除用户角色</title>
    <sec:csrfMetaTags/>
    <%@ include file="../../common/jscss_res.jsp"%>
</head>
<body>
    <div class="mini-toolbar" style="text-align:left;height: 35px;">
        <form id="form1">
            <input id="jsbh" name="jsbh" class="mini-hidden">
            <input id="yhmc" name="yhmc" width="160" class="mini-textbox" emptyText="请输入用户名称" onenter="" maxlength="64">
            <input id="ssjg" name="ssjg" width="180" class="mini-buttonedit">
            <div id="bhzjg" name="bhzjg" class="mini-checkbox" text="包含子机构" value="true" trueValue="1" falseValue="0" checked="true" readOnly="false" style="margin-right: 10px;"></div>
            <a class="mini-button" iconCls="icon-search" id="searchBtn" style="margin-right: 10px;" onclick="search()">搜索</a>
            <a class="mini-button" iconCls="icon-reload" id="resetBtn" onclick="reset()">重置</a>
        </form>
    </div>

    <div class="mini-fit">
        <div id="datagrid1" datafld="data" class="mini-datagrid" style="width:100%;height:100%;" borderStyle="border-left:0;border-bottom:0;border-right:0;" sortMode="client"
             url="${pageContext.request.contextPath}/role/listStaff" multiSelect="true"
             onselectionchanged="onSelectionChanged" onload="turnPage()" pageSize="10"
        >
            <div property="columns">
                <div type="checkcolumn"></div>
                <div type="indexcolumn" width="30" headerAlign="center">序号</div>
                <div field="yhbh" headerAlign="center" visible="false">用户编号</div>
                <div field="yhmc" width="100" headerAlign="center" allowSort="true">员工名称</div>
                <div field="ssjgmc" width="240" headerAlign="center" allowSort="true" renderer="ssjgmcRenderer">所属机构名称</div>
                <div field="notesid" width="100" headerAlign="center" allowSort="true">NotesID</div>
            </div>
        </div>
    </div>

    <div class="mini-toolbar" style="text-align:center;padding-top:10px;padding-bottom:10px;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
        <a class="mini-button" style="width:60px;" onclick="onCancel()">取消</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="mini-button" style="width:60px;" id="btnOk" onclick="onOk()" enabled="false">确定</a>
    </div>
</body>

<script type="text/javascript">

    mini.parse();

    var grid = mini.get("datagrid1");

    function SetData(data) {
        //跨页面传递的数据对象，克隆后才可以安全使用
        data = mini.clone(data);
        mini.get("jsbh").setValue(data.jsbh);
        grid.load({jsbh:data.jsbh});
    }

    function search() {
        var form = new mini.Form("form1");
        var data = form.getData();
        grid.load(data);
    }

    function onSelectionChanged() {
        var rows = grid.getSelecteds();
        if(rows.length > 0){
            mini.get("btnOk").enable();
        }else{
            mini.get("btnOk").disable();
        }
    }

    function turnPage() {
        mini.get("btnOk").disable();
    }

    function reset() {
        mini.get("yhmc").setValue("");
        mini.get("ssjg").setValue("");
        mini.get("ssjg").setText("");
        mini.get("bhzjg").setValue(false);
    }

    function onOk() {
        var rows = grid.getSelecteds();
        var jsbh = mini.get("jsbh").getValue();

        var yhbhList = [];
        for ( var i = 0 , l = rows.length ; i < l ; i++){
            var r = rows[i];
            yhbhList.push(r.yhbh);
        }
        yhbhList = yhbhList.join(",");

        mini.confirm("确定是删除所选用户已拥有角色？", "确定？",
            function (action) {
                if (action == "ok") {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/role/comfirmRemoveStaff",
                        type: "post",
                        data: { "yhbhList" : yhbhList , "jsbh" : jsbh } ,
                        success: function (text) {
                            CloseWindow("ok");
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert(jqXHR.responseText);
                        }
                    });
                }
            }
        );

    }


    function ssjgmcRenderer(e) {
        if(e.value == "" || e.value == null) return "暂无归属部门";
    }


</script>

</html>
