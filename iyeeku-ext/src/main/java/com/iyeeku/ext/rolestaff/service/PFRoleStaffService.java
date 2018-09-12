package com.iyeeku.ext.rolestaff.service;

import com.iyeeku.ext.rolestaff.vo.PFRoleStaffVO;

public interface PFRoleStaffService {

    public abstract void saveRoleStaff(PFRoleStaffVO roleStaff);

    public abstract void deleteRoleStaff(PFRoleStaffVO roleStaffVO);

    public abstract boolean hasUnverifidRecord(String yhbh , String jsbh);

}
