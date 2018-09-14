package com.iyeeku.ext.role.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.ext.role.dao.IPFRoleDao;
import com.iyeeku.ext.role.vo.PFRole;
import com.iyeeku.ext.staff.vo.PFStaffVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("iPFRoleDao")
public class PFRoleDaoImpl extends BaseDaoImpl implements IPFRoleDao {

    private final Logger logger = LoggerFactory.getLogger(PFRoleDaoImpl.class);

    @Override
    public List<PFRole> findAllRoles(PFRole role , int offSet , int pageSize) {
        this.logger.info("PFRoleDaoImpl findAllRoles");
        List<PFRole> list = this.queryAll_myBatis("com.iyeeku.ext.role.dao.IPFRoleDao.findAllRoles",role , offSet , pageSize);
        return list;
    }

    @Override
    public Integer findAllInfosCount(PFRole role) {
        this.logger.info("PFRoleDaoImpl findAllInfoCount");
        return this.queryOne_myBatis("com.iyeeku.ext.role.dao.IPFRoleDao.findAllInfosCount",role);
    }

    @Override
    public List<PFRole> findListNotAddedRole(String yhbh, String jsmc, int offSet, int pageSize) {
        Map<String,String> map = new HashMap<>();
        map.put("yhbh" , yhbh);
        map.put("jsmc" , jsmc);
        return this.queryAll_myBatis("com.iyeeku.ext.role.dao.IPFRoleDao.findListNotAddedRole" , map , offSet , pageSize);
    }

    @Override
    public int findListNotAddedRoleCount(String yhbh, String jsmc) {
        Map<String,String> map = new HashMap<>();
        map.put("yhbh" , yhbh);
        map.put("jsmc" , jsmc);
        return this.queryOne_myBatis("com.iyeeku.ext.role.dao.IPFRoleDao.findListNotAddedRoleCount" ,(Serializable)map);
    }

    @Override
    public PFRole findRoleByJsbh(String jsbh) {
        this.logger.info("PFRoleDaoImpl findRoleByJsbh");
        return this.queryOne_myBatis("com.iyeeku.ext.role.dao.IPFRoleDao.findRoleByJsbh",jsbh);
    }

    @Override
    public void saveRole(PFRole role) {
        this.logger.info("PFRoleDaoImpl saveRole");
        this.save_myBatis("com.iyeeku.ext.role.dao.IPFRoleDao.saveRole",role);
    }

    @Override
    public void updateRole(PFRole role) {
        this.logger.info("PFRoleDaoImpl updateRole");
        this.update_myBatis("com.iyeeku.ext.role.dao.IPFRoleDao.updateRole",role);
    }

    @Override
    public void deleteRole(String jsbh) {
        this.logger.info("PFRoleDaoImpl deleteRole");
        this.delete_myBatis("com.iyeeku.ext.role.dao.IPFRoleDao.deleteRole",jsbh);
    }

    @Override
    public List<PFStaffVO> findListStaff(String jsbh, int offSet, int pageSize) {
        return this.queryAll_myBatis("com.iyeeku.ext.role.dao.IPFRoleDao.findListStaff",jsbh,offSet,pageSize);
    }

    @Override
    public int findListStaffCount(String jsbh) {
        return this.queryOne_myBatis("com.iyeeku.ext.role.dao.IPFRoleDao.findListStaffCount",jsbh);
    }

}
