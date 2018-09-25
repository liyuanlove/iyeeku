<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/21
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/tag_res.jsp"%>
<html>
<head>
    <sec:csrfMetaTags/>
    <title>菜单树选择</title>
    <%@ include file="../../common/jscss_res.jsp"%>
</head>
<body>

    <div class="mini-toolbar" style="text-align: center; line-height: 30px;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
        <label></label>
        <input id="key" class="mini-textbox" style="width: 150px;" maxlength="64">
        <a class="mini-button" icon-Cls="icon-search" onclick="">搜索</a>
    </div>

    <div class="mini-fit">
        <input id="parent" name="parent" class="mini-hidden">
        <ul id="tree1" class="mini-tree" url="/menu/findAllMenu" style="width: 100%;height: 100%;"
            showTreeIcon="true" textField="text" idField="id" parentField="pid" dataField="treeNodes"
            resultAsTree="false" expandOnLoad="true" onnodedblclick="" onnodeselect="onNodeSelect">
        </ul>
    </div>

    <div class="mini-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
        <a class="mini-button" iconCls="icon-close" onclick="onCancel()">取消</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="mini-button" iconCls="icon-ok" id="btnOk" enabled="false" onclick="onOk()">确定</a>
    </div>

</body>
<script type="text/javascript">
    mini.parse();
    var tree = mini.get("tree1");

    function SetData(data) {
        var data = mini.clone(data);
        mini.get("parent").setValue(data.parent);
        if(mini.get("parent").getValue() == "1"){
            nodes = tree.getAllChildNodes( tree.getRootNode() );
            for (var i = 0 ; i < nodes.length ; i++){
                var node = nodes[i];
                if (node.cdurl){
                    tree.hideNode(node);
                }
            }
        }
    }

    function GetData() {
        var node = tree.getSelectedNode();
        return node;
    }

    function onNodeSelect(e) {
        if (e.select){
            mini.get("btnOk").enable();
        }else{
            mini.get("btnOk").disable();
        }
    }

    //节点双击事件
    function onNodeDblClick() {
        onOk();
    }

    function onOk() {
        CloseWindow("ok");
    }



</script>
</html>
