package com.iyeeku.ext.online.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.ext.online.dao.PFOnlineDao;
import com.iyeeku.ext.online.vo.PFOnlineVO;
import org.springframework.stereotype.Repository;

@Repository
public class PFOnlineDaoImpl extends BaseDaoImpl implements PFOnlineDao {

    @Override
    public void insertOnline(PFOnlineVO onlineVO) {
        this.save_myBatis("com.iyeeku.ext.online.dao.PFOnlineDao.insertOnline" , onlineVO);
    }
}
