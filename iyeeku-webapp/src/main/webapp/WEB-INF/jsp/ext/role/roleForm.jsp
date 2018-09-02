<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/2
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>角色表单</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/boot.js"></script>
</head>
<body>
<div class="mini-fit">
<div class="mini-fit" id="form1">
    <table border="0" cellpadding="1" cellspacing="2" style="width:100%;table-layout:fixed;">
        <tr>
            <td style="width:100px;">角色名称：</td>
            <td style="width:150px;">
                <input id="jsmc" name="jsmc" class="mini-textbox" required="true" style="width:80%;" />
            </td>
            <td style="width:100px;">角色类型：</td>
            <td style="width:150px;">
                <input id="jslx" name="jslx" class="mini-textbox" required="true" style="width:80%;" />
            </td>
        </tr>
        <tr>
            <td>角色权重：</td>
            <td>
                <input id="jsqz" name="jsqz" class="mini-spinner" style="width:80%;" />
            </td>
            <td>角色状态：</td>
            <td>
                <input id="jszt" name="jszt" class="mini-textbox" required="true" style="width: 80%;" />
            </td>
        </tr>
        <tr>
            <td >角色描述：</td>
            <td colspan="3" >
                <input name="jsms" class="mini-textarea" style="width: 90%;height:60px;"/>
            </td>
        </tr>
    </table>

</div>
</div>

<div class="mini-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
    <a class="mini-button" style="width:60px;" onclick="onOk()">确定</a>
    <span style="display:inline-block;width:25px;"></span>
    <a class="mini-button" style="width:60px;" onclick="onCancel()">取消</a>
</div>

<script type="text/javascript">
    mini.parse();

    var form = new mini.Form("#form1");
    
    function onOk() {
        SaveData();
    }

    function SaveData() {
        //提交表单数据
        //var form = new mini.Form("#form1");

        form.validate();
        if (form.isValid() == false) return;

        var data = form.getData();      //获取表单多个控件的数据
        var json = mini.encode(data);   //序列化成JSON
        $.ajax({
            url: "${pageContext.request.contextPath}/role/add",
            type: "post",
            //data: { submitData: json },
            data: data ,
            success: function (text) {
                if(text == "ok"){
                    CloseWindow("ok");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                CloseWindow();
            }
        });

    }

    function onCancel(e) {
        CloseWindow("cancel");
    }

    function CloseWindow(action) {
        if (action == "close" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow)
            return window.CloseOwnerWindow(action);
        else window.close();
    }

</script>

</body>
</html>
