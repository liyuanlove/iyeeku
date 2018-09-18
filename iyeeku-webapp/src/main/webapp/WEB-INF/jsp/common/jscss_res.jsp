<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/boot.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/scripts/miniui/themes/pure/skin.css">

<script type="text/javascript">

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $.ajaxSetup({
        beforeSend:function(xhr){
            xhr.setRequestHeader(header, token);
        }
    });

    function showTips(Msg,state) {
        var x = "center";
        var y = "top";
        var state = state;
        mini.showTips({
            content: "<b>成功</b> <br/>"+Msg,
            state: state,
            x: x,
            y: y,
            timeout: 3000
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