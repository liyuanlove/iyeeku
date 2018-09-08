package com.iyeeku.ext.home.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

    @RequestMapping(value = "/index1",method = RequestMethod.GET)
    public ModelAndView index(){
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/index",method = RequestMethod.GET , name = "打开管理系统主页")
    public ModelAndView index1(){
        return new ModelAndView("index1");
    }

    @RequestMapping(value = "/home",method = RequestMethod.GET , name = "控制台首页")
    public ModelAndView home(){
        return new ModelAndView("home");
    }

}
