package com.iyeeku.ext.home.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/page")
public class PageController {

    @RequestMapping(value = "/list")
    public String list(){
        return "ext/page/list";
    }


}
