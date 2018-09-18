<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/13
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆页面</title>
</head>
<body>

<h2>登陆页面</h2>

<form action="/j_spring_security_check" method="get">
    <p>j_username: <input type="text" name="j_username" /></p>
    <p>j_password: <input type="text" name="j_password" /></p>
    <input type="hidden" name="j_usertype" value="StaffCode"/><!-- StaffCode , NotesID -->
    <input type="submit" value="Submit" />
</form>

</body>
</html>
