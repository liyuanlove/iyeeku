package com.iyeeku.ext.role.service;

import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.role.vo.PFRole;

import java.util.Map;


public interface PFRoleService {

    public abstract Map<String , Object> findAllRoleInfos(PFRole role , Pagination pagination);

    public abstract Map<String , Object> findAllRoleStaffInfos(String jsbh , Pagination pagination);

    public abstract Map<String , Object> getListNotAddedStaff(Map<String,String> map , Pagination pagination);

    public abstract PFRole findRoleByJsbh(String jsbh);

    public abstract void saveRole(PFRole role);

    public abstract void updateRole(PFRole role);

    public abstract void deleteRole(String jsbh);

}
