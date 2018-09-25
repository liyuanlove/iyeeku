$J = mini;

//ajax全局设置
$.ajaxSetup({
    type: "post",
    cache: false,
    beforeSend:function(xhr){
        //mini.loading()
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        xhr.setRequestHeader(header, token);
    }
});

//请求失败遇到异常触发
$(document).ajaxError(function (XMLHttpRequest,textStatus, e) {
    var errMsg = textStatus.responseText;
    var jsonData = $.parseJSON(errMsg);
    console.info(jsonData);


    mini.open({
        url: "/exception/toAjaxExceptionPage",
        title: "错误信息", width: 700, height: 400,
        onload: function () {
            var iframe = this.getIFrameEl();  //responseText
            iframe.contentWindow.SetData(jsonData);
        },
        ondestroy: function (action) {

        }
    });
});
//完成请求后触发。即在success或error触发后触发
$(document).ajaxComplete(function (jqXHR, textStatus, errorThrown){
/*    console.info("complete!!");
    console.info(jqXHR);
    console.info(textStatus);
    console.info(errorThrown);
    console.info("complete!! ==>> end");*/
});



function IyeekuAjaxConf() {
    this.dataType = "json";
    this.type = "POST";
    this.contentType = "application/x-www-form-urlencoded";
    this.isSuccMsg = true;
    this.isShowProcessBar = true;
    this.beforeSubmitFunc = null;
    this.successFunc = null;
    this.errorFunc = null;
    this.processMsg = null;
    this.async = true;
};

IyeekuAjaxConf.prototype.setContentType = function (contentType) {
    this.contentType = contentType;
};

IyeekuAjaxConf.prototype.setIsShowSuccMsg = function (showSuccMsg) {
    this.isSuccMsg = showSuccMsg;
};

IyeekuAjaxConf.prototype.setSuccessFunc = function (successFunc) {
    this.successFunc = successFunc;
};

IyeekuAjaxConf.prototype.setErrorFunc = function (errorFunc) {
    this.errorFunc = errorFunc;
};

IyeekuAjaxConf.prototype.setIsAsync = function (isAsync) {
    this.async = isAsync;
};

IyeekuAjaxConf.prototype.postByAjax = function (postData , reqUrl) {
    $J.postByAjax(postData , reqUrl , this);
};


//Ajax提交数据
mini.postByAjax = function (postData , reqUrl , ajaxConf) {
    var tempAjaxConf = null;
    if (ajaxConf){
        tempAjaxConf = ajaxConf;
    }else{
        tempAjaxConf = new IyeekuAjaxConf();
    }

    if (tempAjaxConf.beforeSubmitFunc && !tempAjaxConf.beforeSubmitFunc()){
        return false;
    }

    if (tempAjaxConf.isShowProcessBar){
        tempAjaxConf.processMsg = this.showProcessBar();
    }

    var ajaxSetting = this.getAjaxSetting(tempAjaxConf);
    ajaxSetting.url = this.formatUrl(reqUrl);
    if(postData){
        ajaxSetting.data = postData;
    }
    $.ajax(ajaxSetting);
};

mini.formatUrl = function (reqUrl) {
    if(appContext == null || appContext == "" || appContext == "/"){
        appContext = "";
    }

    var flagStr = appContext + "/";
    var rtnValue = "";
    if (reqUrl.startsWith(flagStr)){
        rtnValue = reqUrl;
    }else{
        if(reqUrl.startsWith("/")){
            rtnValue = appContext + reqUrl;
        }else{
            rtnValue = appContext + "/" + reqUrl;
        }
    }
    if(rtnValue.indexOf("?") > 0){
        rtnValue = rtnValue + "&_reqseq=" +Math.random();
    }else{
        rtnValue = rtnValue + "?_reqseq=" +Math.random();
    }
    return rtnValue;
}

//默认Ajax配置参数
mini.getAjaxSetting = function (ajaxConf) {
    var ajaxSetting = {};
    ajaxSetting.dataType = ajaxConf.dataType;
    ajaxSetting.type = ajaxConf.type;
    ajaxSetting.async = ajaxConf.async;

    ajaxSetting.error = function (data , textStatus  , jqXHR) {
        if(ajaxConf.errorFunc){
            ajaxConf.errorFunc(data);
        }
        if(ajaxConf.processMsg){
            mini.closeProcessBar(ajaxConf.processMsg);
        }

        try{
            var jsonData = mini.parseJSON(data.responseText);
            if(jsonData.isBizErr){ //业务标识错误
                mini.iyeekuError(jsonData.errMsg);
            }else{
                console.info("执行到这里!!!");
            }

        }catch(err){
            if(data.status == 403){
                mini.iyeekuError("您没有权限!!");
            }else if(data.status == 200){

            }
        }
    };
    ajaxSetting.success = function (data) {
        if(ajaxConf.processMsg){
            mini.closeProcessBar(ajaxConf.processMsg);
        }
        if(ajaxConf.isSuccMsg){

        }
        //最后执行成功函数
        if(ajaxConf.successFunc){
            ajaxConf.successFunc(data);
        }
    };
    ajaxSetting.contentType = ajaxConf.contentType;
    ajaxSetting.beforeSend = function (request) {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        if (header != null){
            request.setRequestHeader(header, token);
        }
    };
    return ajaxSetting;
}

//显示进度条
mini.showProcessBar = function () {
    var handler;
    try{
        handler = mini.getTopWindow(window).topShowProcessBar();
    }catch(e){
        handler = mini.loading("请等待...","...");
    }
    return handler;
};


mini.closeProcessBar = function (processBar) {
    var value;
    try {
        value = mini.getTopWindow(window).topCloseProcessBar(processBar);
    }catch (e){
        value = mini.hideMessageBox(processBar);
    }
    return value;
};

//错误提示框
mini.iyeekuError = function (msg , title , callBackFun , params) {
    try{
        mini._getTopWindow(window).topError(msg , title , callBackFun , params);
    }catch(e){
        topError(msg , title , callBackFun , params);
    }
};

function topError(msg , title , callBackFun , params) {
    if (params && params.length > 0){
        var newMsg = msg;
        mini.error(newMsg , title , callBackFun);
    }else{
        mini.error(msg , title , callBackFun);
    }
};

/*
function topShowProccessBar() {
    return mini.loading("请等待","...");
};*/


//扩展JS Map对象
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
};



function showTips(Msg,state) {
    var x = "center";
    var y = "top";
    var state = state;

    var TiMsg = "成功";
    if (state == "danger"){
        TiMsg = "失败";
    }

    mini.showTips({
        content: "<b>" + TiMsg + "</b> <br/>"+Msg,
        state: state,
        x: x,
        y: y,
        timeout: 3000
    });
};

function onCancel(e) {
    CloseWindow("cancel");
};

function CloseWindow(action) {
    if (action == "close" && form.isChanged()) {
        if (confirm("数据被修改了，是否先保存？")) {
            return false;
        }
    }
    if (window.CloseOwnerWindow)
        return window.CloseOwnerWindow(action);
    else window.close();
};