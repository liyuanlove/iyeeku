<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/4
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理系统首页</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/boot.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/frame/res/menu/menu.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/frame/res/menu/menu.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/frame/res/tabs.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/frame/res/frame.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/frame/res/index.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/scripts/miniui/themes/pure/skin.css">
</head>
<body>

<div class="navbar">
    <div class="navbar-header">
        <div class="navbar-brand">MiniUI</div>
    </div>
    <div class="nav navbar-nav top-menu">
        <div id="mainMenu"></div>
    </div>
    <ul class="nav navbar-nav navbar-right">
        <li><input class="search-input" type="text" placeholder="搜索" /></li>
        <li><a href="#"><i class="fa fa-user"></i></a></li>
        <li><a href="#"><i class="fa fa-comments"></i></a></li>
        <li><a href="#"><i class="fa fa-tasks"></i></a></li>
        <li class="dropdown">
            <a class="dropdown-toggle userinfo">
                <img class="user-img" src="${pageContext.request.contextPath}/frame/res/images/user.jpg" />个人资料<i class="fa fa-angle-down"></i>
            </a>
            <ul class="dropdown-menu pull-right">
                <li><a href="#"><i class="fa fa-user "></i>个人设置</a></li>
                <li class="divider"></li>
                <li>
                    <a href="#"> <i class="fa fa-question-circle-o"></i>帮助文档</a>
                </li>
                <li><a href="#"><i class="fa fa-arrows-alt"></i>全屏</a></li>
                <li><a href="#"><i class="fa fa-lock "></i>锁住系统</a></li>
                <li><a href="#"><i class="fa fa-key "></i>注销</a></li>
            </ul>
        </li>
    </ul>
</div>

<div class="container">
    <div id="mainTabs" class="mini-tabs" activeIndex="0" style="height:100%;" plain="false"
         buttons="#tabsButtons" arrowPosition="side">
        <div name="index" iconCls="fa-android" title="控制台">

        </div>
    </div>
    <div id="tabsButtons">
        <a class="tabsBtn"><i class="fa fa-home"></i></a>
        <a class="tabsBtn"><i class="fa fa-refresh"></i></a>
        <a class="tabsBtn"><i class="fa fa-remove"></i></a>
        <a class="tabsBtn"><i class="fa fa-arrows-alt"></i></a>
    </div>
</div>

<script type="text/javascript">
    function activeTab(item) {
        var tabs = mini.get("mainTabs");
        var tab = tabs.getTab(item.id);
        if (!tab) {
            tab = { name: item.id, title: item.text, url: item.url, iconCls: item.iconCls, showCloseButton: true };
            tab = tabs.addTab(tab);
        }
        tabs.activeTab(tab);
    }

    $(function () {

        //menu
        var menu = new Menu("#mainMenu", {
            itemclick: function (item) {
                //console.info();
                if (!item.children) {
                    activeTab(item);
                    $(this).blur()
                }
            }
        });

        $.ajax({
            url: "${pageContext.request.contextPath}/frame/data/menu.txt",
            success: function (text) {
                var data = mini.decode(text);
                menu.loadData(data);
            }
        })

        //dropdown
        $(".dropdown-toggle").click(function (event) {
            $(this).parent().addClass("open");
            return false;
        });

        $(document).click(function (event) {
            $(".dropdown").removeClass("open");
        });
    });

</script>

</body>
</html>
