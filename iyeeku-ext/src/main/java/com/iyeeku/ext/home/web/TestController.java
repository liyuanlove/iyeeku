package com.iyeeku.ext.home.web;

import com.iyeeku.core.mvc.handlermapping.ForcePostMethod;
import com.iyeeku.core.mvc.handlermapping.FunctionDesc;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/test")
public class TestController {


    @FunctionDesc("注册测试URL -->> update")
    @ForcePostMethod(true)
    @ResponseBody
    public void update(){
        System.out.println("执行到  test update");
    }

    @FunctionDesc("注册测试URL -->> save")
    @ResponseBody
    public void save(){
        System.out.println("执行到  test save");
    }

    @FunctionDesc("注册测试URL -->> list")
    public void list(){

    }

}
