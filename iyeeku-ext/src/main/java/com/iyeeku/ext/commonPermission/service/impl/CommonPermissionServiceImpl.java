package com.iyeeku.ext.commonPermission.service.impl;

import com.iyeeku.core.context.ContextUtil;
import com.iyeeku.ext.commonPermission.dao.CommonPermissionDao;
import com.iyeeku.ext.commonPermission.service.CommonPermissionService;
import com.iyeeku.ext.function.dao.PFResMenuDao;
import com.iyeeku.ext.function.vo.PFResMenuVO;
import com.iyeeku.ext.grant.dao.PFArcGrantDao;
import com.iyeeku.ext.grant.vo.PFArcGrantVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;

@Service
public class CommonPermissionServiceImpl implements CommonPermissionService {

    @Autowired
    private CommonPermissionDao commonPermissionDao;
    @Autowired
    private PFResMenuDao pfResMenuDao;
    @Autowired
    private PFArcGrantDao pfArcGrantDao;

    @Override
    public List<PFResMenuVO> findRoleMenu(String sqdxbh) {
        PFArcGrantVO arcGrantVO = new PFArcGrantVO();
        if (StringUtils.isEmpty(sqdxbh)){
            arcGrantVO.setSqdxbh("R99999998");
        }else{
            arcGrantVO.setSqdxbh(sqdxbh);
        }

        arcGrantVO.setSqzylx("CD");
        arcGrantVO.setJlzt("1");
        return this.commonPermissionDao.findRoleMenu(arcGrantVO);
    }

    @Override
    public List<PFResMenuVO> findPerParentMenu(String sqdxbh) {
        PFArcGrantVO arcGrantVO = new PFArcGrantVO();
        if (StringUtils.isEmpty(sqdxbh)){
            arcGrantVO.setSqdxbh("R99999998");
        }else{
            arcGrantVO.setSqdxbh(sqdxbh);
        }
        arcGrantVO.setSqzylx("CD");
        arcGrantVO.setJlzt("1");
        return this.commonPermissionDao.findPerParentMenu(arcGrantVO);
    }

    @Override
    public List<PFResMenuVO> findPerLeafMenu(String sqdxbh) {
        PFArcGrantVO arcGrantVO = new PFArcGrantVO();
        if (StringUtils.isEmpty(sqdxbh)){
            arcGrantVO.setSqdxbh("R99999998");
        }else{
            arcGrantVO.setSqdxbh(sqdxbh);
        }
        arcGrantVO.setSqzylx("CD");
        arcGrantVO.setJlzt("1");
        return this.commonPermissionDao.findPerLeafMenu(arcGrantVO);
    }

    @Override
    public Map<String, Object> findChooseAllMenu(String jsbh) {
        Map<String,Object> menuMap = new HashMap<>();
        PFResMenuVO menuVO = null;

        List<PFResMenuVO> allList = this.pfResMenuDao.findAllMenu();
        List<Map<String,String>> rtnList = new ArrayList<>();

        for (PFResMenuVO vo : allList){
            Map<String,String> rtnMap = new HashMap<>();
            rtnMap.put("id" , vo.getCdbh());
            rtnMap.put("text" , vo.getCdmc());
            rtnMap.put("pid" , vo.getSjcdbh());
            rtnMap.put("cdurl" , vo.getCdurl());
            rtnMap.put("cdlx" , vo.getCdlx());
            rtnMap.put("cdurlbh" , vo.getCdurl());
            rtnList.add(rtnMap);
        }
        menuMap.put("treeNodes" , rtnList);
        return menuMap;
    }

    @Override
    public Boolean isExist(PFArcGrantVO arcGrantVO) {
        List<PFArcGrantVO> list = this.pfArcGrantDao.findGrantBySqdxbh(arcGrantVO);
        if (list != null && list.size() > 0){
            return Boolean.valueOf(true);
        }
        return Boolean.valueOf(false);
    }

    @Override
    public void updateMenuOrUrlRolePer(PFArcGrantVO arcGrantVO) {
        arcGrantVO.setZhxgr(ContextUtil.getLoginUser().getUserId());
        arcGrantVO.setZhxgsj(new Date());
        this.commonPermissionDao.updateMenuOrUrlRolePer(arcGrantVO);
    }

    @Override
    public void addCommonPer(PFArcGrantVO arcGrantVO) {
        arcGrantVO.setCjr(ContextUtil.getLoginUser().getUserId());
        arcGrantVO.setCjsj(new Date());
        this.commonPermissionDao.addCommonPer(arcGrantVO);
    }

    @Override
    public void delMenuPer(PFArcGrantVO arcGrantVO) {
        arcGrantVO.setZhxgr(ContextUtil.getLoginUser().getUserId());
        arcGrantVO.setZhxgsj(new Date());
        this.commonPermissionDao.delMenuPer(arcGrantVO);
    }

}
