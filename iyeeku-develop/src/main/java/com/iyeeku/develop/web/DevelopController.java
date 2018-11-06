package com.iyeeku.develop.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "develop")
public class DevelopController {

    @RequestMapping(value = "list" , method = RequestMethod.GET , name = "开发日志主页面")
    public ModelAndView list(){
        System.out.println("执行到这里");
        return new ModelAndView("ext/develop/developMain");
    }

    @RequestMapping(value = "mobileApiDebugMain" , method = RequestMethod.GET , name = "手机API接口测试页面")
    public ModelAndView mobileApiDebugMain(){
        return new ModelAndView("ext/develop/mobileApiDebugMain");
    }

}
