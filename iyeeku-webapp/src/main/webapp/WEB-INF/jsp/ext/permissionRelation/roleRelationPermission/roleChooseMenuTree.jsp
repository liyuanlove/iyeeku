<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/19
  Time: 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../common/tag_res.jsp"%>
<html>
<head>
    <sec:csrfMetaTags/>
    <title>角色分配菜单选中页面</title>
    <%@ include file="../../../common/jscss_res.jsp"%>
</head>
<body>
<div class="mini-fit">
    <input id="jsbh" name="jsbh" class="mini-hidden">
    <ul id="tree1" class="mini-tree" style="width: 100%;height: 100%;" showTreeIcon="true"
        textField="text" idField="id" parentField="pid" dataField="treeNodes" resultAsTree="false"
        expandOnLoad="true" expandOnDbClick="false" showCheckBox="true" showFolderCheckBox="true">
    </ul>
</div>

<div class="mini-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
    <a class="mini-button" iconCls="icon-cancel" onclick="onCancel()">取消</a>
    <span style="display:inline-block;width:25px;"></span>
    <a class="mini-button" iconCls="icon-ok" id="okBtn" onclick="onOk()">确定</a>
    <span style="display:inline-block;width:25px;"></span>
</div>
</body>
<script type="text/javascript">
    mini.parse();


    function Map() {
        this.elements = new Array();

        //获取MAP元素个数
        this.size = function() {
            return this.elements.length;
        }

        //判断MAP是否为空
        this.isEmpty = function() {
            return(this.elements.length < 1);
        }

        //删除MAP所有元素
        this.clear = function() {
            this.elements = new Array();
        }

        //向MAP中增加元素（key, value)
        this.put = function(_key, _value) {
            this.elements.push( {
                key : _key,
                value : _value
            });
        }

        //删除指定KEY的元素，成功返回True，失败返回False
        this.remove = function(_key) {
            var bln = false;
            try{
                for(i = 0; i < this.elements.length; i++) {
                    if(this.elements[i].key == _key) {
                        this.elements.splice(i, 1);
                        return true;
                    }
                }
            } catch(e) {
                bln = false;
            }
            return bln;
        }

        //获取指定KEY的元素值VALUE，失败返回NULL
        this.get = function(_key) {
            try{
                for(i = 0; i < this.elements.length; i++) {
                    if(this.elements[i].key == _key) {
                        return this.elements[i].value;
                    }
                }
            } catch(e) {
                return null;
            }
        }

        //获取指定索引的元素（使用element.key，element.value获取KEY和VALUE），失败返回NULL
        this.element = function(_index) {
            if(_index < 0 || _index >= this.elements.length) {
                return null;
            }
            return this.elements[_index];
        }

        //判断MAP中是否含有指定KEY的元素
        this.containsKey = function(_key) {
            var bln = false;
            try{
                for(i = 0; i < this.elements.length; i++) {
                    if(this.elements[i].key == _key) {
                        bln = true;
                    }
                }
            } catch(e) {
                bln = false;
            }
            return bln;
        }

        //判断MAP中是否含有指定VALUE的元素
        this.containsValue = function(_value) {
            var bln = false;
            try{
                for(i = 0; i < this.elements.length; i++) {
                    if(this.elements[i].value == _value) {
                        bln = true;
                    }
                }
            } catch(e) {
                bln = false;
            }
            return bln;
        }

        //获取MAP中所有VALUE的数组（ARRAY）
        this.values = function() {
            var arr = new Array();
            for(i = 0; i < this.elements.length; i++) {
                arr.push(this.elements[i].value);
            }
            return arr;
        }

        //获取MAP中所有KEY的数组（ARRAY）
        this.keys = function() {
            var arr = new Array();
            for(i = 0; i < this.elements.length; i++) {
                arr.push(this.elements[i].key);
            }
            return arr;
        }
    }




    var csMap = new Map();
    var jsbh = mini.get("jsbh");
    
    function SetData(data) {
        //跨页面传递的数据对象，克隆后才可以安全使用
        data = mini.clone(data);
        jsbh = data.jsbh;
        mini.get("jsbh").setValue(jsbh);
        var tree = mini.get("tree1");
        tree.load("/commonPer/findChooseAllMenu?jsbh="+jsbh);

        $.ajax({
            url: "/commonPer/findPerParentMenu",
            type : "post",
            data : {jsbh:jsbh},
            cache: false,
            success: function (text) {
                var o = mini.clone(text);
                for (var i = 0 ; i < o.treeNodes.length ; i++){
                    csMap.put(o.treeNodes[i].id , o.treeNodes[i].cdurl);
                    //csMap[o.treeNodes[i].id] = o.treeNodes[i].cdurl;  //将拥有的父节点菜单权限存在csMap对象中
                }
            }
        });

        $.ajax({
            url: "/commonPer/findRoleMenu",
            type : "post",
            data : {jsbh:jsbh},
            cache: false,
            success: function (text) {
                var o2 = mini.clone(text);
                for (var i = 0 ; i < o2.treeNodes.length ; i++){
                    csMap.put(o2.treeNodes[i].id , o2.treeNodes[i].cdurl);
                    //csMap[o2.treeNodes[i].id] = o2.treeNodes[i].cdurl;  //将拥有的子节点菜单权限存在csMap对象中
                    var node2 = tree.findNodes(function (node) {
                       if (node.id == o2.treeNodes[i].id)
                           return true;
                    });
                    tree.checkNodes(node2);   //将角色拥有的子节点权限菜单选择
                }
            }
        });
    }
    
    function onOk() {
        var menuTree = mini.get("tree1");
        var checkNodes = menuTree.getCheckedNodes(true); //获取Check选中的多个节点，包括父亲节点

        var addCdbhs = [];
        var addCdurlbhs = [];
        var addCdurls = [];
        var delCdbhs = [];
        var delCdurls = [];
        var yxzMap = new Map();
        var zjMap = new Map(); //角色已拥有的菜单权限和角色可分配的菜单权限交集,用来判断 delCdbhs , delCdurls 的值
        for (var i = 0 ; i < checkNodes.length ; i++){
            yxzMap.put(checkNodes[i].id , checkNodes[i].id);
            //yxzMap[checkNodes[i].id] = checkNodes[i].id ; //将已选中的菜单存入yxzMap中
            //判断初始化数据中是否选中的菜单，不在说明是 addCdbhs
            if( !csMap.containsKey(checkNodes[i].id) ){
                addCdbhs.push(checkNodes[i].id);
                if(checkNodes[i].cdurlbh != "" && checkNodes[i].cdurlbh != null){
                    addCdurlbhs.push(checkNodes[i].cdurlbh);
                }
                if(checkNodes[i].cdurl != "" && checkNodes[i].cdurl != null){
                    addCdurls.push(checkNodes[i].cdurl);
                }
            }
        }

        for(var i = 0 ; i < menuTree._dataSource.dataview.length ; i++){
            if( csMap.containsKey(menuTree._dataSource.dataview[i].id) ){
                //zjMap.put(menuTree._dataSource.dataview[i].id , menuTree._dataSource.dataview[i].cdurl);
                //zjMap[menuTree._dataSource.dataview[i].id] = menuTree._dataSource.dataview[i].cdurl;
                zjMap.put(menuTree._dataSource.dataview[i].id , menuTree._dataSource.dataview[i].cdurl);
            }
        }

        console.info(zjMap.size());

        for(var i = 0 ; i < zjMap.size() ; i++){
            if( !yxzMap.containsKey(zjMap.keys()[i])){
                delCdbhs.push(zjMap.keys()[i]);
                delCdurls.push(zjMap.values()[i]);
            }
        }



        var addCdbh = addCdbhs.join(",");
        var addCdurl = addCdurls.join(",");
        var delCdbh = delCdbhs.join(",");
        var delCdurl = delCdurls.join(",");

        console.info(addCdbh);
        console.info(addCdurl);
        console.info(delCdbh);
        console.info(delCdurl);

        var jsbh = mini.get("jsbh").getValue();
        var sqzylx = 'CD';

        $.ajax({
            url: "/roleRelationPer/addRoleMenuPer",
            type : "post",
            data : {jsbh : jsbh , addCdbh : addCdbh , addCdurl : addCdurl , delCdbh : delCdbh , delCdurl : delCdurl , sqzylx : sqzylx},
            cache: false,
            success: function (text) {

            }
        });

    }
    


</script>

</html>
