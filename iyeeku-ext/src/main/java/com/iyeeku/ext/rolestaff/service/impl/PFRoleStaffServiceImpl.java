package com.iyeeku.ext.rolestaff.service.impl;

import com.iyeeku.core.utils.UUIDGenerator;
import com.iyeeku.ext.rolestaff.dao.PFRoleStaffDao;
import com.iyeeku.ext.rolestaff.service.PFRoleStaffService;
import com.iyeeku.ext.rolestaff.vo.PFRoleStaffVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class PFRoleStaffServiceImpl implements PFRoleStaffService {

    private final Logger logger = LoggerFactory.getLogger(PFRoleStaffServiceImpl.class);

    @Autowired
    private PFRoleStaffDao pfRoleStaffDao;

    @Override
    public void saveRoleStaff(PFRoleStaffVO roleStaff) {
        roleStaff.setZj(UUIDGenerator.generate(""));
        roleStaff.setJlzt("1");
        roleStaff.setCjsj(new Date());
        this.pfRoleStaffDao.insert(roleStaff);
    }

    @Override
    public boolean hasUnverifidRecord(String yhbh, String jsbh) {
        List<PFRoleStaffVO> list = this.pfRoleStaffDao.findRoleStaffByYhbhAndJsbh(yhbh,jsbh);
        if ( list != null && list.size() > 0 ){
            return true;
        }
        return false;
    }

}
