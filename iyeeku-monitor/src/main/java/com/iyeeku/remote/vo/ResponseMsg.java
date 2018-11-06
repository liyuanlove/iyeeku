package com.iyeeku.remote.vo;

import java.util.Map;

public class ResponseMsg {

    private String code;
    private String msg;
    private Map<String , Object> data;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }

    public void formatSuccMsg(){
        this.code = "0";
        this.msg = "请求成功";
    }

}
