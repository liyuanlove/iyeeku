package com.iyeeku.ext.codetype.web;

import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.codetype.service.PFCodeTypeService;
import com.iyeeku.ext.codetype.vo.PFCodeTypeVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;


@Controller
@RequestMapping(value = "/codetype")
public class PFCodeTypeController {

    private final Logger logger = LoggerFactory.getLogger(PFCodeTypeController.class);

    @Autowired
    private PFCodeTypeService pfCodeTypeService;

    @RequestMapping(value = "list" , method = RequestMethod.GET)
    public ModelAndView list(){
        return new ModelAndView("ext/codetype/codetypePage");
    }

    @RequestMapping(value = "/form1")
    public ModelAndView form1(){
        return new ModelAndView("ext/codetype/codeTypeForm");
    }

    @RequestMapping(value = "/findAllTypes" , method = RequestMethod.POST)
    @ResponseBody
    public Map<String , Object> findAllTypes(PFCodeTypeVO codeTypeVO, Pagination pagination){
        this.logger.info("PFCodeTypeController findAllTypes");
        return this.pfCodeTypeService.findAllTypes(codeTypeVO,pagination);
    }

    @RequestMapping(value = "/add" , method = RequestMethod.POST)
    @ResponseBody
    public void save(PFCodeTypeVO codeTypeVO){
        this.logger.info("PFCodeTypeController save");
        this.pfCodeTypeService.save(codeTypeVO);
    }

    @RequestMapping(value = "/update" , method = RequestMethod.POST)
    @ResponseBody
    public void update(PFCodeTypeVO codeTypeVO){
        this.logger.info("PFCodeTypeController update");
        this.pfCodeTypeService.update(codeTypeVO);
    }

}
