package com.iyeeku.ext.permissionRelation.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "roleRelationPer")
public class RoleRelationPermissionController {

    @RequestMapping(value = "roleRelationPerMain" , method = RequestMethod.GET , name = "角色分配权限主界面")
    public ModelAndView roleRelationPer(){
        return new ModelAndView("ext/permissionRelation/roleRelationPermission/roleRelationPermission");
    }

}
