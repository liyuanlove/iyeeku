package com.iyeeku.ext.permissionRelation.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/perRelationRole")
public class PermissionRelationRoleController {

    @RequestMapping(value = "PerRelationRoleMain" , method = RequestMethod.GET , name = "权限关联角色主界面")
    public ModelAndView permissionRelationRoleMain(){
        return new ModelAndView("ext/permissionRelation/permissionRelationRole/permissionRelationRole");
    }

}
