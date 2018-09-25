package com.iyeeku.ext.common.arcuserauth.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.ext.common.arcuserauth.dao.PFArcUserAuthDao;
import com.iyeeku.ext.common.arcuserauth.vo.PFArcUserAuthVO;
import org.springframework.stereotype.Repository;

@Repository
public class PFArcUserAuthDaoImpl extends BaseDaoImpl implements PFArcUserAuthDao {

    @Override
    public PFArcUserAuthVO findUserByYhbh(String yhbh) {
        return this.queryOne_myBatis("com.iyeeku.ext.common.arcuserauth.dao.PFArcUserAuthDao.findUserByYhbh" , yhbh);
    }

    @Override
    public void update(PFArcUserAuthVO userAuthVO) {
        this.update_myBatis("com.iyeeku.ext.common.arcuserauth.dao.PFArcUserAuthDao.update" , userAuthVO);
    }
}
