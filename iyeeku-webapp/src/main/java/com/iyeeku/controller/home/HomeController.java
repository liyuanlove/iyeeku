package com.iyeeku.controller.home;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class HomeController {

    @RequestMapping(value = "/" , method = RequestMethod.GET)
    public ModelAndView toIndexPage(){
        return new ModelAndView("home");
    }

    @RequestMapping(value = "/home/reg" , method = RequestMethod.GET)
    public ModelAndView toRegisterPage(){
        return new ModelAndView("register");
    }




}
