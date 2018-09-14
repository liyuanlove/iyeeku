package com.iyeeku.ext.permissionRelation.web;

import com.iyeeku.core.vo.Pagination;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
@RequestMapping(value = "roleRelationPer")
public class RoleRelationPermissionController {

    @RequestMapping(value = "roleRelationPerMain" , method = RequestMethod.GET , name = "角色分配权限主界面")
    public ModelAndView roleRelationPer(){
        return new ModelAndView("ext/permissionRelation/roleRelationPermission/roleRelationPermission");
    }

    @RequestMapping(value = "roleAssignMenu" , method = RequestMethod.GET , name = "角色分配菜单树界面")
    public ModelAndView roleAssignMenu(){
        return new ModelAndView("ext/permissionRelation/roleRelationPermission/roleChooseMenuTree");
    }

    @RequestMapping(value = "listRole" , method = RequestMethod.POST , name = "角色分配权限角色列表查询")
    @ResponseBody
    public Map<String,Object> listRole(String jsmc , Pagination pagination){
        return null;
    }



}
