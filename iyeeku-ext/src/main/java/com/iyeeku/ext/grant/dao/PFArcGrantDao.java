package com.iyeeku.ext.grant.dao;

import com.iyeeku.ext.grant.vo.PFArcGrantVO;

import java.util.List;

public interface PFArcGrantDao {

    public abstract List<PFArcGrantVO> findGrantBySqdxbh(PFArcGrantVO arcGrantVO);

    public abstract void updateMenuOrUrlRolePer(PFArcGrantVO arcGrantVO);

    public abstract List<PFArcGrantVO> findGrantByZdxbm(PFArcGrantVO arcGrantVO);

    public abstract void saveGrant(PFArcGrantVO arcGrantVO);

    public abstract void updateGrant(PFArcGrantVO arcGrantVO);

}
