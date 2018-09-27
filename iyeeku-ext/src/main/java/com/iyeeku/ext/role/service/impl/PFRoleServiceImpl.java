package com.iyeeku.ext.role.service.impl;

import com.iyeeku.core.context.ContextUtil;
import com.iyeeku.core.util.UUIDGenerator;
import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.role.dao.PFRoleDao;
import com.iyeeku.ext.role.service.PFRoleService;
import com.iyeeku.ext.role.vo.PFRoleVO;
import com.iyeeku.ext.staff.service.PFStaffService;
import com.iyeeku.ext.staff.vo.PFStaffVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PFRoleServiceImpl implements PFRoleService {

    private final Logger logger = LoggerFactory.getLogger(PFRoleServiceImpl.class);

    private PFRoleDao pfRoleDao;

    private PFStaffService pfStaffService;

    @Override
    public Map<String , Object> findAllRoleInfos(PFRoleVO role , Pagination pagination) {
        this.logger.info("PFRoleServiceImpl findAllRoles");
        List<PFRoleVO> data = this.pfRoleDao.findAllRoles(role , pagination.getPageIndex()*pagination.getPageSize() , pagination.getPageSize());
        Integer total = this.pfRoleDao.findAllInfosCount(role);
        Map<String , Object> result = new HashMap<>();
        result.put("data",data);
        result.put("total",total);
        return result;
    }

    @Override
    public Map<String, Object> getListNotAddedStaff(Map<String, String> map, Pagination pagination) {
        return this.pfStaffService.getListNotAddedStaff(map,pagination);
    }

    @Override
    public Map<String, Object> getListNotAddedRole(String yhbh, String jsmc, Pagination pagination) {
        
        return null;
    }

    @Override
    public Map<String, Object> findAllRoleStaffInfos(String jsbh, Pagination pagination) {
        Map<String,Object> result = new HashMap<>();
        List<PFStaffVO> data = this.pfRoleDao.findListStaff(jsbh,pagination.getPageIndex(),pagination.getPageSize());
        int total = this.pfRoleDao.findListStaffCount(jsbh);
        result.put("data" , data);
        result.put("total",total);
        return result;
    }

    @Override
    public PFRoleVO findRoleByJsbh(String jsbh) {
        this.logger.info("PFRoleServiceImpl findRoleByJsbh");
        return this.pfRoleDao.findRoleByJsbh(jsbh);
    }

    @Override
    public void saveRole(PFRoleVO role) {
        this.logger.info("PFRoleServiceImpl saveRole");
        role.setJsbh(UUIDGenerator.generate(""));
        role.setCjr(ContextUtil.getLoginUser().getUserId());
        role.setCjsj(new Date());
        role.setJlzt("1");
        this.pfRoleDao.saveRole(role);
    }

    @Override
    public void updateRole(PFRoleVO role) {
        this.logger.info("PFRoleServiceImpl updateRole");
        role.setZhxgr(ContextUtil.getLoginUser().getUserId());
        role.setZhxgsj(new Date());
        this.pfRoleDao.updateRole(role);
    }

    @Override
    public void deleteRole(String jsbh) {
        this.logger.info("PFRoleServiceImpl deleteRole");
        this.pfRoleDao.deleteRole(jsbh);
    }

    public void setPfRoleDao(PFRoleDao pfRoleDao) {
        this.pfRoleDao = pfRoleDao;
    }

    public void setPfStaffService(PFStaffService pfStaffService) {
        this.pfStaffService = pfStaffService;
    }

}
