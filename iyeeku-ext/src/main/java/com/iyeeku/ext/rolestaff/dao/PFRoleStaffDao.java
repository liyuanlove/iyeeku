package com.iyeeku.ext.rolestaff.dao;

import com.iyeeku.ext.rolestaff.vo.PFRoleStaffVO;

import java.util.List;

public interface PFRoleStaffDao {

    public abstract void insert(PFRoleStaffVO roleStaffVO);

    public abstract List<PFRoleStaffVO> findRoleStaffByYhbhAndJsbh(String yhbh , String jsbh);


}
