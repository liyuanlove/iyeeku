package com.iyeeku.ext.common.arcuserauth.service.impl;

import com.iyeeku.ext.common.arcuserauth.dao.PFArcUserAuthDao;
import com.iyeeku.ext.common.arcuserauth.service.PFArcUserAuthService;
import com.iyeeku.ext.common.arcuserauth.vo.PFArcUserAuthVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PFArcUserAuthServiceImpl implements PFArcUserAuthService {

    @Autowired
    private PFArcUserAuthDao pfArcUserAuthDao;

    @Override
    public PFArcUserAuthVO findUserByYhbh(String yhbh) {
        return this.pfArcUserAuthDao.findUserByYhbh(yhbh);
    }

    @Override
    public void update(PFArcUserAuthVO userAuthVO) {
        this.pfArcUserAuthDao.update(userAuthVO);
    }
}
