package com.iyeeku.ext.role.dao;

import com.iyeeku.ext.role.vo.PFRoleVO;
import com.iyeeku.ext.staff.vo.PFStaffVO;

import java.util.List;

public interface PFRoleDao {

    public abstract List<PFRoleVO> findAllRoles(PFRoleVO role , int offSet , int pageSize);

    public abstract List<PFRoleVO> findListAddedRole(String yhbh, String jsmc, int offSet , int pageSize);

    public abstract int findListAddedRoleCount(String yhbh, String jsmc);

    public abstract List<PFRoleVO> findListNotAddedRole(String yhbh, String jsmc, int offSet , int pageSize);

    public abstract int findListNotAddedRoleCount(String yhbh , String jsmc);

    public abstract Integer findAllInfosCount(PFRoleVO role);

    public abstract PFRoleVO findRoleByJsbh(String jsbh);

    public abstract void saveRole(PFRoleVO role);

    public abstract void updateRole(PFRoleVO role);

    public abstract void deleteRole(String jsbh);

    public abstract List<PFStaffVO> findListStaff(String jsbh , int offSet , int pageSize);

    public abstract int findListStaffCount(String jsbh);

}
