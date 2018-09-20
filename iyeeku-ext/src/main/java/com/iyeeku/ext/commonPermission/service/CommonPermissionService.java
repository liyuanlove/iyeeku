package com.iyeeku.ext.commonPermission.service;

import com.iyeeku.ext.function.vo.PFResMenuVO;
import com.iyeeku.ext.grant.vo.PFArcGrantVO;

import java.util.List;
import java.util.Map;

public interface CommonPermissionService {

    public abstract List<PFResMenuVO> findRoleMenu(String sqdxbh);

    public abstract Map<String,Object> findChooseAllMenu(String jsbh);

    public abstract List<PFResMenuVO> findPerLeafMenu(String sqdxbh);

    public abstract List<PFResMenuVO> findPerParentMenu(String sqdxbh);

    /**
     * 获取某一模块的授权信息
     * @param map
     * @return
     */
    public abstract List<PFArcGrantVO> findSSmkGrantInfo(Map<String,String> map);

    public abstract Boolean isExist(PFArcGrantVO arcGrantVO);

    public abstract void updateMenuOrUrlRolePer(PFArcGrantVO arcGrantVO);

    public abstract void addCommonPer(PFArcGrantVO arcGrantVO);

    public abstract void delMenuPer(PFArcGrantVO arcGrantVO);

    public abstract void delCommonPer(PFArcGrantVO arcGrantVO);



}
