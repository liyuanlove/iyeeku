package com.iyeeku.ext.function.service;

import com.iyeeku.ext.function.vo.PFResMenuVO;

import java.util.List;
import java.util.Map;

public interface PFResMenuService {

    public abstract List<PFResMenuVO> findAllMenu();

    public abstract List<PFResMenuVO> findAll(String sjcdbh);

    public abstract PFResMenuVO findMenuByCdbh(String cdbh);

    public abstract void saveOrUpdate(PFResMenuVO menuVO);

    public abstract List<Map<String,Object>> getNavMenuDataFromCache(String key);

    public abstract List<PFResMenuVO> findGrantedMenu(Map<String,Object> map);

}
