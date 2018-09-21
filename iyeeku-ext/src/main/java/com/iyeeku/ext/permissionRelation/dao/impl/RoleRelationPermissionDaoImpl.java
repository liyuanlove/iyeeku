package com.iyeeku.ext.permissionRelation.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.ext.function.vo.PFResUrlVO;
import com.iyeeku.ext.permissionRelation.dao.RoleRelationPermissionDao;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class RoleRelationPermissionDaoImpl extends BaseDaoImpl implements RoleRelationPermissionDao {

    @Override
    public List<PFResUrlVO> findRoleMenunodeUrl(Map<String, String> map) {
        return this.queryAll_myBatis("com.iyeeku.ext.function.dao.PFResUrlDao.findRoleMenunodeUrl" , map);
    }

    @Override
    public List<PFResUrlVO> findSsmkUrl(Map<String, String> map) {
        return this.queryAll_myBatis("com.iyeeku.ext.function.dao.PFResUrlDao.findSsmkUrl" , map);
    }

}
