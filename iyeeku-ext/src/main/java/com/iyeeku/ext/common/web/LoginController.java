package com.iyeeku.ext.common.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

    @RequestMapping(value = "login" , method = RequestMethod.GET , name = "登陆页面")
    public ModelAndView login(){
        return new ModelAndView("login");
    }

    @RequestMapping(value = "main" , method = RequestMethod.GET , name = "主页面")
    public ModelAndView main(){
        return new ModelAndView("index1");
    }

    @RequestMapping(value = "sessionTimeout" , method = RequestMethod.GET , name = "session超时页面")
    public ModelAndView sessionTimeout(){
        return new ModelAndView("sessionTimeout");
    }

}
