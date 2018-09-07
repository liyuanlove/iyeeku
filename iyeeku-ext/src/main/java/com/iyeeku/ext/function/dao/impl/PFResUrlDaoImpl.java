package com.iyeeku.ext.function.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.ext.function.dao.PFResUrlDao;
import com.iyeeku.ext.function.vo.PFResUrlVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PFResUrlDaoImpl extends BaseDaoImpl implements PFResUrlDao {

    @Override
    public List<PFResUrlVO> findAllUrls() {
        return this.queryAll_myBatis("com.iyeeku.ext.function.dao.PFResUrlDao.findAllUrls");
    }

    @Override
    public void addUrl(PFResUrlVO resUrlVO) {
        this.save_myBatis("com.iyeeku.ext.function.dao.PFResUrlDao.addUrl" , resUrlVO);
    }

    @Override
    public void updateUrlByLj(PFResUrlVO resUrlVO) {
        this.update_myBatis("com.iyeeku.ext.function.dao.PFResUrlDao.updateUrlByLj" , resUrlVO);
    }

    @Override
    public void deleteUrlByLj(PFResUrlVO resUrlVO) {
        this.delete_myBatis("com.iyeeku.ext.function.dao.PFResUrlDao.deleteUrlByLj" , resUrlVO);
    }

}
