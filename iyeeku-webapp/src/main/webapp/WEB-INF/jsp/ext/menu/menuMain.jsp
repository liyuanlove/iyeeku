<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/5
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/tag_res.jsp"%>
<html>
<head>
    <sec:csrfMetaTags/>
    <title>菜单配置页面</title>
    <%@ include file="../../common/jscss_res.jsp"%>
</head>
<body>

<!-- 左右布局方式 -->
<div class="mini-splitter" style="width:100%;height:100%;" borderStyle="border:0px">
    <!-- 左侧:菜单树 -->
    <div size="20%" showCollapseButton="false" expanded="true" style="padding:0px;border-right: 0;">
        <div class="mini-panel" title="菜单树" iconCls="" style="width: 100%;height: 100%;" showToolbar="false" showCloseButton="false">

            <ul id="tree1" class="mini-tree" style="width: 100%;height: 100%;padding: 5px;"
             url="${pageContext.request.contextPath}/menu/findAllMenu"
             showTreeIcon="true" textField="text" idField="id" parentField="pid" dataField="treeNodes"
             resultAsTree="false" onnodeselect="onNodeSelect" autoCheckParent="true" expandOnLoad="true">
            </ul>

        </div>
    </div>
    <!-- 右侧:菜单详情 -->
    <div size="80%" showCollapseButton="false" expanded="true" style="padding:0px;border-left: 0;">
        <div class="mini-panel" title="菜单信息" iconCls="" style="width: 100%;height: 100%;"
             showToolbar="true" showFooter="false" showCloseButton="false">
            <div property="toolbar" style="height: 30px;">
                <table style="width: 100%;">
                    <tr>
                        <td style="width:100%;">
                            <a class="mini-button" iconCls="icon-addnew" onclick="addMenu()">新增</a>
                            <a class="mini-button" iconCls="icon-edit" onclick="edit()" enabled="false" id="delBtn">删除</a>
                            <a class="mini-button" iconCls="icon-remove" onclick="submitForm()" enabled="false" id="saveBtn">保存</a>
                        </td>
                        <td style="white-space:nowrap;">
                            <a class="mini-button" id="refreshUrl" onclick="refreshUrl()">刷新URL</a>
                        </td>
                    </tr>

                </table>
            </div>

            <table style="width: 100%;height: 30%;">
                <tr>
                    <td>
                        <table style="width: 100%;height: 100%;">
                            <tr>
                                <td>
                                    <form id="form1" style="width: 100%;height: 100%;">
                                        <input name="cdbh" class="mini-hidden">
                                        <input name="cdbm" class="mini-hidden">
                                        <table style="table-layout: fixed;width: 100%;height: 100%;">
                                            <colgroup>
                                                <col width="15%"/>
                                                <col width="20%"/>
                                                <col width="20%"/>
                                                <col width="20%"/>
                                            </colgroup>
                                            <tr>
                                                <td align="right" style="padding-top: 5px;">菜单名称：</td>
                                                <td align="left" style="padding-top: 5px;">
                                                    <input id="cdmc" name="cdmc" class="mini-textbox" style="width: 180px;" required="true" vtype="rangeChar:1,64">
                                                </td>
                                                <td align="right">菜单图片名称：</td>
                                                <td align="left">
                                                    <input id="cdtp" name="cdtp" class="mini-textbox" style="width: 180px;" required="false" vtype="rangeChar:0,64">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">菜单打开方式：</td>
                                                <td align="left">
                                                    <input id="cddkfs" name="cddkfs" class="mini-combobox" style="width: 180px;"
                                                           textField="text" valueField="id"  url="${pageContext.request.contextPath}/directory/loadDict/menuOpenType"
                                                           onvaluechanged="checkValueChanged(this)">
                                                </td>
                                                <td align="right">菜单路径：</td>
                                                <td align="left">
                                                    <input id="cdurl" name="cdurl" class="mini-buttonedit" style="width: 180px;" onbuttonclick="onButtonEditUrl" selectOnFocus="true" allowInput="false">
                                                    <input id="wbcdurl" name="wbcdurl" class="mini-textbox" style="width: 160px;display: none;" required="true" vtype="rangeChar:2,255" allowInput="true">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">同级菜单顺序号：</td>
                                                <td align="left">
                                                    <input id="cdsxh" name="cdsxh" class="mini-spinner" style="width: 180px;" required="true" vtype="int;rangeChar:0,8" allowInput="false" onvaluechanged="checkValueChanged(this)">
                                                </td>
                                                <td align="right">是否相对路径：</td>
                                                <td align="left">
                                                    <input id="sfxdlj" name="sfxdlj" class="mini-checkbox" value="true" trueValue="1" falseValue="0" checked="true" readonly="false" onvaluechanged="checkValueChanged(this)">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">上级菜单名称：</td>
                                                <td align="left">
                                                    <input id="sjcdbh" name="sjcdbh" class="mini-buttonedit" style="width: 180px;" onbuttonclick="" selectOnFocus="true" allowInput="false">
                                                </td>
                                                <td align="right">是否启用：</td>
                                                <td align="left">
                                                    <input id="cdsfky" name="cdsfky" class="mini-checkbox" value="true" trueValue="1" falseValue="0" checked="true" readonly="false" onvaluechanged="checkValueChanged(this)">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">菜单类型：</td>
                                                <td align="left">
                                                    <input id="cdlx" name="cdlx" class="mini-combobox" style="width: 180px;" allowInput="false" required="true"
                                                           textField="text" valueField="id"  url="${pageContext.request.contextPath}/directory/loadDict/menuType">
                                                </td>
                                                <td align="right">是否可见：</td>
                                                <td align="left">
                                                    <input id="cdsfkj" name="cdsfkj" class="mini-checkbox" value="true" trueValue="1" falseValue="0" checked="true" readonly="false" onvaluechanged="checkValueChanged(this)">
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </td>
                            </tr>

                            <!-- 关联URL -->
                            <tr>
                                <td>
                                    <table style="table-layout: fixed;width: 100%;">
                                        <colgroup>
                                            <col width="15%">
                                            <col width="65%">
                                        </colgroup>
                                        <tr>
                                            <td align="right" style="height: 40%;" height="40%"></td>
                                            <td align="left">
                                                <table style="width: 80%;height: 100%;">
                                                    <tr>
                                                        <td>
                                                            <a class="mini-button" id="relationUrl" iconCls="" onclick="">关联URL</a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 210px;width: 100%;">
                                                            <div id="datagrid1" datafld="data" class="mini-datagrid" style="width:100%;height:100%;" allowResize="true"
                                                                 url="${pageContext.request.contextPath}/codetype/findAllTypes" allowUnselect="false" sortMode="client"
                                                            >
                                                                <div property="columns">
                                                                    <div type="indexcolumn">序号</div>
                                                                    <div field="urlbh" width="120" headerAlign="center" allowSort="false" visible="false">URL编号</div>
                                                                    <div field="urllj" width="120" headerAlign="left" allowSort="true">URL路径</div>
                                                                    <div field="url描述" width="120" headerAlign="left" allowSort="true">URL描述</div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                    </table>
                                </td>
                            </tr>
                            <!-- 关联URL  END  -->
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>

