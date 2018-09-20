package com.iyeeku.core.mvc.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "exception")
public class ExceptionController {

    @RequestMapping(value = "toAjaxExceptionPage" , method = RequestMethod.GET , name = "Ajax提交报错，错误展示页面")
    public String toAjaxExceptionPage(){
        return "error/ajaxExceptionPage";
    }

}
