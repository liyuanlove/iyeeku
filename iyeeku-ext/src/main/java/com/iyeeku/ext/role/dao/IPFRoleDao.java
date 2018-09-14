package com.iyeeku.ext.role.dao;

import com.iyeeku.ext.role.vo.PFRole;
import com.iyeeku.ext.staff.vo.PFStaffVO;

import java.util.List;

public interface IPFRoleDao {

    public abstract List<PFRole> findAllRoles(PFRole role , int offSet , int pageSize);

    public abstract List<PFRole> findListNotAddedRole(String yhbh,String jsmc,int offSet , int pageSize);

    public abstract int findListNotAddedRoleCount(String yhbh , String jsmc);

    public abstract Integer findAllInfosCount(PFRole role);

    public abstract PFRole findRoleByJsbh(String jsbh);

    public abstract void saveRole(PFRole role);

    public abstract void updateRole(PFRole role);

    public abstract void deleteRole(String jsbh);

    public abstract List<PFStaffVO> findListStaff(String jsbh , int offSet , int pageSize);

    public abstract int findListStaffCount(String jsbh);

}
