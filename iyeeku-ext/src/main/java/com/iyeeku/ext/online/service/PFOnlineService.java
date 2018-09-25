package com.iyeeku.ext.online.service;

import com.iyeeku.ext.online.vo.PFOnlineVO;

import java.util.List;

public interface PFOnlineService {

    public abstract List<PFOnlineVO> getOnlineUsersByYhbh(String yhbh);

    public abstract PFOnlineVO getOnlineVOBySessionId(String sessionId);

    public abstract void saveOnline(PFOnlineVO onlineVO);

    public abstract void deleteOnlineBySessionId(String sessionId);

}
