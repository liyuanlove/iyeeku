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


}
