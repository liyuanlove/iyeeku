package com.iyeeku.ext.role.service.impl;

import com.iyeeku.core.utils.UUIDGenerator;
import com.iyeeku.ext.role.dao.IPFRoleDao;
import com.iyeeku.ext.role.service.IPFRoleService;
import com.iyeeku.ext.role.vo.PFRole;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service("iPFRoleService")
public class PFRoleServiceImpl implements IPFRoleService {

    private final Logger logger = LoggerFactory.getLogger(PFRoleServiceImpl.class);

    @Resource(name="iPFRoleDao")
    private IPFRoleDao iPFRoleDao;

    @Override
    public List<PFRole> findAllRoles() {
        this.logger.info("PFRoleServiceImpl findAllRoles");
        return this.iPFRoleDao.findAllRoles();
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
