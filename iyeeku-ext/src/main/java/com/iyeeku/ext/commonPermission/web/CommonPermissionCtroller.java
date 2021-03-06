package com.iyeeku.ext.commonPermission.web;

import com.iyeeku.core.context.ContextUtil;
import com.iyeeku.core.security.IyeekuUserInfo;
import com.iyeeku.ext.auditlog.service.PFAuditLogService;
import com.iyeeku.ext.commonPermission.service.CommonPermissionService;
import com.iyeeku.ext.function.vo.PFResMenuVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "commonPer")
public class CommonPermissionCtroller {

    @Autowired
    private CommonPermissionService commonPermissionService;
    @Autowired
    private PFAuditLogService pfAuditLogService;

    @RequestMapping(value = "findRoleMenuPer" , method = RequestMethod.POST , name = "获取角色所拥有的菜单树")
    @ResponseBody
    public Map<String,Object> findRoleMenuPer(String jsbh){
        List<PFResMenuVO> list = this.commonPermissionService.findRoleMenu(jsbh);
        List<Map<String,String>> rtnList = new ArrayList<>();
        for (PFResMenuVO vo : list){
            Map<String,String> rtnMap = new HashMap<>();
            rtnMap.put("id" , vo.getCdbh());
            rtnMap.put("text" , vo.getCdmc());
            rtnMap.put("pid" , vo.getSjcdbh());
            rtnMap.put("cdurlbh" , vo.getCdurl() );
            rtnMap.put("cdurl" , vo.getCdurl());
            rtnList.add(rtnMap);
        }
        Map<String , Object> menuMap = new HashMap<>();
        menuMap.put("treeNodes" , rtnList);
        return menuMap;
    }

    @RequestMapping(value = "findPerParentMenu" , method = RequestMethod.POST , name = "角色拥有父节点的菜单权限")
    @ResponseBody
    public Map<String,Object> findPerParentMenu(String jsbh){
        List<PFResMenuVO> list = this.commonPermissionService.findPerParentMenu(jsbh);
        List<Map<String,String>> rtnList = new ArrayList<>();
        for (PFResMenuVO vo : list){
            Map<String,String> rtnMap = new HashMap<>();
            rtnMap.put("id" , vo.getCdbh());
            rtnMap.put("text" , vo.getCdmc());
            rtnMap.put("pid" , vo.getSjcdbh());
            rtnMap.put("cdurl" , vo.getCdurl());
            rtnMap.put("cdurlbh" , vo.getCdurl() );
            rtnList.add(rtnMap);
        }
        Map<String , Object> menuMap = new HashMap<>();
        menuMap.put("treeNodes" , rtnList);
        return menuMap;
    }


    @RequestMapping(value = "findRoleMenu" , method = RequestMethod.POST , name = "角色拥有子节点的菜单权限")
    @ResponseBody
    public Map<String,Object> findRoleMenu(String jsbh){
        List<PFResMenuVO> list = this.commonPermissionService.findPerLeafMenu(jsbh);
        List<Map<String,String>> rtnList = new ArrayList<>();
        for (PFResMenuVO vo : list){
            Map<String,String> rtnMap = new HashMap<>();
            rtnMap.put("id" , vo.getCdbh());
            rtnMap.put("text" , vo.getCdmc());
            rtnMap.put("pid" , vo.getSjcdbh());
            rtnMap.put("cdurl" , vo.getCdurl());
            rtnList.add(rtnMap);
        }
        Map<String , Object> menuMap = new HashMap<>();
        menuMap.put("treeNodes" , rtnList);
        return menuMap;
    }

    @RequestMapping(value = "findChooseAllMenu" , method = RequestMethod.POST , name = "")
    @ResponseBody
    public Map<String,Object> findChooseAllMenu(String jsbh){
        return this.commonPermissionService.findChooseAllMenu(jsbh);
    }

    @RequestMapping(value = "addUrlGrant" , method = RequestMethod.POST , name = "授予角色URL权限")
    @ResponseBody
    public void addUrlGrant(String jsbh , String sqzybm , String sqzylx , String cdurl , String cdbh){


        IyeekuUserInfo userInfo = ContextUtil.getLoginUser();
        this.pfAuditLogService.saveAuditLog("access_permissions" , "10" , userInfo.getUserId() , userInfo.getUserIP() ,
                userInfo.getUserId() , true , "用户访问授权" , "机构编号：" + jsbh + "\n授权资源编码：" + sqzybm);
    }


}
