package com.iyeeku.ext.function.service;

import com.iyeeku.ext.function.vo.PFResMenuVO;

import java.util.List;

public interface PFResMenuService {

    public abstract List<PFResMenuVO> findAllMenu();

    public abstract List<PFResMenuVO> findAll(String sjcdbh);

    public abstract PFResMenuVO findMenuByCdbh(String cdbh);

}
