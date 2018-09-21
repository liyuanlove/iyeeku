package com.iyeeku.ext.permissionRelation.service;

import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.function.vo.PFResUrlVO;

import java.util.List;
import java.util.Map;

public interface RoleRelationPermissionService {

    public abstract Map<String,Object> listRole(String jsmc , Pagination pagination);

    public abstract void addRoleMenuPer(String sqdxbh , String[] param1 , String[] param2 , String string1 , String string2 , String string3);

    public abstract List<PFResUrlVO> findRoleMenunodeUrl(String cdbh , String sqdxbh , String gnssmk);

    public abstract List<PFResUrlVO> findSsmkUrl(String key , String cdbh , String sqdxbh , String gnssmk);

}
