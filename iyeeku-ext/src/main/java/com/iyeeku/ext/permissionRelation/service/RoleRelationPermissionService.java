package com.iyeeku.ext.permissionRelation.service;

import com.iyeeku.core.vo.Pagination;

import java.util.Map;

public interface RoleRelationPermissionService {

    public abstract Map<String,Object> listRole(String jsmc , Pagination pagination);

    public abstract void addRoleMenuPer(String sqdxbh , String[] param1 , String[] param2 , String string1 , String string2 , String string3);

}
