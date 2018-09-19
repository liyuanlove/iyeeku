package com.iyeeku.ext.commonPermission.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.ext.commonPermission.dao.CommonPermissionDao;
import com.iyeeku.ext.function.vo.PFResMenuVO;
import com.iyeeku.ext.grant.vo.PFArcGrantVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommonPermissionDaoImpl extends BaseDaoImpl implements CommonPermissionDao {

    @Override
    public List<PFResMenuVO> findRoleMenu(PFArcGrantVO arcGrantVO) {
        return this.queryAll_myBatis("com.iyeeku.ext.function.dao.PFResMenuDao.findRoleMenu" , arcGrantVO);
    }

    @Override
    public List<PFResMenuVO> findPerParentMenu(PFArcGrantVO arcGrantVO) {
        return this.queryAll_myBatis("com.iyeeku.ext.function.dao.PFResMenuDao.findPerParentMenu" , arcGrantVO);
    }

    @Override
    public List<PFResMenuVO> findPerLeafMenu(PFArcGrantVO arcGrantVO) {
        return this.queryAll_myBatis("com.iyeeku.ext.function.dao.PFResMenuDao.findPerLeafMenu" , arcGrantVO);
    }

    @Override
    public void updateMenuOrUrlRolePer(PFArcGrantVO arcGrantVO) {
        this.update_myBatis("" , arcGrantVO);
    }

    @Override
    public void addCommonPer(PFArcGrantVO arcGrantVO) {
        this.save_myBatis("" , arcGrantVO);
    }

}
