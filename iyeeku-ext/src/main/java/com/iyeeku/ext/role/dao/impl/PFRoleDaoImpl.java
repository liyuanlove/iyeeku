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
    public List<PFRole> findAllRoles() {
        this.logger.info("PFRoleDaoImpl findAllRoles");
        return null;
    }


}
