package com.iyeeku.ext.function.service.impl;

import com.iyeeku.core.context.ContextUtil;
import com.iyeeku.core.util.UUIDGenerator;
import com.iyeeku.ext.common.util.IyeekuExtConstants;
import com.iyeeku.ext.function.dao.PFResMenuDao;
import com.iyeeku.ext.function.service.PFResMenuService;
import com.iyeeku.ext.function.vo.PFResMenuVO;
import com.iyeeku.ext.function.vo.PFResRelationVO;
import com.iyeeku.ext.grant.dao.PFArcGrantDao;
import com.iyeeku.ext.grant.vo.PFArcGrantVO;
import org.springframework.cache.annotation.Cacheable;

import java.util.*;

public class PFResResMenuServiceImpl implements PFResMenuService {

    private PFResMenuDao pfResMenuDao;
    private PFArcGrantDao pfArcGrantDao;

    @Override
    public List<PFResMenuVO> findAllMenu() {
        return this.pfResMenuDao.findAllMenu();
    }

    @Override
    public List<PFResMenuVO> findAll(String sjcdbh) {
        return this.pfResMenuDao.findAll(sjcdbh);
    }

    @Override
    public PFResMenuVO findMenuByCdbh(String cdbh) {
        return this.pfResMenuDao.findMenuByCdbh(cdbh);
    }

    @Override
    public void saveOrUpdate(PFResMenuVO menuVO) {
        if (menuVO.getCdurl() == null || "".equals(menuVO.getCdbh())){
            menuVO.setCdbh(UUIDGenerator.generate(""));
            this.pfResMenuDao.insert(menuVO);
        }else{
            this.pfResMenuDao.update(menuVO);
        }
    }

    @Override
    public void deleteMenu(String cdbh) {
        PFResMenuVO menuVO = new PFResMenuVO();
        menuVO.setCdbh(cdbh);
        this.pfResMenuDao.delete(menuVO);

        PFResRelationVO relationVO = new PFResRelationVO();
        relationVO.setZdxbm(cdbh);
        relationVO.setZdxlx("CD");
        this.pfResMenuDao.delMenuRelationUrl(relationVO);

    }

    @Override
    public void addMenuRelationUrl(String cdbh, String[] cdxbms) {
        PFResRelationVO relationVO = new PFResRelationVO();
        relationVO.setZdxbm(cdbh);
        relationVO.setZdxlx("CD");
        this.pfResMenuDao.delMenuRelationUrl(relationVO);
        for (String cdxbm : cdxbms){
            relationVO.setCdxbm(cdxbm);
            relationVO.setCdyzygxzj(UUIDGenerator.generate(""));
            relationVO.setCdxlx("LJ");

            this.pfResMenuDao.addMenuRelationUrl(relationVO);
            addMenuArcGrantUrl(cdbh , cdxbm);
        }
    }

    private void addMenuArcGrantUrl(String cdbh , String cdxbm){
        PFArcGrantVO dxbhVo = new PFArcGrantVO();
        dxbhVo.setSqdxbh(cdbh);
        dxbhVo.setJlzt("1");

        PFArcGrantVO zybmVo = new PFArcGrantVO();
        zybmVo.setSqzybm(cdxbm);

        List<PFArcGrantVO> dxbhVoList = this.pfArcGrantDao.findGrantByZdxbm(dxbhVo);
        List<PFArcGrantVO> zybmVoList = this.pfArcGrantDao.findGrantByZdxbm(zybmVo);

        for (PFArcGrantVO dxvo : dxbhVoList){
            boolean isArcGant = false;

            for (PFArcGrantVO zyvo : zybmVoList){
                if (dxvo.getSqdxbh().equals(zyvo.getSqdxbh())){
                    if (zyvo.getJlzt().equals("0")){
                        zyvo.setZhxgr(ContextUtil.getLoginUser().getUserId());
                        zyvo.setZhxgsj(new Date());
                        this.pfArcGrantDao.updateGrant(zyvo);
                    }
                    isArcGant = true;
                }
            }

            if (!isArcGant){
                dxvo.setSqbzj(UUIDGenerator.generate(""));
                dxvo.setSqzybm(cdxbm);
                dxvo.setSqzylx("LJ");
                dxvo.setCjr(ContextUtil.getLoginUser().getUserId());
                dxvo.setCjsj(new Date());
                this.pfArcGrantDao.saveGrant(dxvo);
            }
        }

    }


    @Override
    public List<PFResMenuVO> findGrantedMenu(Map<String, Object> map) {

        Map oursMap = new HashMap();
        List<String> roles = new ArrayList<>();
        roles.add(IyeekuExtConstants.ROLE_ANONYMOUS_CODE);
        oursMap.put("list" , roles);
        List<PFResMenuVO> roleMenus = this.pfResMenuDao.findGrantedMenu(map);
        List<PFResMenuVO> oursMenus = this.pfResMenuDao.findGrantedMenu(oursMap);

        List<PFResMenuVO> menuLists = new ArrayList<>();
        menuLists.addAll(roleMenus);
        oursMenus.removeAll(roleMenus);
        menuLists.addAll(oursMenus);

        return menuLists;
    }

    @Cacheable(value = "appBaseCache" , key = "#p0")
    public List<Map<String, Object>> getNavMenuDataFromCache(String key) {
        List<PFResMenuVO> list = this.pfResMenuDao.findAll("DEFAULT_MENUTREE_ROOT");
        return walkMenuTreeData(list);
    }

    private List<Map<String,Object>> walkMenuTreeData(List<PFResMenuVO> list){
        List<Map<String,Object>> rtnList = new ArrayList<>();
        Map<String ,Object> rtnMap = null;
        for (PFResMenuVO resMenuVO : list){
            rtnMap = new HashMap<>();
            if(resMenuVO.getChildren() == null || resMenuVO.getChildren().size() == 0){
                rtnMap.put("id",resMenuVO.getCdbh());
                rtnMap.put("iconCls",resMenuVO.getCdtp());
                rtnMap.put("text" , resMenuVO.getCdmc());
                rtnMap.put("url", resMenuVO.getCdurl());
                rtnList.add(rtnMap);
            }else{
                rtnMap.put("id",resMenuVO.getCdbh());
                rtnMap.put("iconCls",resMenuVO.getCdtp());
                rtnMap.put("text" , resMenuVO.getCdmc());
                rtnMap.put("children",walkMenuTreeData(resMenuVO.getChildren()));
                rtnList.add(rtnMap);
            }
        }
        return rtnList;
    }


    public void setPfResMenuDao(PFResMenuDao pfResMenuDao) {
        this.pfResMenuDao = pfResMenuDao;
    }

    public void setPfArcGrantDao(PFArcGrantDao pfArcGrantDao) {
        this.pfArcGrantDao = pfArcGrantDao;
    }

}
