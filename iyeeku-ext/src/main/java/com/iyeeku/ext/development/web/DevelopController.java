package com.iyeeku.ext.development.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/develop")
public class DevelopController {

    @RequestMapping(value = "/list" , method = RequestMethod.GET , name = "开发日志主页面")
    public ModelAndView list(){
        return new ModelAndView("ext/develop/developMain");
    }

}
