package com.iyeeku.ext.common.arcuserauth.service.impl;

import com.iyeeku.ext.common.arcuserauth.dao.PFArcUserAuthDao;
import com.iyeeku.ext.common.arcuserauth.service.PFArcUserAuthService;
import com.iyeeku.ext.common.arcuserauth.vo.PFArcUserAuthVO;

public class PFArcUserAuthServiceImpl implements PFArcUserAuthService {

    private PFArcUserAuthDao pfArcUserAuthDao;

    @Override
    public PFArcUserAuthVO findUserByYhbh(String yhbh) {
        return this.pfArcUserAuthDao.findUserByYhbh(yhbh);
    }

    @Override
    public void update(PFArcUserAuthVO userAuthVO) {
        this.pfArcUserAuthDao.update(userAuthVO);
    }


    public PFArcUserAuthDao getPfArcUserAuthDao() {
        return pfArcUserAuthDao;
    }

    public void setPfArcUserAuthDao(PFArcUserAuthDao pfArcUserAuthDao) {
        this.pfArcUserAuthDao = pfArcUserAuthDao;
    }
}
