package com.iyeeku.ext.function.dao;

import com.iyeeku.ext.function.vo.PFResMenuVO;

import java.util.List;

public interface PFResMenuDao {

    public abstract List<PFResMenuVO> findAllMenu();

    public abstract List<PFResMenuVO> findAll(String sjcdbh);

    public abstract PFResMenuVO findMenuByCdbh(String cdbh);

    public abstract void insert(PFResMenuVO menuVO);

    public abstract void update(PFResMenuVO menuVO);
}
