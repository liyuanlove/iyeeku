package com.iyeeku.ext.common.arcuserauth.service;

import com.iyeeku.ext.common.arcuserauth.vo.PFArcUserAuthVO;

public interface PFArcUserAuthService {

    public abstract PFArcUserAuthVO findUserByYhbh(String yhbh);

    public abstract void update(PFArcUserAuthVO userAuthVO);

}
