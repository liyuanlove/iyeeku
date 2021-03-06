package com.iyeeku.ext.codeinfo.web;

import com.iyeeku.core.vo.Pagination;
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

import java.util.Map;

@Controller
@RequestMapping(value = "/codeinfo")
public class PFCodeInfoController {

    private final Logger logger = LoggerFactory.getLogger(PFCodeInfoController.class);

    @Autowired
    private PFCodeInfoService pfCodeInfoService;

    @RequestMapping(value = "/form1" , method = RequestMethod.GET , name = "码值条目编辑表单")
    public ModelAndView form1(){
        this.logger.info("PFCodeInfoController form1");
        return new ModelAndView("ext/codeinfo/codeInfoForm");
    }

    @RequestMapping(value = "/findAllInfos" , method = RequestMethod.POST , name = "码值条目列表查询")
    @ResponseBody
    public Map<String,Object> findAllInfosByCodeType(String codetype , Pagination pagination){
        this.logger.info("PFCodeInfoController findAllInfosByCodeType");
        return this.pfCodeInfoService.findAllInfosByCodeType(codetype,null ,pagination);
    }

    @RequestMapping(value = "/add" , method = RequestMethod.POST , name = "码值条目新增")
    @ResponseBody
    public void add(PFCodeInfoVO codeInfoVO){
        this.logger.info("PFCodeInfoController add");
        this.pfCodeInfoService.save(codeInfoVO);
    }

    @RequestMapping(value = "/update" , method = RequestMethod.POST , name = "码值条目修改")
    @ResponseBody
    public void update(PFCodeInfoVO codeInfoVO){
        this.logger.info("PFCodeInfoController update");
        this.pfCodeInfoService.update(codeInfoVO);
    }

    @RequestMapping(value = "/delete" , method = RequestMethod.POST , name = "码值条目删除")
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
