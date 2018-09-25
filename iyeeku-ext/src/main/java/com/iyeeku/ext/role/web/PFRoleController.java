package com.iyeeku.ext.role.web;

import com.iyeeku.core.context.ContextUtil;
import com.iyeeku.core.security.IyeekuUserInfo;
import com.iyeeku.core.util.JsonUtil;
import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.auditlog.service.PFAuditLogService;
import com.iyeeku.ext.role.service.PFRoleService;
import com.iyeeku.ext.role.vo.PFRoleVO;
import com.iyeeku.ext.rolestaff.service.PFRoleStaffService;
import com.iyeeku.ext.rolestaff.vo.PFRoleStaffVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/role")
public class PFRoleController {

    private final Logger logger  = LoggerFactory.getLogger(PFRoleController.class);

    @Autowired
    private PFRoleService pfRoleService;
    @Autowired
    private PFRoleStaffService pfRoleStaffService;
    @Autowired
    private PFAuditLogService pfAuditLogService;

    @RequestMapping(value = "list" , method = RequestMethod.GET , name = "角色管理主页面")
    public ModelAndView roleList(){
        return new ModelAndView("ext/role/roleMain");
    }

    @RequestMapping(value = "add" , method = RequestMethod.POST , name = "角色添加")
    @ResponseBody
    public void add(PFRoleVO role){
        this.logger.info("新增角色信息：{}" , role);
        this.pfRoleService.saveRole(role);

        IyeekuUserInfo userInfo = ContextUtil.getLoginUser();
        this.pfAuditLogService.saveAuditLog("role_management" , "03" , userInfo.getUserId() ,
                userInfo.getUserIP() , userInfo.getUserId() , true , "保存角色信息" , JsonUtil.bean2Json(role));

    }

    @RequestMapping(value = "commonPermissionList" , method = RequestMethod.POST , name = "查找公共权限")
    @ResponseBody
    public Map<String,Object> commonPermissionList(Pagination pagination){
        return null;
    }

    @RequestMapping(value = "update" , method = RequestMethod.POST , name = "更新角色信息")
    @ResponseBody
    public void update(PFRoleVO role){
        this.logger.info("更新角色信息：{}" , role);
        this.pfRoleService.updateRole(role);

        IyeekuUserInfo userInfo = ContextUtil.getLoginUser();
        this.pfAuditLogService.saveAuditLog("role_management" , "04" , userInfo.getUserId() ,
                userInfo.getUserIP() , userInfo.getUserId() , true , "更新角色信息" , JsonUtil.bean2Json(role));
    }

    @RequestMapping(value = "delete" , method = RequestMethod.POST , name = "角色删除")
    @ResponseBody
    public void delete(String jsbh){
        this.logger.info("PFRoleController delete");
        this.pfRoleService.deleteRole(jsbh);
    }

    @RequestMapping(value = "getRoleByJsbh" , method = RequestMethod.POST , name = "根据JSBH查找角色信息")
    @ResponseBody
    public PFRoleVO detail(String jsbh){
        this.logger.info("PFRoleController detail");
        return this.pfRoleService.findRoleByJsbh(jsbh);
    }

    @RequestMapping(value = "findAllRoleInfos" , method = RequestMethod.POST)
    @ResponseBody
    public Map<String , Object> findAllRoleInfos(PFRoleVO role, Pagination pagination){
        this.logger.info("PFRoleController findAllRoleInfos");
        return this.pfRoleService.findAllRoleInfos(role,pagination);
    }

    @RequestMapping(value = "roleForm" , method = RequestMethod.GET , name = "跳转到角色表单")
    public ModelAndView roleForm(){
        return new ModelAndView("ext/role/roleForm");
    }

    @RequestMapping(value = "viewStaff" , method = RequestMethod.GET , name = "角色查询已分配用户信息页面")
    public ModelAndView viewStaff(){ return new ModelAndView("ext/role/viewStaff");}

    @RequestMapping(value = "addStaff" , method = RequestMethod.GET , name = "角色添加用户页面")
    public ModelAndView addStaff(){ return new ModelAndView("ext/role/addStaff");}

    @RequestMapping(value = "removeStaff" , method = RequestMethod.GET , name = "角色删除用户页面")
    public ModelAndView removeStaff(){ return new ModelAndView("ext/role/removeStaff");}

    @RequestMapping(value = "listStaff" , method = RequestMethod.POST , name = "角色用户列表查询list")
    @ResponseBody
    public Map<String,Object> listStaff(String jsbh,Pagination pagination){
        return this.pfRoleService.findAllRoleStaffInfos(jsbh,pagination);
    }

    @RequestMapping(value = "listNotAddedStaff" , method = RequestMethod.POST , name = "查询未分配给角色的用户信息")
    @ResponseBody
    public Map<String,Object> listNotAddedStaff(String jsbh, String yhmc ,String ssjg , String bhzjg , Pagination pagination){
        Map<String,String> param = new HashMap<>();
        param.put("jsbh" , jsbh);
        param.put("yhmc" , yhmc);
        //param.put("ssjg" , ssjg);
        //param.put("bhzjg" , bhzjg);
        return this.pfRoleService.getListNotAddedStaff(param,pagination);
    }

    @RequestMapping(value = "comfirmAddStaff" , method = RequestMethod.POST , name = "为用户添加角色")
    @ResponseBody
    public void comfirmAddStaff(String yhbhList , String jsbh){
        this.logger.info("为用户添加角色 , 用户编号：{ " + yhbhList + " }" );
        String[] ids = yhbhList.split(",");
        for (String yhbh : ids){
            if (!this.pfRoleStaffService.hasUnverifidRecord(yhbh , jsbh)){
                PFRoleStaffVO roleStaffVO = new PFRoleStaffVO();
                roleStaffVO.setYhbh(yhbh);
                roleStaffVO.setJsbh(jsbh);
                this.pfRoleStaffService.saveRoleStaff(roleStaffVO);
            }
        }
        IyeekuUserInfo userInfo = ContextUtil.getLoginUser();
        this.pfAuditLogService.saveAuditLog("role_management" , "03" , userInfo.getUserId() , userInfo.getUserIP() ,
                userInfo.getUserId() , true , "为角色添加用户" , "角色编号：" + jsbh + "\n用户编号：" + yhbhList);

    }

    @RequestMapping(value = "comfirmRemoveStaff" , method = RequestMethod.POST , name = "移除用户拥有的角色")
    @ResponseBody
    public void comfirmRemoveStaff(String yhbhList , String jsbh){
        String[] ids = yhbhList.split(",");
        for (String yhbh : ids){
            if (this.pfRoleStaffService.hasUnverifidRecord(yhbh,jsbh)){
                PFRoleStaffVO roleStaffVO = new PFRoleStaffVO();
                roleStaffVO.setYhbh(yhbh);
                roleStaffVO.setJsbh(jsbh);
                this.pfRoleStaffService.deleteRoleStaff(roleStaffVO);
            }
        }

        IyeekuUserInfo userInfo = ContextUtil.getLoginUser();
        this.pfAuditLogService.saveAuditLog("role_management" , "05" , userInfo.getUserId() , userInfo.getUserIP() ,
                userInfo.getUserId() , true , "删除分配给角色的用户" , "角色编号：" + jsbh + "\n用户编号：" + yhbhList);
    }

}
