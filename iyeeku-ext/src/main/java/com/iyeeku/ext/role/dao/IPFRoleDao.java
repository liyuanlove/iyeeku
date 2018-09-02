package com.iyeeku.ext.role.dao;

import com.iyeeku.ext.role.vo.PFRole;

import java.util.List;

public interface IPFRoleDao {

    public List<PFRole> findAllRoles();

    public PFRole findRoleByJsbh(String jsbh);

    public void saveRole(PFRole role);

    public void updateRole(PFRole role);

    public void deleteRole(String jsbh);
}
