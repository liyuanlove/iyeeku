<%--
  Created by IntelliJ IDEA.
  User: yq180
  Date: 2018/9/4
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/tag_res.jsp"%>
<html>
<head>
    <sec:csrfMetaTags/>
    <title>员工新增修改表单</title>
    <%@ include file="../../common/jscss_res.jsp"%>
</head>
<body>
<input class="mini-hidden" name="pageType" id="pageType" value="query">
<div class="mini-fit">
    <form id="form1" method="post">

        <div class="mini-tabs" activeIndex="0" style="width: 100%;margin: auto;"
         borderStyle="border-left:0;border-right:0;border-bottom:0">
            <div title="基本信息<span id='management' style='color:red'>*</span>">
                <div>
                    <table style="table-layout: fixed;" width="100%">
                        <colgroup>
                            <col width="20%">
                            <col width="25%">
                            <col width="25%">
                            <col width="30%">
                        </colgroup>
                        <tr>
                            <td colspan="4">
                                <input class="mini-hidden" name="yhbh">
                            </td>
                        </tr>
                        <tr>
                            <td align="right">用户名称：</td>
                            <td align="left">
                                <input name="yhmc" class="mini-textbox" required="true" emptyText="请输入用户名" maxlength="60" style="width: 160px;" vtype="rangeChar:1,64">
                            </td>
                            <td align="right">用户登陆名：</td>
                            <td align="left">
                                <input name="yhdlm" class="mini-textbox" required="true" emptyText="请输入用户登陆名" maxlength="32" style="width: 160px;" vtype="rangeChar:1,32">
                            </td>
                        </tr>
                        <tr>
                            <td align="right">所属机构：</td>
                            <td align="left" colspan="3">
                                <input name="ssjg" class="mini-hidden">
                                <input id="ssjgmc" name="ssjgbh" class="mini-buttonedit" style="width: 456px;" emptyText="请选择所属机构" onbuttonclick="onButtonEdit" allowinput="false" required="false">
                            </td>
                        </tr>
                        <tr>
                            <td align="right">NOTESID：</td>
                            <td align="left">
                                <input name="notesid" class="mini-textbox" required="true" emptyText="请输入NotesId" maxlength="6" style="width: 160px;" vtype="rangeChar:1,6">
                            </td>
                            <td align="right">教育程度：</td>
                            <td align="left">
                                <input name="jycd" class="mini-combobox" allowinput="false" style="width: 160px;" onvaluechanged="checkValueChanged(this);"
                                       textField="text" valueField="id"  url="${pageContext.request.contextPath}/directory/loadDict/staffJycd"/>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">人力资源ID：</td>
                            <td align="left">
                                <input name="rlzyid" class="mini-textbox"maxlength="6" style="width: 160px;" vtype="rangeChar:0,6">
                            </td>
                            <td align="right">NOTES邮箱：</td>
                            <td align="left">
                                <input name="notes邮箱" class="mini-textbox" maxlength="60" style="width: 160px;" vtype="rangeChar:0,60">
                            </td>
                        </tr>
                        <tr>
                            <td align="right">人员编号：</td>
                            <td align="left">
                                <input name="rybh" class="mini-textbox"maxlength="6" style="width: 160px;" vtype="rangeChar:0,6">
                            </td>
                            <td align="right">组织单元：</td>
                            <td align="left">
                                <input name="zzdy" class="mini-textbox" maxlength="60" style="width: 160px;" vtype="rangeChar:0,60">
                            </td>
                        </tr>
                        <tr>
                            <td align="right">个人证件类型：</td>
                            <td align="left">
                                <input name="grzjlx" class="mini-combobox" allowinput="false" style="width: 160px;" onvaluechanged="checkValueChanged(this);"
                                       textField="text" valueField="id"  url="${pageContext.request.contextPath}/directory/loadDict/staffGrzjlx"/>
                            </td>
                            <td align="right">证件号码：</td>
                            <td align="left">
                                <input name="sfzh" class="mini-textbox" maxlength="20" style="width: 160px;" vtype="rangeChar:0,20">
                            </td>
                        </tr>
                        <tr>
                            <td align="right">用户类型：</td>
                            <td align="left">
                                <input name="yhlx" class="mini-combobox" allowinput="false" style="width: 160px;" onvaluechanged="checkValueChanged(this);"
                                       textField="text" valueField="id"  url="${pageContext.request.contextPath}/directory/loadDict/staffType"/>
                            </td>
                            <td align="right">用户状态：</td>
                            <td align="left">
                                <input name="zt" class="mini-combobox" allowinput="false" value="1" style="width: 160px;" onvaluechanged="checkValueChanged(this);"
                                       textField="text" valueField="id"  url="${pageContext.request.contextPath}/directory/loadDict/staffState">
                            </td>
                        </tr>
                        <tr>
                            <td align="right">员工状态：</td>
                            <td align="left">
                                <input name="ygzt" class="mini-combobox" allowinput="false" style="width: 160px;" onvaluechanged="checkValueChanged(this);"
                                       textField="text" valueField="id"  url="${pageContext.request.contextPath}/directory/loadDict/staffYgzt"/>
                            </td>
                            <td align="right">用工形式：</td>
                            <td align="left">
                                <input name="ygxs" class="mini-combobox" allowinput="false" style="width: 160px;" onvaluechanged="checkValueChanged(this);"
                                       textField="text" valueField="id"  url="${pageContext.request.contextPath}/directory/loadDict/staffYgxs">
                            </td>
                        </tr>
                        <tr>
                            <td align="right">姓名全拼：</td>
                            <td align="left">
                                <input name="xmqp" class="mini-textbox"maxlength="50" style="width: 160px;" vtype="rangeChar:0,50">
                            </td>
                            <td align="right">姓：</td>
                            <td align="left">
                                <input name="x" class="mini-textbox" maxlength="50" style="width: 160px;" vtype="rangeChar:0,50">
                            </td>
                        </tr>
                        <tr>
                            <td align="right">英文名称：</td>
                            <td align="left">
                                <input name="ywmc" class="mini-textbox"maxlength="120" style="width: 160px;" vtype="rangeChar:0,120">
                            </td>
                            <td align="right">性别：</td>
                            <td align="left">
                                <input name="xb" class="mini-combobox" allowinput="false" style="width: 160px;" onvaluechanged="checkValueChanged(this);"
                                       textField="text" valueField="id"  url="${pageContext.request.contextPath}/directory/loadDict/sex">
                            </td>
                        </tr>
                        <tr>
                            <td align="right">出生日期：</td>
                            <td align="left">
                                <input id="sr" name="sr" class="mini-datepicker" format="yyyy-MM-dd" style="width: 160px;" allowInput="false" onvalidation="" onvaluechanged="checkValueChanged(this);" >
                            </td>
                            <td align="right">手机号码：</td>
                            <td align="left">
                                <input name="dhhm" class="mini-textbox" maxlength="30" style="width: 160px;" vtype="rangeChar:0,30">
                            </td>
                        </tr>

                    </table>
                </div>
            </div>
            <div title="扩展信息">
                <table style="table-layout: fixed;" width="100%">
                    <colgroup>
                        <col width="20%">
                        <col width="25%">
                        <col width="25%">
                        <col width="30%">
                    </colgroup>
                    <tr>
                        <td align="right">职务：</td>
                        <td align="left">
                            <input name="zw" class="mini-textbox"maxlength="6" style="width: 160px;" vtype="rangeChar:0,6">
                        </td>
                        <td align="right">入职日期：</td>
                        <td align="left">
                            <input name="rzrq" class="mini-datepicker" style="width: 160px;" allowInput="false"  onvaluechanged="checkValueChanged(this);">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">家庭电话：</td>
                        <td align="left">
                            <input name="jtdh" class="mini-textbox"maxlength="30" style="width: 160px;" vtype="rangeChar:0,30">
                        </td>
                        <td align="right">邮政编码：</td>
                        <td align="left">
                            <input name="yzbm" class="mini-textbox" maxlength="6" style="width: 160px;" vtype="rangeChar:0,6">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">办公室电话（直线）：</td>
                        <td align="left">
                            <input name="bgsdhzx" class="mini-textbox"maxlength="30" style="width: 160px;" vtype="rangeChar:0,30">
                        </td>
                        <td align="right">传真号码：</td>
                        <td align="left">
                            <input name="czhm" class="mini-textbox" maxlength="30" style="width: 160px;" vtype="rangeChar:0,30">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">办公室电话（IP电话）：</td>
                        <td align="left">
                            <input name="bgsdhip" class="mini-textbox"maxlength="30" style="width: 160px;" vtype="rangeChar:0,30">
                        </td>
                        <td align="right">电子邮箱地址：</td>
                        <td align="left">
                            <input name="yj" class="mini-textbox" maxlength="60" style="width: 160px;" vtype="rangeChar:0,60">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">详细地址：</td>
                        <td align="left" colspan="3">
                            <input name="dz" class="mini-textarea" style="width: 456px;" maxlength="230" vtype="rangeChar:0,230">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">办公室地址：</td>
                        <td align="left" colspan="3">
                            <input name="bgsdz" class="mini-textarea" style="width: 456px;" maxlength="230" vtype="rangeChar:0,230">
                        </td>
                    </tr>
                </table>
            </div>
        </div>

    </form>
