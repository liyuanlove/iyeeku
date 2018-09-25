package com.iyeeku.ext.common.arcuserauth.dao;

import com.iyeeku.ext.common.arcuserauth.vo.PFArcUserAuthVO;

public interface PFArcUserAuthDao {

    public abstract PFArcUserAuthVO findUserByYhbh(String yhbh);

    public abstract void update(PFArcUserAuthVO userAuthVO);

}
