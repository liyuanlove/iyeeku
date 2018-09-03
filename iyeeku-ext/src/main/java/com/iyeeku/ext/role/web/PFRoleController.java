package com.iyeeku.ext.role.web;

import com.iyeeku.core.mvc.handlermapping.FunctionDesc;
import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.role.service.IPFRoleService;
import com.iyeeku.ext.role.vo.PFRole;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping(value = "/role")
public class PFRoleController {

    private final Logger logger  = LoggerFactory.getLogger(PFRoleController.class);

    @Resource(name = "iPFRoleService")
    private IPFRoleService iPFRoleService;

    @FunctionDesc("测试执行到这里")
    @ResponseBody
    public void testRequest(){
        this.logger.info("PFRoleController testRequest");
        System.out.println("执行到这里1111111111111111");
    }

    @RequestMapping(value = "list" , method = RequestMethod.GET)
    public ModelAndView roleList(){
        return new ModelAndView("ext/role/roleList");
    }

    @RequestMapping(value = "add")
    @ResponseBody
    public String add(HttpServletRequest request, PFRole role){
        this.logger.info("PFRoleController addRole");
        String jsmc = request.getParameter("jsmc");
        System.out.println("JSMC " + jsmc);
        System.out.println("角色名称: " + role.getJsmc());
        System.out.println("角色描述: " + role.getJsms());
        this.iPFRoleService.saveRole(role);
        return "ok";
    }

    @RequestMapping(value = "update" , method = RequestMethod.POST)
    public void update(PFRole role){
        this.logger.info("PFRoleController update");
        this.iPFRoleService.updateRole(role);
    }

    @RequestMapping(value = "delete" , method = RequestMethod.POST)
    @ResponseBody
    public String delete(String jsbh){
        this.logger.info("PFRoleController delete");
        this.iPFRoleService.deleteRole(jsbh);
        return "ok";
    }

    @RequestMapping(value = "getRoleByJsbh" , method = RequestMethod.POST)
    public PFRole detail(String jsbh){
        this.logger.info("PFRoleController detail");
        return this.iPFRoleService.findRoleByJsbh(jsbh);
    }

    @RequestMapping(value = "findAllRoleInfos" , method = RequestMethod.POST)
    @ResponseBody
    public Map<String , Object> findAllRoleInfos(PFRole role, Pagination pagination){
        this.logger.info("PFRoleController findAllRoleInfos");
        return this.iPFRoleService.findAllRoleInfos(role,pagination);
    }

    @RequestMapping(value = "roleForm" , method = RequestMethod.GET)
    public ModelAndView roleForm(){
        return new ModelAndView("ext/role/roleForm");
    }

}
