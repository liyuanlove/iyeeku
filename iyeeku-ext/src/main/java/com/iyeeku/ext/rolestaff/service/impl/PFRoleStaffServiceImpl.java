package com.iyeeku.ext.rolestaff.service.impl;

import com.iyeeku.ext.rolestaff.dao.PFRoleStaffDao;
import com.iyeeku.ext.rolestaff.service.PFRoleStaffService;
import com.iyeeku.ext.rolestaff.vo.PFRoleStaff;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PFRoleStaffServiceImpl implements PFRoleStaffService {

    private final Logger logger = LoggerFactory.getLogger(PFRoleStaffServiceImpl.class);

    @Autowired
    private PFRoleStaffDao pfRoleStaffDao;

    @Override
    public void saveRoleStaff(PFRoleStaff roleStaff) {

    }

}
