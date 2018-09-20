<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/20
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Map" %>
<%@ page import="com.iyeeku.core.util.JsonUtil" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Object errStack = request.getAttribute("errStack");
    Object newErrorStack = "";
    if (errStack != null){
        try {
            Map<String,Object> map = JsonUtil.json2Bean(errStack.toString() , HashMap.class);
            if (map != null){
                newErrorStack = JsonUtil.bean2Json(map);
            }else{
                newErrorStack = errStack;
            }
        }catch (Exception e){
            newErrorStack = "{\"errMsg\":\"将错误信息转换为JSON串时出错，请联系管理员！\"}";
        }
    }
%>

<%=newErrorStack%>