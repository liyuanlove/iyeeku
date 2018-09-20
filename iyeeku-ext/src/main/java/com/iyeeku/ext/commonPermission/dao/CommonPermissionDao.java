package com.iyeeku.ext.commonPermission.dao;

import com.iyeeku.ext.function.vo.PFResMenuVO;
import com.iyeeku.ext.grant.vo.PFArcGrantVO;

import java.util.List;
import java.util.Map;

public interface CommonPermissionDao {

    public abstract List<PFResMenuVO> findRoleMenu(PFArcGrantVO arcGrantVO);

    public abstract List<PFResMenuVO> findPerParentMenu(PFArcGrantVO arcGrantVO);

    public abstract List<PFResMenuVO> findPerLeafMenu(PFArcGrantVO arcGrantVO);

    public abstract List<PFArcGrantVO> findSSmkGrantInfo(Map<String ,String> map);

    public abstract void updateMenuOrUrlRolePer(PFArcGrantVO arcGrantVO);

    public abstract void addCommonPer(PFArcGrantVO arcGrantVO);

    public abstract void delMenuPer(PFArcGrantVO arcGrantVO);

    public abstract void delCommonPer(PFArcGrantVO arcGrantVO);


}
