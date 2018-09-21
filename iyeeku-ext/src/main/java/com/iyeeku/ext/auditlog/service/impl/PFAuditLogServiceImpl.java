package com.iyeeku.ext.auditlog.service.impl;

import com.iyeeku.ext.auditlog.dao.PFAuditLogDao;
import com.iyeeku.ext.auditlog.service.PFAuditLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PFAuditLogServiceImpl implements PFAuditLogService {

    @Autowired
    private PFAuditLogDao pfAuditLogDao;



}
