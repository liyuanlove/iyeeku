package com.iyeeku.ext.auditlog.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.ext.auditlog.dao.PFAuditLogDao;
import com.iyeeku.ext.auditlog.vo.PFAuditLogVO;
import org.springframework.stereotype.Repository;

@Repository
public class PFAuditLogDaoImpl extends BaseDaoImpl implements PFAuditLogDao {

    @Override
    public void save(PFAuditLogVO auditLogVO) {
        this.save_myBatis("com.iyeeku.ext.auditlog.dao.PFAuditLogDao.insert" , auditLogVO);
    }
}
