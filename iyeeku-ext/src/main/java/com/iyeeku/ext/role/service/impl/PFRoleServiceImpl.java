package com.iyeeku.ext.role.service.impl;

import com.iyeeku.core.utils.UUIDGenerator;
import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.role.dao.IPFRoleDao;
import com.iyeeku.ext.role.service.PFRoleService;
import com.iyeeku.ext.role.vo.PFRole;
import com.iyeeku.ext.staff.service.PFStaffService;
import com.iyeeku.ext.staff.vo.PFStaffVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("iPFRoleService")
public class PFRoleServiceImpl implements PFRoleService {

    private final Logger logger = LoggerFactory.getLogger(PFRoleServiceImpl.class);

    @Resource(name="iPFRoleDao")
    private IPFRoleDao iPFRoleDao;

    @Autowired
    private PFStaffService pfStaffService;

    @Override
    public Map<String , Object> findAllRoleInfos(PFRole role , Pagination pagination) {
        this.logger.info("PFRoleServiceImpl findAllRoles");
        List<PFRole> data = this.iPFRoleDao.findAllRoles(role , pagination.getPageIndex()*pagination.getPageSize() , pagination.getPageSize());
        Integer total = this.iPFRoleDao.findAllInfosCount(role);
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
        List<PFStaffVO> data = this.iPFRoleDao.findListStaff(jsbh,pagination.getPageIndex(),pagination.getPageSize());
        int total = this.iPFRoleDao.findListStaffCount(jsbh);
        result.put("data" , data);
        result.put("total",total);
        return result;
    }

    @Override
    public PFRole findRoleByJsbh(String jsbh) {
        this.logger.info("PFRoleServiceImpl findRoleByJsbh");
        return this.iPFRoleDao.findRoleByJsbh(jsbh);
    }

    @Override
    public void saveRole(PFRole role) {
        this.logger.info("PFRoleServiceImpl saveRole");
        role.setJsbh(UUIDGenerator.generate(""));
        role.setCjsj(new Date());
        role.setJlzt("1");
        this.iPFRoleDao.saveRole(role);
    }

    @Override
    public void updateRole(PFRole role) {
        this.logger.info("PFRoleServiceImpl updateRole");
        this.iPFRoleDao.updateRole(role);
    }

    @Override
    public void deleteRole(String jsbh) {
        this.logger.info("PFRoleServiceImpl deleteRole");
        this.iPFRoleDao.deleteRole(jsbh);
    }
}
