package com.iyeeku.ext.role.service;

import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.role.vo.PFRoleVO;

import java.util.Map;


public interface PFRoleService {

    public abstract Map<String , Object> findAllRoleInfos(PFRoleVO role , Pagination pagination);

    public abstract Map<String , Object> findAllRoleStaffInfos(String jsbh , Pagination pagination);

    public abstract Map<String , Object> getListNotAddedStaff(Map<String,String> map , Pagination pagination);

    public abstract Map<String , Object> getListNotAddedRole(String yhbh , String jsmc , Pagination pagination);

    public abstract PFRoleVO findRoleByJsbh(String jsbh);

    public abstract void saveRole(PFRoleVO role);

    public abstract void updateRole(PFRoleVO role);

    public abstract void deleteRole(String jsbh);

}
