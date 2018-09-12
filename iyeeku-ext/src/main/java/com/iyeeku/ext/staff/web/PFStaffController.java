package com.iyeeku.ext.staff.web;

import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.staff.service.PFStaffService;
import com.iyeeku.ext.staff.vo.PFStaffVO;
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
@RequestMapping(value = "/staff")
public class PFStaffController {

    private final Logger logger = LoggerFactory.getLogger(PFStaffController.class);

    @Autowired
    private PFStaffService pfStaffService;

    @RequestMapping(value = "/list" , method = RequestMethod.GET , name = "员工管理主页面")
    public ModelAndView list(){
        return new ModelAndView("ext/staff/staffList");
    }

    @RequestMapping(value = "/form1" , name = "员工信息录取Form表单")
    public ModelAndView form1(){
        return new ModelAndView("ext/staff/staffForm");
    }

    @RequestMapping(value = "/add" , method = RequestMethod.POST , name = "员工新增")
    @ResponseBody
    public void add(PFStaffVO staffVO){
        this.logger.info("PFStaffController add");
        this.pfStaffService.save(staffVO);
    }

    @RequestMapping(value = "/update" , method = RequestMethod.POST , name = "员工修改")
    @ResponseBody
    public void update(PFStaffVO staffVO){
        this.logger.info("PFStaffController update");
        this.pfStaffService.update(staffVO);
    }

    @RequestMapping(value = "/findAllInfos")
    @ResponseBody
    public Map<String,Object> findAllInfos(PFStaffVO staffVO , Pagination pagination){
        return this.pfStaffService.findAllStaffs(staffVO,pagination);
    }

}
