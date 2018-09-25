<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/21
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/tag_res.jsp"%>
<html>
<head>
    <sec:csrfMetaTags/>
    <title>菜单关联URL选择</title>
    <%@ include file="../../common/jscss_res.jsp"%>
</head>
<body>
    <input id="cdbh" name="cdbh" class="mini-hidden">
    <input id="cdurl" name="cdurl" class="mini-hidden">
    <div style="padding-right: 10px;padding-right: 10px;width: 100%;height: 90%;">
        <div class="mini-fit">
            <table cellpadding="0" cellspacing="0" style="width: 98%;height: 100%;table-layout: fixed;">
                <colgroup>
                    <col width="35%">
                    <col width="8%">
                    <col width="35%">
                </colgroup>
                <tr>
                    <td style="width: 35%;height: 100%;">
                        <input id="key" class="mini-textbox" emptyText="请输入URL路径" style="width: 150px;" maxlength="256">
                        <a class="mini-button" iconCls="icon-search" onclick="search()">搜索</a>
                        <h4 style="margin: 0;line-height: 22px;font-size: 13px;">URL列表：</h4>
                            <div id="selectGrid" datafld="data" class="mini-datagrid" style="width:95%;height:80%;" showPager="false"
                                 showPageSize="false" showPageIndex="false" showPageInfo="false" pagerStyle="padding:2px;" multiSelect="true"
                                allowMoveColumn="false" url="${pageContext.request.contextPath}/url/listNotMenuRelationUrl" idField="urlbh"
                            >
                                <div property="columns">
                                    <div type="checkcolumn" name="select" width="15"></div>
                                    <div field="urllj" width="50" headerAlign="center" allowSort="false">URL路径</div>
                                    <div field="urlms" width="50" headerAlign="center" allowSort="false">URL描述</div>
                                </div>
                            </div>
                    </td>
                    <td align="left" style="width: 8%;height: 100%;">
                        <a class="mini-button" iconCls="icon-downgrade" onclick="addSelected()" style="width: 70px;margin-bottom: 5px;">选择</a><br/>
                        <a class="mini-button" iconCls="icon-upgrade" onclick="removeSelected()" style="width: 70px;margin-bottom: 5px;">删除</a><br/>
                    </td>
                    <td style="width: 35%;height: 100%;">
                        <br/>
                        <h4 style="margin: 0;line-height: 22px;font-size: 13px;">已选关联URL：</h4>
                        <div id="datagrid2" dataField="data" class="mini-listbox" style="width:95%;height:80%;"
                             showCheckBox="true" multiSelect="true" onitemdblclick=""
                        >
                            <div property="columns">
                                <div field="urllj" width="50" headerAlign="center" allowSort="false">URL路径</div>
                                <div field="urlms" width="50" headerAlign="center" allowSort="false">URL描述</div>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div class="mini-toolbar" style="text-align:center;padding-top:10px;padding-bottom:10px;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
        <a class="mini-button" iconCls="icon-close" onclick="onCancel()">取消</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="mini-button" iconCls="icon-ok" id="btnOk" onclick="onOk()">确定</a>
    </div>

</body>
<script type="text/javascript">
    mini.parse();

    var grid = mini.get("selectGrid");
    var selectedList = mini.get("datagrid2");

    function SetData(data) {
        //跨页面传递的数据对象，克隆后才可以安全使用
        data = mini.clone(data);
        mini.get("cdbh").setValue(data.cdbh);
        mini.get("cdurl").setValue(data.cdurl);
        grid.load({cdbh:data.cdbh,cdurl:data.cdurl});
        selectedList.load("/url/listMenuRelationUrl?cdbh="+data.cdbh);
    }
    
    function addSelected() {
        var items = grid.getSelecteds();
        // 根据id属性，来甄别要加入选中的记录
        var idField = grid.getIdField();
        //把已选中的数据，用key-value缓存，以便进一步快速匹配
        var idMaps = {};
        var selects = selectedList.getData();
        for (var i = 0 , l = selects.length ; i < l ; i++){
            var o = selects[i];
            var id = o[idField];
            idMaps[id] = o;
        }

        //遍历要加入的数组
        for (var i = items.length -1 ; i >= 0 ; i--){
            var o = items[i];
            var id = o[idField];
            if (idMaps[id] != null){
                items.removeAt(i);
            }
        }
        grid.removeRows(items , false); //删除左边已选中的行
        selectedList.addItems(items);  //添加左边选中的行到右边
        grid.doUpdate();            //删除datagrid已选择的全选框
    }
    
    function removeSelected() {
        var  items = selectedList.getSelecteds();
        selectedList.removeItems(items);
        grid.addRows( items , 0);
    }
    
    function GetData() {
        var rows = selectedList.getData();
        var ids = [] , texts = [];
        for (var i = 0 , l = rows.length ; i < l ; i++){
            var row = rows[i];
            ids.push(row.id);
            texts.push(row.name);
        }

        var data = {};
        data.id = ids.join(",");
        data.text = texts.join(",");
        return data;
    }

    function onOk() {
        var rows = selectedList.getData();
        var urlbhs = [];
        for (var i = 0 , l = rows.length ; i < l ; i++){
            //console.info(rows[i].urlbh);
            urlbhs.push(rows[i].urlbh);
        }
        var cdbh = mini.get("cdbh").getValue();
        var cdxbm = urlbhs.join(",");
        $.ajax({
            url: "/menu/addMenuRelationUrl",
            data: {cdbh:cdbh , cdxbm:cdxbm} ,
            success: function (text) {
                CloseWindow("ok");
            }
        });
    }



</script>
</html>
