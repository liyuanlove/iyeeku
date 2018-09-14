<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/4
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html> <!-- 真呢吗恶心 -->
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>XXX管理系统</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/boot.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/res/third-party/scrollbar/jquery.mCustomScrollbar.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/res/third-party/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/frame1/res/menu/menu.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/frame1/res/menu/menu.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/frame1/res/menutip.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/frame1/res/tabs.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/frame1/res/frame.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/frame1/res/index.css"/>
<%--    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/scripts/miniui/themes/pure/skin.css">--%>
</head>
<body>

<div class="navbar">
    <div class="navbar-header">
        <div class="navbar-brand">MiniUI</div>
        <div class="navbar-brand navbar-brand-compact">M</div>
    </div>
    <ul class="nav navbar-nav">
        <li><a id="toggle"><span class="fa fa-bars" ></span></a></li>
        <li class="icontop"><a href="#" onclick="loadTab()"><i class="fa fa-hand-pointer-o"></i><span >开发日志</span></a></li>
        <li class="icontop"><a href="#"><i class="fa fa-puzzle-piece"></i><span >开发文档</span></a></li>
        <li class="icontop"><a href="#"><i class="fa fa-sort-amount-asc"></i><span >人力资源</span></a></li>
        <li class="icontop"><a href="#"><i class="fa  fa-cog"></i><span >系统设置</span></a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
        <li ><a href="#"><i class="fa fa-paper-plane"></i> 代办事项</a></li>
        <li><a href="#"><i class="fa fa-pencil-square-o"></i> 修改密码</a></li>
        <li class="dropdown">
            <a class="dropdown-toggle userinfo">
                <img class="user-img" src="${pageContext.request.contextPath}/frame1/res/images/user.jpg" />个人资料<i class="fa fa-angle-down"></i>
            </a>
            <ul class="dropdown-menu pull-right">
                <li ><a href="#"><i class="fa fa-eye "></i> 用户信息</a></li>
                <li><a href="#"><i class="fa fa-user"></i> 退出登录</a></li>
            </ul>
        </li>
    </ul>
</div>

<div class="container">

    <div class="sidebar">
        <div class="sidebar-toggle"><i class = "fa fa-fw fa-dedent" ></i></div>
        <div id="mainMenu"></div>
    </div>

    <div class="main">
        <div id="mainTabs" class="mini-tabs main-tabs" activeIndex="0" style="height:100%;" plain="false"
             buttons="#tabsButtons" arrowPosition="side" >
            <div name="index" iconCls="fa-android" title="首页" url="/page/list">
                MiniUI导航框架
            </div>
        </div>
        <div id="tabsButtons">
            <a class="tabsBtn"><i class="fa fa-home" onclick="backHomeTab()"></i></a>
            <a class="tabsBtn"><i class="fa fa-refresh" onclick="refreshCurrentTab()"></i></a>
            <a class="tabsBtn"><i class="fa fa-remove" onclick="removeCurrentTab()"></i></a>
            <a class="tabsBtn"><i class="fa fa-arrows-alt"></i></a>
        </div>
    </div>

</div>

</body>

<script type="text/javascript">

    function loadTab() {
        var item = { id : "developLogPage", text : "开发日志" ,
            url : "/develop/list" , iconCls : ""};
        activeTab(item);
    }

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

        var menu = new Menu("#mainMenu", {
            itemclick: function (item) {
                if (!item.children) {
                    activeTab(item);
                }
            }
        });

        $(".sidebar").mCustomScrollbar({ autoHideScrollbar: true });

        new MenuTip(menu);

        $.ajax({
            url: "${pageContext.request.contextPath}/menu/navMenu",
            success: function (text) {
                var data = mini.decode(text);
                menu.loadData(data);
            }
        })

        //toggle
        $("#toggle, .sidebar-toggle").click(function () {
            $('body').toggleClass('compact');
            mini.layout();
        });

        //dropdown
        $(".dropdown-toggle").click(function (event) {
            $(this).parent().addClass("open");
            return false;
        });

        $(document).click(function (event) {
            $(".dropdown").removeClass("open");
        });
    });
    
    function backHomeTab() {
        var tabs = top.mini.get("mainTabs");
        var tab = tabs.getTab("index");
        if (!tab) {
            //tab = { name: item.id, title: item.text, url: item.url, iconCls: item.iconCls, showCloseButton: true };
            //tab = tabs.addTab(tab);
        }
        tabs.activeTab(tab);
    }
    
    function refreshCurrentTab() {
        var tab = mini.get("mainTabs").getActiveTab();
        if(tab){
            mini.get("mainTabs").reloadTab(tab);
        }
    }

    function removeCurrentTab(){
        var tab = mini.get("mainTabs").getActiveTab();
        if(tab){
            //sleep(500);
            mini.get("mainTabs").removeTab(tab);
        }
    }

    function sleep(n) {
        var start = new Date().getTime();
        while(true){
            if(new Date().getTime() - start > n){
                break;
            }
        }
    }


</script>

</html>
