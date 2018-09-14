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

}