</div>

<div class="mini-toolbar" style="text-align:center;padding-top:10px;padding-bottom:10px;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
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

    $("#form1 :input.mini-textbox-input").keyup(ctrlOkBtn);
    $("#form1 :input.mini-textbox-input").change(ctrlOkBtn);

    function checkValueChanged(e) {
        //控制确定按钮状态
        var oldData = mini.encode(oldFormData);
        var formData = form.getData();
        var value = e.value;
        formData[e.name] = value;
        var newData = mini.encode(formData);
        if ( oldData == newData ){
            mini.get("okBtn").disable();
        }else{
            mini.get("okBtn").enable();
        }
    }

    function onOk() {
        SaveData();
    }

    function SaveData() {

        form.validate();
        if (form.isValid() == false) return;

        var url = "${pageContext.request.contextPath}/staff/add";

        var pageType = mini.get("pageType").getValue();

        if( pageType == "edit" ){
            url = "${pageContext.request.contextPath}/staff/update";
        }

        //console.info(mini.get("sr").getValue());

        //console.info(mini.formatDate(mini.get("sr").getValue(),"yyyy-MM-dd"));
        //mini.get("sr").setValue(mini.formatDate(mini.get("sr").getValue(),"yyyy-MM-dd"));

        //var sr = mini.get("sr").getValue() + "";
        //if (sr != null && sr.length > 0){
        //    mini.get("sr").setValue(sr.substr(0,15));
        //}

        var data = form.getData();     //获取表单控件的数据
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

        if (data.action == "edit") {
            $.ajax({
                url: "${pageContext.request.contextPath}/staff/query",
                type: "post",
                data: { "yhbh" : data.id },
                cache: false,
                success: function (text) {
                    var o = mini.decode(text);
                    var form = new mini.Form("form1");
                    form.setData(o);
                    form.setChanged(false);
                    // 保存form的值
                    oldFormData = form.getData();
                }
            });
        }
    }

</script>

</html>
