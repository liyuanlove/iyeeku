package com.iyeeku.ext.staff.web;

import com.iyeeku.core.context.ContextUtil;
import com.iyeeku.core.security.IyeekuUserInfo;
import com.iyeeku.core.util.JsonUtil;
import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.auditlog.service.PFAuditLogService;
import com.iyeeku.ext.role.service.PFRoleService;
import com.iyeeku.ext.staff.service.PFStaffService;
import com.iyeeku.ext.staff.vo.PFStaffVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

@Controller
@RequestMapping(value = "/staff")
public class PFStaffController {

    private final Logger logger = LoggerFactory.getLogger(PFStaffController.class);

    /**
     * 关于springMVC接收date类型为空适合的异常解决方法
     * 方法一： 直接在对应的controller中增加属性编辑器 (只能在当前controller中生效)
     * @param binder
     */
    @InitBinder
    protected void initBinder(WebDataBinder binder){
        //SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd yyyy HH:mm:ss' GMT'Z' (中国标准时间)'", Locale.ENGLISH);
        //SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class , new CustomDateEditor(sdf , true));
    }

    @Autowired
    private PFStaffService pfStaffService;
    @Autowired
    private PFRoleService pfRoleService;
    @Autowired
    private PFAuditLogService pfAuditLogService;

    @RequestMapping(value = "/main" , method = RequestMethod.GET , name = "用户管理主页面")
    public ModelAndView list(){
        return new ModelAndView("ext/staff/staffMain");
    }

    @RequestMapping(value = "viewRole" , method = RequestMethod.GET , name = "用户查看角色页面")
    public ModelAndView viewRole(){
        return new ModelAndView("ext/staff/viewRole");
    }

    @RequestMapping(value = "addRole" , method = RequestMethod.GET , name = "用户添加角色页面")
    public ModelAndView addRole(){
        return new ModelAndView("ext/staff/addRole");
    }

    @RequestMapping(value = "removeRole" , method = RequestMethod.GET , name = "用户删除角色页面")
    public ModelAndView removeRole(){
        return new ModelAndView("ext/staff/removeRole");
    }

    @RequestMapping(value = "viewPermission" , method = RequestMethod.GET , name = "用户查看权限界面")
    public ModelAndView viewPermission() {
        return new ModelAndView("ext/staff/viewPermission");
    }

    @RequestMapping(value = "newPassword" , method = RequestMethod.GET , name = "用户修改密码界面")
    public ModelAndView newPassword(){
        return new ModelAndView("ext/staff/newPassword");
    }

    @RequestMapping(value = "/form1" , name = "用户信息录取Form表单")
    public ModelAndView form1(){
        return new ModelAndView("ext/staff/staffForm");
    }

    @RequestMapping(value = "/add" , method = RequestMethod.POST , name = "新增用户信息")
    @ResponseBody
    public void add(PFStaffVO staffVO){
        this.logger.info("新增用户信息：{}" , staffVO);
        this.pfStaffService.save(staffVO);

        IyeekuUserInfo userInfo = ContextUtil.getLoginUser();
        this.pfAuditLogService.saveAuditLog("user_management" , "03" , userInfo.getUserId() , userInfo.getUserIP() ,
                userInfo.getUserId() , true , "新增用户信息" , "新增用户：" + JsonUtil.bean2Json(staffVO));
    }

    @RequestMapping(value = "/update" , method = RequestMethod.POST , name = "更新用户信息")
    @ResponseBody
    public void update(PFStaffVO staffVO){
        this.logger.info("更新用户信息：" , staffVO);
        this.pfStaffService.update(staffVO);

        IyeekuUserInfo userInfo = ContextUtil.getLoginUser();
        this.pfAuditLogService.saveAuditLog("user_management" , "04" , userInfo.getUserId() , userInfo.getUserIP() ,
                userInfo.getUserId() , true , "更新用户信息" , JsonUtil.bean2Json(staffVO));
    }

    @RequestMapping(value = "/list" , method = RequestMethod.POST , name = "查询用户列表信息")
    @ResponseBody
    public Map<String,Object> findAllInfos(PFStaffVO staffVO , Pagination pagination){
        return this.pfStaffService.findAllStaffs(staffVO,pagination);
    }

    @RequestMapping(value = "/query" , method = RequestMethod.POST , name = "根据用户主键获取用户信息")
    @ResponseBody
    public PFStaffVO query(String yhbh){
        return this.pfStaffService.findStaffByYhbh(yhbh);
    }

    @RequestMapping(value = "/listRole" , method = RequestMethod.POST , name = "用户查看角色信息列表查询")
    @ResponseBody
    public Map<String,Object> listRole(String yhbh,String jsmc,Pagination pagination){
        return null;
    }

    @RequestMapping(value = "/listNotAddedRole" , method = RequestMethod.POST , name = "用户未分配角色信息列表查询")
    @ResponseBody
    public Map<String,Object> listNotAddedRole(String yhbh,String jsmc,Pagination pagination){
        return this.pfRoleService.getListNotAddedRole(yhbh,jsmc,pagination);
    }

    @RequestMapping(value = "/comfirmAddRole" , method = RequestMethod.POST , name = "为用户分配角色")
    @ResponseBody
    public void comfirmAddRole(){

    }

    @RequestMapping(value = "/comfirmRemoveRole" , method = RequestMethod.POST , name = "删除给用户分配的角色")
    @ResponseBody
    public void comfirmRemoveRole(){

    }

    @RequestMapping(value = "/enabledStaff" , method = RequestMethod.POST , name = "启用用户")
    @ResponseBody
    public void enabledStaff(String param){

    }

    @RequestMapping(value = "/lock" , method = RequestMethod.POST , name = "锁定用户")
    @ResponseBody
    public void lock(String param){

    }

    @RequestMapping(value = "/unlock" , method = RequestMethod.POST , name = "解锁用户")
    @ResponseBody
    public void unlock(String param){

    }

    @RequestMapping(value = "/changePwd" , method = RequestMethod.POST , name = "修改用户密码")
    @ResponseBody
    public void changePwd(String param){

    }

    @RequestMapping(value = "exportExcel" , method = RequestMethod.GET , name = "用户导出excel")
    @ResponseBody
    public void exportExcel(HttpServletRequest request , HttpServletResponse response){

    }
    
}
