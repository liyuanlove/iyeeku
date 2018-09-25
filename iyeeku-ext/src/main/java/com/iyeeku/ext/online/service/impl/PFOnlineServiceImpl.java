package com.iyeeku.ext.online.service.impl;

import com.iyeeku.core.util.UUIDGenerator;
import com.iyeeku.ext.online.dao.PFOnlineDao;
import com.iyeeku.ext.online.service.PFOnlineService;
import com.iyeeku.ext.online.vo.PFOnlineVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PFOnlineServiceImpl implements PFOnlineService {

    @Autowired
    private PFOnlineDao pfOnlineDao;

    @Override
    public List<PFOnlineVO> getOnlineUsersByYhbh(String yhbh) {
        return null;
    }

    @Override
    public PFOnlineVO getOnlineVOBySessionId(String sessionId) {
        return null;
    }

    @Override
    public void saveOnline(PFOnlineVO onlineVO) {
        onlineVO.setYhjlzj(UUIDGenerator.generate(""));
        this.pfOnlineDao.insertOnline(onlineVO);
    }

    @Override
    public void deleteOnlineBySessionId(String sessionId) {

    }
}
