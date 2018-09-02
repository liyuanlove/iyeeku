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
<div id="form1" >
    <table>
        <tr>
            <td><label for="jsmc">角色名称：</label></td>
            <td>
                <input id="jsmc"  name="jsmc" class="mini-textbox" required="true" />
            </td>
        </tr>
        <tr>
            <td><label for="jsmc">角色类型：</label></td>
            <td>
                <input id="jslx" name="jslx" class="mini-textbox" required="true"/>
            </td>
        </tr>
        <tr>
            <td><label for="jsmc">角色描述：</label></td>
            <td>
                <input id="jsms" name="jsms" class="mini-textbox" required="true"/>
            </td>
        </tr>


        <tr>
            <td>

            </td>
            <td>
                <input value="SubmitFrom" type="button" onclick="submitForm()" />
            </td>
        </tr>
    </table>
</div>

<script type="text/javascript">
    mini.parse();

    function submitForm() {
        //提交表单数据
        var form = new mini.Form("#form1");
        var data = form.getData();      //获取表单多个控件的数据
        var json = mini.encode(data);   //序列化成JSON
        $.ajax({
            url: "${pageContext.request.contextPath}/role/add",
            type: "post",
            //data: { submitData: json },
            data: data ,
            success: function (text) {
                alert("提交成功，返回结果:" + text);
            }
        });

    }

</script>

</body>
</html>
