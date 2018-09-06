package com.iyeeku.ext.home.web;

import com.iyeeku.core.context.URLScanCacheUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public ModelAndView index(){
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/index1",method = RequestMethod.GET , name = "打开管理系统主页")
    public ModelAndView index1(){
        URLScanCacheUtil.printAllURL();
        return new ModelAndView("index1");
    }

}
