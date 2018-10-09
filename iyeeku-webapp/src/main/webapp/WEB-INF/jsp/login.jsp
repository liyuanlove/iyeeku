<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/13
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/tag_res.jsp"%>
<html>
<head>
    <sec:csrfMetaTags/>
    <title>登陆页面</title>
    <%@ include file="common/jscss_res.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/sha1.min.js"></script>
</head>
<body>

<div style="width: 100%;height: 40px;"></div>
<div style="text-align: center;">

<h2>IYEEKU管理系统登陆</h2>

<form name="loginForm" id="form1" method="post">
    <p>j_username: <input id="username" class="mini-textbox" name="j_username" /></p>
    <p>j_password:  <input id="password" class="mini-password" name="j_password" onenter="Button_submit_onClick()" /></p>
    <input class="mini-hidden" name="j_usertype" value="StaffCode"/><!-- StaffCode , NotesID -->
<%--    <input type="submit" value="Submit" />--%>
    <a class="mini-button" style="width: 228px;cursor: hand;" onclick="Button_submit_onClick(this)">登陆</a>
</form>
</div>

</body>
<script type="text/javascript">
    mini.parse();

    var form = new mini.Form("#form1");

    $(function () {
        //如果本页面不是顶层窗口，则跳转到顶层窗口
        var top = mini.getTopWindow(window);
        var parentHref = top.location.href;

        if (parentHref != '' && parentHref.indexOf('<%= request.getContextPath()%>/login/login') < 0){
            top.location.href = window.location.href;
        }else{
            //mini.get("username").focus();

        }

    });

    function Button_submit_onClick() {

        var username = mini.get("username").getValue();
        if (username == null || username == ''){
            showTips("用户名不能为空！" , "danger");
            return;
        }

        var password = mini.get("password").getValue();
        if (password == null || password == ''){
            showTips("密码不能为空！" , "danger");
            return;
        }

        password = sha1(password);
        mini.get("password").setValue(password);

        var formObj = $("#form1")[0];
        formObj.action = appContext + "/j_spring_security_check";
        formObj.submit();


/*        $.ajax({
            url : appContext + "/j_spring_security_check" ,
            data : form.getData()
        });*/

/*        form.action = appContext + "/j_spring_security_check";
        form.submit;*/

        //alert(sha1('123456'));
    }

</script>


</html>
