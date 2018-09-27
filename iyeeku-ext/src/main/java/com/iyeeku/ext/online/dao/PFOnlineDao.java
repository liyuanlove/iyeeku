package com.iyeeku.ext.online.dao;

import com.iyeeku.ext.online.vo.PFOnlineVO;

import java.util.List;

public interface PFOnlineDao {

    public abstract void insertOnline(PFOnlineVO onlineVO);

    public abstract void deleteOnlineBySessionId(String sessionId);

    public abstract PFOnlineVO getOnlineVOBySessionId(String sessionId);

    public abstract List<PFOnlineVO> getOnlineUsersByYhbh(String yhbh);

}
