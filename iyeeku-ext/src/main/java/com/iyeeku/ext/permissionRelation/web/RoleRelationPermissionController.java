package com.iyeeku.ext.permissionRelation.web;

import com.iyeeku.core.context.ContextUtil;
import com.iyeeku.core.security.IyeekuUserInfo;
import com.iyeeku.core.util.StringUtil;
import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.auditlog.service.PFAuditLogService;
import com.iyeeku.ext.function.vo.PFResUrlVO;
import com.iyeeku.ext.permissionRelation.service.RoleRelationPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "roleRelationPer")
public class RoleRelationPermissionController {

    @Autowired
    private RoleRelationPermissionService roleRelationPermissionService;
    @Autowired
    private PFAuditLogService pfAuditLogService;

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

    @RequestMapping(value = "listRoleMenunodeUrl" , method = RequestMethod.POST , name = "获取角色拥有某个菜单节点的URL权限")
    @ResponseBody
    public Map<String,Object> listRoleMenunodeUrl(String cdbh , String jsbh , String gnssmk){

        String newGnssmk = "";
        Map<String,Object> rtnMap = new HashMap<>();

        if (!StringUtil.isEmpty(gnssmk)){
            List<PFResUrlVO> list = new ArrayList<>();
            if ("other".equals(gnssmk)){
                //TODO
            }else{
                newGnssmk = StringUtil.getSSMK(gnssmk);
                list = this.roleRelationPermissionService.findRoleMenunodeUrl(cdbh , jsbh , newGnssmk);
            }
            rtnMap.put("data" , list);
            rtnMap.put("total" , Integer.valueOf(list.size()));
        }

        return rtnMap;
    }

    @RequestMapping(value = "listSSmkUrl" , method = RequestMethod.POST , name = "获取所属模块可分配的所有url")
    @ResponseBody
    public Map<String,Object> listSSmkUrl(String key , String cdbh , String jsbh , String gnssmk){
        String newGnssmk = "";
        Map<String,Object> rtnMap = new HashMap<>();
        if (!StringUtil.isEmpty(gnssmk)){
            List<PFResUrlVO> list = new ArrayList<>();
            if ("other".equals(gnssmk)){
                //TODO
            }else{
                newGnssmk = StringUtil.getSSMK(gnssmk);
                list = this.roleRelationPermissionService.findSsmkUrl(key , cdbh , jsbh , newGnssmk);
            }
            rtnMap.put("data" , list);
            rtnMap.put("total" , Integer.valueOf(list.size()));
        }

        return rtnMap;
    }


    @RequestMapping(value = "addRoleMenuPer" , method = RequestMethod.POST , name = "角色授予菜单权限")
    @ResponseBody
    public void addRoleMenuPer(String jsbh , String addCdbh , String addCdurl , String delCdbh , String delCdurl , String sqzylx){

        String[] addSqzybms = addCdbh.split(",");
        String[] addGnssmks = addCdurl.split(",");

        this.roleRelationPermissionService.addRoleMenuPer(jsbh , addSqzybms , addGnssmks , delCdbh , delCdurl , sqzylx);

        StringBuffer sb = new StringBuffer();
        sb.append("角色编号：" + jsbh + "\n");
        if ( (!"".equals(addCdurl)) && (addGnssmks.length > 0)) sb.append("添加菜单URL：" + addCdurl + "\n");
        if ( (!"".equals(delCdurl)) && (delCdurl.length() > 0)) sb.append("删除菜单URL：" + delCdurl + "\n");
        IyeekuUserInfo userInfo = ContextUtil.getLoginUser();
        this.pfAuditLogService.saveAuditLog("access_permissions" , "10" , userInfo.getUserId() ,
                userInfo.getUserIP() , userInfo.getUserId() , true , "用户访问授权" , sb.toString());

    }

}
