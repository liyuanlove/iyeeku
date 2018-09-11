package com.iyeeku.ext.role.service;

import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.role.vo.PFRole;

import java.util.Map;


public interface IPFRoleService {

    public Map<String , Object> findAllRoleInfos(PFRole role , Pagination pagination);

    public Map<String , Object> findAllRoleStaffInfos(String jsbh , Pagination pagination);

    public PFRole findRoleByJsbh(String jsbh);

    public void saveRole(PFRole role);

    public void updateRole(PFRole role);

    public void deleteRole(String jsbh);

}
