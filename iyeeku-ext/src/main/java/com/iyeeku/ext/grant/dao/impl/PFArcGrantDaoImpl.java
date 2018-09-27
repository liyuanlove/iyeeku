package com.iyeeku.ext.grant.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.ext.grant.dao.PFArcGrantDao;
import com.iyeeku.ext.grant.vo.PFArcGrantVO;

import java.util.List;

public class PFArcGrantDaoImpl extends BaseDaoImpl implements PFArcGrantDao {

    @Override
    public List<PFArcGrantVO> findGrantBySqdxbh(PFArcGrantVO arcGrantVO) {
        return this.queryAll_myBatis("com.iyeeku.ext.grant.dao.PFArcGrantDao.findGrantBySqdxbh" , arcGrantVO);
    }

    @Override
    public void updateMenuOrUrlRolePer(PFArcGrantVO arcGrantVO) {
        this.update_myBatis("com.iyeeku.ext.grant.dao.PFArcGrantDao.updateMenuOrUrlRolePer" , arcGrantVO);
    }

    @Override
    public List<PFArcGrantVO> findGrantByZdxbm(PFArcGrantVO arcGrantVO) {
        return this.queryAll_myBatis("com.iyeeku.ext.grant.dao.PFArcGrantDao.findGrantByZdxbm" , arcGrantVO);
    }

    @Override
    public void saveGrant(PFArcGrantVO arcGrantVO) {
        this.save_myBatis("com.iyeeku.ext.grant.dao.PFArcGrantDao.saveGrant" , arcGrantVO);
    }

    @Override
    public void updateGrant(PFArcGrantVO arcGrantVO) {
        this.update_myBatis("com.iyeeku.ext.grant.dao.PFArcGrantDao.updateGrant" , arcGrantVO);
    }
}
