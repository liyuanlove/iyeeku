package com.iyeeku.ext.rolestaff.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.ext.rolestaff.dao.PFRoleStaffDao;
import com.iyeeku.ext.rolestaff.vo.PFRoleStaffVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class PFRoleStaffDaoImpl extends BaseDaoImpl implements PFRoleStaffDao {

    private final Logger logger = LoggerFactory.getLogger(PFRoleStaffDaoImpl.class);

    @Override
    public void insert(PFRoleStaffVO roleStaffVO) {
        this.save_myBatis("com.iyeeku.ext.rolestaff.dao.PFRoleStaffDao.insert" , roleStaffVO);
    }

    @Override
    public List<PFRoleStaffVO> findRoleStaffByYhbhAndJsbh(String yhbh, String jsbh) {
        Map<String,String> param = new HashMap<>();
        param.put("yhbh" , yhbh);
        param.put("jsbh" , jsbh);
        return this.queryAll_myBatis("com.iyeeku.ext.rolestaff.dao.PFRoleStaffDao.findRoleStaffByYhbhAndJsbh" , param);
    }

}
