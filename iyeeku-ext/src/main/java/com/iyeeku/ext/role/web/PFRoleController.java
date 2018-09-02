package com.iyeeku.ext.role.web;

import com.iyeeku.ext.role.service.IPFRoleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

@Controller
public class PFRoleController {

    private final Logger logger  = LoggerFactory.getLogger(PFRoleController.class);

    @Resource(name = "iPFRoleService")
    private IPFRoleService iPFRoleService;

    @RequestMapping( value = "/test" , method = RequestMethod.GET)
    public void testRequest(){
        this.logger.info("PFRoleController testRequest");
        this.iPFRoleService.findAllRoles();
        System.out.println("执行到这里");
    }

}
