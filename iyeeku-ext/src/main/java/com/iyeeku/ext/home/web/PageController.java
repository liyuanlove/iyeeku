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

    @RequestMapping(value = "/list1")
    public String list1(){
        return "ext/page/list";
    }

    @RequestMapping(value = "/list2")
    public String list2(){
        return "ext/page/list";
    }

    @RequestMapping(value = "/list3")
    public String list3(){
        return "ext/page/list";
    }

    @RequestMapping(value = "/list4")
    public String list4(){
        return "ext/page/list";
    }

    @RequestMapping(value = "/list5")
    public String list5(){
        return "ext/page/list";
    }

    @RequestMapping(value = "/list6")
    public String list6(){
        return "ext/page/list";
    }

    @RequestMapping(value = "/list7")
    public String list7(){
        return "ext/page/list";
    }

    @RequestMapping(value = "/list8")
    public String list8(){
        return "ext/page/list";
    }

    @RequestMapping(value = "/list9")
    public String list9(){
        return "ext/page/list";
    }



}
