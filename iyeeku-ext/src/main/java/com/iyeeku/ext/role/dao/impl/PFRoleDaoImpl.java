package com.iyeeku.ext.role.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.ext.role.dao.IPFRoleDao;
import com.iyeeku.ext.role.vo.PFRole;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

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

}
