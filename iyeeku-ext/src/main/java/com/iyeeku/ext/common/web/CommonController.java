package com.iyeeku.ext.common.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/common")
public class CommonController {

    @RequestMapping(value = "access" , method = RequestMethod.GET , name = "跳转到没有访问权限页面")
    public ModelAndView access(){
        return new ModelAndView("access");
    }

}
