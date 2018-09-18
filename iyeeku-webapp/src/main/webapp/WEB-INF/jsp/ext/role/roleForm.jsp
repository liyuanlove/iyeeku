<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/2
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/tag_res.jsp"%>
<html>
<head>
    <title>角色表单</title>
    <sec:csrfMetaTags/>
    <%@ include file="../../common/jscss_res.jsp"%>
</head>
<body>

<input class="mini-hidden" name="pageType" id="pageType" value="query">
<div class="mini-fit">
    <form id="form1">
        <div>
            <table style="table-layout: fixed;" width="100%;">
                <colgroup>
                    <col width="35%">
                    <col width="65%">
                </colgroup>
                <tr>
                    <td style="padding-bottom: 5px;" colspan="2">
                        <input name="jsbh" class="mini-hidden">
                    </td>
                </tr>
                <tr>
                    <td align="right">角色名称：</td>
                    <td align="left">
                        <input id="jsmc" name="jsmc" class="mini-textbox" emptyText="请输入角色名称" required="true" width="140" vtype="rangeChar:1.64" />
                    </td>
                </tr>
                <tr>
                    <td align="right">角色类型：</td>
                    <td align="left">
                        <input id="jslx" name="jslx" class="mini-combobox" required="true" width="140" onvaluechanged="checkValueChanged(this);"
                               textField="text" valueField="id"  url="${pageContext.request.contextPath}/directory/loadDict/roleType"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">角色权重：</td>
                    <td align="left">
                        <input id="jsqz" name="jsqz" class="mini-spinner" width="140" onvaluechanged="checkValueChanged(this);" />
                    </td>
                </tr>
                <tr>
                    <td align="right">角色状态：</td>
                    <td align="left">
                        <input id="jszt" name="jszt" class="mini-combobox" required="true" width="140" onvaluechanged="checkValueChanged(this);"
                               textField="text" valueField="id"  url="${pageContext.request.contextPath}/directory/loadDict/roleState" />
                    </td>
                </tr>
                <tr>
                    <td align="right">角色描述：</td>
                    <td align="left">
                        <input name="jsms" class="mini-textarea" width="140" vtype="rangeChar:0,128"/>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</div>

<div class="mini-toolbar" style="text-align:center;padding-top:10px;padding-bottom:10px;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
    <a class="mini-button" style="width:60px;" onclick="onCancel()">取消</a>
    <span style="display:inline-block;width:25px;"></span>
    <a class="mini-button" style="width:60px;" id="okBtn" onclick="onOk()" enabled="false">确定</a>
</div>

<script type="text/javascript">
    mini.parse();

    var form = new mini.Form("#form1");

    var oldFormData;
    if(!oldFormData){
        oldFormData = form.getData();
    }

    $("#form1 :input.mini-textbox-input").keyup(ctrlOkBtn);
    $("#form1 :input.mini-textbox-input").change(ctrlOkBtn);
    
    function onOk() {
        SaveData();
    }
    
    function ctrlOkBtn() {
        var oldData = mini.encode(oldFormData);
        var formData = form.getData();
        var name = $(this).attr("name");
        formData[name] = $(this).val();
        var newData = mini.encode(formData);
        if ( oldData == newData ){
            mini.get("okBtn").disable();
        }else{
            mini.get("okBtn").enable();
        }
    }

    function checkValueChanged(e) {
        //如果角色类型是系统保留，角色状态一定是正常，且不能修改
        if(mini.get("jslx").getValue() == '4'){
            mini.get("jszt").setValue("1");
            mini.get("jszt").setReadOnly(true);
        }else{
            mini.get("jszt").setReadOnly(false);
        }
        //控制确定按钮状态
        var oldData = mini.encode(oldFormData);
        var formData = form.getData();
        formData[e.name] = e.value;
        var newData = mini.encode(formData);
        if ( oldData == newData ){
            mini.get("okBtn").disable();
        }else{
            mini.get("okBtn").enable();
        }
    }

    function SaveData() {
        form.validate();
        if (form.isValid() == false) return;

        var url = "${pageContext.request.contextPath}/role/add";
        var pageType = mini.get("pageType").getValue();
        if( pageType == "edit" ){
            url = "${pageContext.request.contextPath}/role/update";
        }
        var data = form.getData();      //获取表单多个控件的数据
        $.ajax({
            url: url,
            type: "post",
            data: data ,
            success: function (text) {
                CloseWindow("ok");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                CloseWindow();
            }
        });

    }

    function SetData(data) {
        //跨页面传递的数据对象，克隆后才可以安全使用
        data = mini.clone(data);
        mini.get("pageType").setValue(data.action);
        if (data.action == "edit") {
            $.ajax({
                url: "/role/getRoleByJsbh",
                type: 'post',
                data: { jsbh : data.jsbh },
                success: function (text) {
                    var o = mini.decode(text);
                    form.setData(o);
                    form.setChanged(false);
                    oldFormData = form.getData();
                }
            });
        }
    }

</script>

</body>
</html>
