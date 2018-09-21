package com.iyeeku.ext.commonPermission.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.ext.commonPermission.dao.CommonPermissionDao;
import com.iyeeku.ext.function.vo.PFResMenuVO;
import com.iyeeku.ext.grant.vo.PFArcGrantVO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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
    public List<PFArcGrantVO> findSSmkGrantInfo(Map<String, String> map) {
        return this.queryAll_myBatis("com.iyeeku.ext.grant.dao.PFArcGrantDao.findSSmkGrantInfo" ,map);
    }

    @Override
    public void updateMenuOrUrlRolePer(PFArcGrantVO arcGrantVO) {
        this.update_myBatis("com.iyeeku.ext.grant.dao.PFArcGrantDao.updateMenuOrUrlRolePer" , arcGrantVO);
    }

    @Override
    public void addCommonPer(PFArcGrantVO arcGrantVO) {
        this.save_myBatis("com.iyeeku.ext.grant.dao.PFArcGrantDao.saveGrant" , arcGrantVO);
    }

    @Override
    public void delMenuPer(PFArcGrantVO arcGrantVO) {
        this.update_myBatis("com.iyeeku.ext.grant.dao.PFArcGrantDao.delMenuPer" ,arcGrantVO);
    }

    @Override
    public void delCommonPer(PFArcGrantVO arcGrantVO) {
        this.update_myBatis("com.iyeeku.ext.grant.dao.PFArcGrantDao.updateMenuPer" , arcGrantVO);
    }

}
