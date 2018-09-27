package com.iyeeku.ext.online.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.ext.online.dao.PFOnlineDao;
import com.iyeeku.ext.online.vo.PFOnlineVO;

import java.util.List;

public class PFOnlineDaoImpl extends BaseDaoImpl implements PFOnlineDao {

    @Override
    public void insertOnline(PFOnlineVO onlineVO) {
        this.save_myBatis("com.iyeeku.ext.online.dao.PFOnlineDao.insertOnline" , onlineVO);
    }

    @Override
    public List<PFOnlineVO> getOnlineUsersByYhbh(String yhbh) {
        return this.queryAll_myBatis("com.iyeeku.ext.online.dao.PFOnlineDao.getOnlineUsersByYhbh" , yhbh);
    }

    @Override
    public void deleteOnlineBySessionId(String sessionId) {
        this.delete_myBatis("com.iyeeku.ext.online.dao.PFOnlineDao.deleteOnlineBySessionId" , sessionId);
    }

    @Override
    public PFOnlineVO getOnlineVOBySessionId(String sessionId) {
        return this.queryOne_myBatis("com.iyeeku.ext.online.dao.PFOnlineDao.getOnlineVOBySessionId" , sessionId);
    }
}
