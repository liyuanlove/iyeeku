package com.iyeeku.ext.function.dao;

import com.iyeeku.ext.function.vo.PFResMenuVO;

import java.util.List;
import java.util.Map;

public interface PFResMenuDao {

    public abstract List<PFResMenuVO> findAllMenu();

    public abstract List<PFResMenuVO> findAll(String sjcdbh);

    public abstract PFResMenuVO findMenuByCdbh(String cdbh);

    public abstract List<PFResMenuVO> findGrantedMenu(Map map);

    public abstract void insert(PFResMenuVO menuVO);

    public abstract void update(PFResMenuVO menuVO);
}
