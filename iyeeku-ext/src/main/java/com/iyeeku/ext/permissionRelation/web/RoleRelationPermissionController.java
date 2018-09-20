package com.iyeeku.ext.permissionRelation.web;

import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.permissionRelation.service.RoleRelationPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
@RequestMapping(value = "roleRelationPer")
public class RoleRelationPermissionController {

    @Autowired
    private RoleRelationPermissionService roleRelationPermissionService;

    @RequestMapping(value = "roleRelationPerMain" , method = RequestMethod.GET , name = "角色分配权限主界面")
    public ModelAndView roleRelationPer(){
        return new ModelAndView("ext/permissionRelation/roleRelationPermission/roleRelationPermission");
    }

    @RequestMapping(value = "roleAssignMenu" , method = RequestMethod.GET , name = "角色分配菜单树界面")
    public ModelAndView roleAssignMenu(){
        return new ModelAndView("ext/permissionRelation/roleRelationPermission/roleChooseMenuTree");
    }

    @RequestMapping(value = "roleAssignUrl" , method = RequestMethod.GET , name = "角色分配URL权限选择URL信息界面")
    public ModelAndView roleAssignUrl(){
        return new ModelAndView("ext/permissionRelation/roleRelationPermission/roleChooseUrlList");
    }

    @RequestMapping(value = "listRole" , method = RequestMethod.POST , name = "角色分配权限角色列表查询")
    @ResponseBody
    public Map<String,Object> listRole(String jsmc , Pagination pagination){
        return roleRelationPermissionService.listRole(jsmc,pagination);
    }

    @RequestMapping(value = "findRoleMenunodeUrl" , method = RequestMethod.POST , name = "获取角色拥有某个菜单节点的URL权限")
    @ResponseBody
    public Map<String,Object> findRoleMenunodeUrl(String cdbh , String jsbh , String gnssmk){
        return null;
    }

    @RequestMapping(value = "addRoleMenuPer" , method = RequestMethod.POST , name = "角色授予菜单权限")
    @ResponseBody
    public void addRoleMenuPer(String jsbh , String addCdbh , String addCdurl , String delCdbh , String delCdurl , String sqzylx){

        String[] addSqzybms = addCdbh.split(",");
        String[] addGnssmks = addCdurl.split(",");

        this.roleRelationPermissionService.addRoleMenuPer(jsbh , addSqzybms , addGnssmks , delCdbh , delCdurl , sqzylx);


    }

}
