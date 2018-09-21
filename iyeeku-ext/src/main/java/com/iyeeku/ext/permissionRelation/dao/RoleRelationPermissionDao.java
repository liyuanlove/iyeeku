package com.iyeeku.ext.permissionRelation.dao;

import com.iyeeku.ext.function.vo.PFResUrlVO;

import java.util.List;
import java.util.Map;

public interface RoleRelationPermissionDao {

    public abstract List<PFResUrlVO> findRoleMenunodeUrl(Map<String,String> map);

    public abstract List<PFResUrlVO> findSsmkUrl(Map<String,String> map);

}