</div>
</body>

<script type="text/javascript">
    mini.parse();

    var tree = mini.get("tree1");
    var form = new mini.Form("#form1");

    // 页面初始化加载时，菜单表单控件全部设置为只读，不可以操作
    setReadOnly();
    // 设置按钮不可用
    controlBtnState();

    // 判断是否更新，为 oldform 赋值
    var oldFormData;
    if(!oldFormData){
        oldFormData = form.getData();
    }

    // 选中菜单节点事件
    function onNodeSelect(e) {
        var node = e.node; //获取菜单节点
        var isLeaf = e.isLeaf;  //是否是叶子节点

        setMenuData(node);

        setInputModel();    //设置菜单表单可编辑

        if(isLeaf){
            mini.get("delBtn").enable();
            mini.get("cdlx").enable();
            if(e.node.cdurl == "" || e.node._satet == "added"){
                mini.get("relationUrl").disable();
            }else {
                mini.get("relationUrl").enable();
            }
        }else{
            mini.get("delBtn").disable();
            mini.get("relationUrl").disable();
            mini.get("cdlx").disable();
        }

        var ralationgrid = mini.get("datagrid1");
        //ralationgrid.load({cdbh:node.id});
        if(node.id == "DEFAULT_MENUTREE_ROOT"){
            setReadOnly();
        }

    }
    
    
    function addMenu() {
        var tree = mini.get("tree1");
        var tNode = tree.getSelectedNode();
        if(tNode == null){
            alert("请选择节点");
            return;
        }
        if((tree.getValue(false) == null) || (tree.getValue(false) == "")){
            alert("请先保存");
            return;
        }
        if(tNode.cdurl != null){
            alert("该菜单有对应的菜单路径，不能添加子菜单！");
            return;
        }
        var newNode = {};
        var node = tree.addNode(newNode , "add" , tNode);
        tree.setNodeText( newNode , "新建菜单");
        tree.selectNode(newNode); // 选中新建了的节点
        if (tNode){
            tree.expandNode(tNode);  //展开节点
        }
        var parentNode = tree.getParentNode(newNode);
        changeCDURL("cddkfs","0",null);
        mini.get("relationUrl").disable();


    }

    //页面传递JSON数据，数据从后台获取
    function setMenuData(node) {
        var cdbh = node.id;  //获取菜单编号
        if(!cdbh){
            cdbh = "";
        }
        var url = "${pageContext.request.contextPath}/menu/getMenuInfoByCdbh";
        $.ajax({
            url: url,
            type: "post",
            data: { "cdbh" : cdbh } ,
            cache: false,
            success: function (text) {
                var o = mini.decode(text);
                var form = new mini.Form("#form1"); //普通form 转换为mini的form

                var sjcdmc = mini.get("sjcdbh");
                var menuUrl = mini.get("cdurl");

                sjcdmc.setValue(o.sjcdbh);
                if(o.sjcdbh == "DEFAULT_MENUTREE_ROOT"){
                    sjcdmc.setText("菜单树");
                }else{
                    sjcdmc.setText(o.sjcdmc);
                }

                menuUrl.setText(o.cdurl);
                if(o.cdlx != null && o.cdlx != ""){
                    mini.get("cdlx").disable();
                }

                if(o.cdbh == null){
                    var parentNode = tree.getParentNode(node);
                    sjcdmc.setText(parentNode.text);
                    o.sjcdbh = parentNode.id;
                }
                if(o.sfxdlj == null){
                    o.sfxdlj = 1;
                }
                if(o.cddkckszwz == null){
                    o.cddkckszwz = "_self";
                }
                if(o.cddkfs == null){
                    o.cddkfs = "0";
                }
                if(o.cdsfky == null){
                    o.cdsfky = 1;
                }
                if(o.cdsfkj == null){
                    o.cdsfkj = 1;
                }
                form.setData(o);
                form.setChanged(false);

                oldFormData = form.getData();  //将更新前的值赋值给 form
                if(o.cdbh != "DEFAULT_MENUTREE_ROOT" && o.cdbh != null){
                    form.validate();
                }
            }
        });
        controlBtnState();
    }

    function checkValueChanged(e) {
        changeCDURL(e.name,e.value,null);
        var oldData = mini.encode(oldFormData);
        var formData = form.getData();
        formData[e.name] = e.value;
        var newData = mini.encode(formData);
        if(oldData == newData){
            mini.get("saveBtn").disable();
        }else{
            mini.get("saveBtn").enable();
        }
    }

    function changeCDURL(name,value,url) {
        if(name == "cddkfs"){
            if(value == "0"){
                document.getElementById("cdurl").style.display="";
                document.getElementById("wbcdurl").style.display="none";
                if (url != null){
                    mini.get("cdurl").setText(url);
                    mini.get("cdurl").setValue(url);
                }else{
                    mini.get("cdurl").setText("");
                    mini.get("cdurl").setValue(null);
                }
            } else {
                document.getElementById("wbcdurl").style.display="";
                document.getElementById("cdurl").style.display="none";
                if (url != null){
                    mini.get("wbcdurl").setValue(url);
                }else{
                    mini.get("wbcdurl").setValue(null);
                }
            }

        }

    }

    function onButtonEditUrl(e) {
        var btnEdit = this;
        mini.open({
            url: "${pageContext.request.contextPath}/menu/menuPathForm",
            title: "URL选择", width: 600, height: 480,
            onload: function () {
            },
            ondestroy: function (action) {
                if( action != null && action != "cancel"){
                    btnEdit.setText(action.urllj);
                    btnEdit.setValue(action.urllj);
                    checkValueChanged(e);
                }
            }
        });
    }

    // 设置按钮不可用
    function controlBtnState() {
        mini.get("delBtn").disable();
        mini.get("saveBtn").disable();
        mini.get("relationUrl").disable();
    }

    function submitForm() {
        form.validate();
        if(!form.isValid()){
            return;
        }

        var data = form.getData();      //获取表单多个控件的数据
        $.ajax({
            url: "/menu/saveOrUpdate",
            type: "post",
            data: data ,
            success: function (text) {
                location.reload(); //重新刷新当前页面
                                    //重新刷新菜单缓存
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });

    }
    
    //设置可编辑
    function setInputModel() {
        var fields = form.getFields();
        for ( var i = 0 , size = fields.length; i < size ; i++ ){
            var c = fields[i];
            if(c.setReadOnly) c.setReadOnly(false);  //只读
            if(c.removeCls) c.removeCls("asLable");  //增加 asLable 样式外观
        }
        mini.repaint(document.body); // 关键
    }

    function setReadOnly() {
        var fields = form.getFields();
        for ( var i = 0 , size = fields.length; i < size ; i++ ){
            var c = fields[i];
            if(c.setReadOnly){
                c.setReadOnly(true);  //只读
            }
            if(c.setIsValid) c.setIsValid(true);  //去除错误提示
            if(c.addCls) c.addCls("asLable");  //增加 asLable 样式外观
        }
    }
    
    function refreshUrl() {
        $.ajax({
            url: "${pageContext.request.contextPath}/url/refreshUrl",
            success: function (text) {
                showTips("URL刷新成功","success");
            }
        });
    }

</script>

</html>
