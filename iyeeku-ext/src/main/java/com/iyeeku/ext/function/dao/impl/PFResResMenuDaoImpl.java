package com.iyeeku.ext.function.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.ext.function.dao.PFResMenuDao;
import com.iyeeku.ext.function.vo.PFResMenuVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PFResResMenuDaoImpl extends BaseDaoImpl implements PFResMenuDao {

    @Override
    public List<PFResMenuVO> findAllMenu() {
        return this.queryAll_myBatis("com.iyeeku.ext.function.dao.PFResMenuDao.findAllMenu",null);
    }

    @Override
    public List<PFResMenuVO> findAll(String sjcdbh) {
        return this.queryAll_myBatis("com.iyeeku.ext.function.dao.PFResMenuDao.findAll",sjcdbh);
    }
}
