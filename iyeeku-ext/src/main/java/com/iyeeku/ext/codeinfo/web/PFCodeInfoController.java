package com.iyeeku.ext.codeinfo.web;

import com.iyeeku.ext.codeinfo.service.PFCodeInfoService;
import com.iyeeku.ext.codeinfo.vo.PFCodeInfoVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/codeinfo")
public class PFCodeInfoController {

    private final Logger logger = LoggerFactory.getLogger(PFCodeInfoController.class);

    @Autowired
    private PFCodeInfoService pfCodeInfoService;

    @RequestMapping(value = "/form1")
    public ModelAndView form1(){
        this.logger.info("PFCodeInfoController form1");
        return new ModelAndView("ext/codeinfo/codeInfoForm");
    }

    @RequestMapping(value = "/findAllInfos" , method = RequestMethod.POST)
    @ResponseBody
    public List<PFCodeInfoVO> findAllInfosByCodeType(String codetype){
        this.logger.info("PFCodeInfoController findAllInfosByCodeType");
        return this.pfCodeInfoService.findAllInfosByCodeType(codetype);
    }

    @RequestMapping(value = "/add" , method = RequestMethod.POST)
    @ResponseBody
    public void add(PFCodeInfoVO codeInfoVO){
        this.logger.info("PFCodeInfoController add");
        this.pfCodeInfoService.save(codeInfoVO);
    }

    @RequestMapping(value = "/update" , method = RequestMethod.POST)
    @ResponseBody
    public void update(PFCodeInfoVO codeInfoVO){
        this.logger.info("PFCodeInfoController update");
        this.pfCodeInfoService.update(codeInfoVO);
    }

    @RequestMapping(value = "/delete" , method = RequestMethod.POST)
    @ResponseBody
    public void delete(PFCodeInfoVO codeInfoVO){
        this.logger.info("PFCodeInfoController delete");
        this.pfCodeInfoService.delete(codeInfoVO);
    }

    @RequestMapping(value = "/getCodeInfoByZj")
    @ResponseBody
    public PFCodeInfoVO getCodeInfoByZj(String zj){
        this.logger.info("PFCodeInfoController getCodeInfoByZj");
        return this.pfCodeInfoService.findCodeInfoByZj(zj);
    }

}
