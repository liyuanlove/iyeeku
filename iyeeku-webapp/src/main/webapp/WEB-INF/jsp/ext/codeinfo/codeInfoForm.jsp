<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/4
  Time: 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/tag_res.jsp"%>
<html>
<head>
    <sec:csrfMetaTags/>
    <title>码表条目表单</title>
    <%@ include file="../../common/jscss_res.jsp"%>

    <style type="text/css">
        .odd{
            padding-left: 20px;
        }
        .even{

        }
    </style>
</head>
<body>

<div class="mini-fit">
    <input class="mini-hidden" name="pageType" id="pageType" value="query">
    <form id="form1" method="post" style="padding-left: 8px;">
        <div style="padding-left: 8px;padding-bottom: 5px;padding-right: 10px;">
            <table style="table-layout: fixed;width: 100%;">
                <colgroup>
                    <col width="23%"/>
                    <col width="27%"/>
                    <col width="23%"/>
                    <col width="27%"/>
                </colgroup>
                <tr>
                    <td colspan="4">
                        <input name="zj" id="zj" class="mini-hidden"/>
                        <input name="sjlx" id="sjlx" class="mini-hidden"/>
                        <input name="jlzt" id="jlzt" class="mini-hidden"/>
                    </td>
                </tr>
                <tr>
                    <td class="odd">码表条目编号：</td>
                    <td>
                        <input name="mblxbh" class="mini-textbox" required="true" vtype="rangeChar:1,64">
                    </td>
                    <td class="odd">码表条目值：</td>
                    <td>
                        <input name="mbtmz" class="mini-textbox" required="true" vtype="rangeChar:1,255">
                    </td>
                </tr>
                <tr>
                    <td class="odd">码表条目描述：</td>
                    <td>
                        <input name="mbtmms" class="mini-textbox" vtype="rangeChar:0,255">
                    </td>
                    <td class="odd">数据顺序索引：</td>
                    <td>
                        <input name="sjsxsy" class="mini-textbox" vtype="int;rangeChar:0,8">
                    </td>
                </tr>
                <tr>
                    <td class="odd">是否可见</td>
                    <td>
                        <select name="sfkj" class="mini-radiobuttonlist" onvaluechanged="valueChange(this)">
                            <option value="1" selected="selected">是</option>
                            <option value="0">否</option>
                        </select>
                    </td>
                    <td class="hierarchy odd" style="display: none;">父节点编码</td>
                    <td class="hierarchy even" style="display: none;">

                    </td>
                </tr>
            </table>
        </div>
    </form>
</div>

<div class="mini-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
    <a class="mini-button" style="width:60px;" onclick="onCancel()">取消</a>
    <span style="display:inline-block;width:25px;"></span>
    <a class="mini-button" style="width:60px;" id="okBtn" enabled="false" onclick="onOk()">确定</a>
</div>

</body>
<script type="text/javascript">
    mini.parse();

    var form = new mini.Form("#form1");

    var oldFormData;
    if(!oldFormData){
        oldFormData = form.getData();
    }

    function onOk() {
        SaveData();
    }

    $("#form1 :input.mini-textbox-input").keyup(ctrlOkBtn);
    $("#form1 :input.mini-textbox-input").change(ctrlOkBtn);

    function ctrlOkBtn() {
        var oldData = mini.encode(oldFormData);
        var formData = form.getData();
        var name = $(this).attr("name");
        formData[name] = $(this).val();
        var newData = mini.encode(formData);
        if ( oldData == newData ){
            mini.get("okBtn").disable();
        }else{
            mini.get("okBtn").enable();
        }
    }

    function SaveData() {

        form.validate();
        if (form.isValid() == false) return;

        var url = "${pageContext.request.contextPath}/codeinfo/add";

        var pageType = mini.get("pageType").getValue();

        if( pageType == "edit" ){
            url = "${pageContext.request.contextPath}/codeinfo/update";
        }

        var data = form.getData();      //获取表单多个控件的数据
        $.ajax({
            url: url,
            type: "post",
            data: data ,
            success: function (text) {
                CloseWindow("ok");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                CloseWindow();
            }
        });
    }

    function SetData(data) {
        //跨页面传递的数据对象，克隆后才可以安全使用
        data = mini.clone(data);

        mini.get("pageType").setValue(data.action);
        mini.get("sjlx").setValue(data.sjlx);

        if (data.action == "edit") {
            $.ajax({
                url: "${pageContext.request.contextPath}/codeinfo/getCodeInfoByZj?zj="+data.id,
                cache: false,
                success: function (text) {
                    var o = mini.decode(text);
                    form.setData(o);
                    form.setChanged(false);
                    oldFormData = form.getData();
                }
            });
        }
    }

    function valueChange (e) {

        var newData = form.getData();
        var name = e.name;
        var value = e.value;

        if(e._calendar != null){
            value = mini.formatDate(value,"${_TIMESTAPPATTERN}");
        }
        newData[name] = value;
        var newDataJson = mini.encode(newData);
        var oldData = mini.encode(oldFormData);
        if ( oldData == newDataJson ){
            mini.get("okBtn").disable();
        }else{
            mini.get("okBtn").enable();
        }
    }


</script>

</html>
