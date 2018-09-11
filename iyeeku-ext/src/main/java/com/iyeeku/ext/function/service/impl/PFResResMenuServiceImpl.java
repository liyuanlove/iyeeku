package com.iyeeku.ext.function.service.impl;

import com.iyeeku.core.utils.UUIDGenerator;
import com.iyeeku.ext.function.dao.PFResMenuDao;
import com.iyeeku.ext.function.service.PFResMenuService;
import com.iyeeku.ext.function.vo.PFResMenuVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PFResResMenuServiceImpl implements PFResMenuService {

    @Autowired
    private PFResMenuDao pfResMenuDao;

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

    @Cacheable(value = "appBaseCache" , key = "#p0")
    public List<Map<String, Object>> getNavMenuDataFromCache(String key) {
        return null;
    }

}
