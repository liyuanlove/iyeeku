package com.iyeeku.ext.auditlog.dao;

import com.iyeeku.ext.auditlog.vo.PFAuditLogVO;

public interface PFAuditLogDao {

    public abstract void save(PFAuditLogVO auditLogVO);

}
