package com.iyeeku.ext.online.service.impl;

import com.iyeeku.core.util.UUIDGenerator;
import com.iyeeku.ext.online.dao.PFOnlineDao;
import com.iyeeku.ext.online.service.PFOnlineService;
import com.iyeeku.ext.online.vo.PFOnlineVO;

import java.util.List;

public class PFOnlineServiceImpl implements PFOnlineService {

    private PFOnlineDao pfOnlineDao;

    @Override
    public List<PFOnlineVO> getOnlineUsersByYhbh(String yhbh) {
        return this.pfOnlineDao.getOnlineUsersByYhbh(yhbh);
    }

    @Override
    public PFOnlineVO getOnlineVOBySessionId(String sessionId) {
        return this.pfOnlineDao.getOnlineVOBySessionId(sessionId);
    }

    @Override
    public void saveOnline(PFOnlineVO onlineVO) {
        onlineVO.setYhjlzj(UUIDGenerator.generate(""));
        this.pfOnlineDao.insertOnline(onlineVO);
    }

    @Override
    public void deleteOnlineBySessionId(String sessionId) {
        this.pfOnlineDao.deleteOnlineBySessionId(sessionId);
    }


    public PFOnlineDao getPfOnlineDao() {
        return pfOnlineDao;
    }

    public void setPfOnlineDao(PFOnlineDao pfOnlineDao) {
        this.pfOnlineDao = pfOnlineDao;
    }
}
