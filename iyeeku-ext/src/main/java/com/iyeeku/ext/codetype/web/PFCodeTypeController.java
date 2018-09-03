package com.iyeeku.ext.codetype.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value = "/codetype")
public class PFCodeTypeController {

    private final Logger logger = LoggerFactory.getLogger(PFCodeTypeController.class);

    @RequestMapping(value = "list" , method = RequestMethod.GET)
    public ModelAndView list(){
        return new ModelAndView("ext/codetype/codetypePage");
    }





}
