package com.iyeeku.remote.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.remote.dao.IMobileRemoteDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class MobileRemoteDaoImpl extends BaseDaoImpl implements IMobileRemoteDao {

    private Logger logger = LoggerFactory.getLogger(MobileRemoteDaoImpl.class);

    @Override
    public List<Map<String, Object>> findMonitoredMachineListByDeviceId(String deviceId) {
        this.logger.info("MobileRemoteDaoImpl findMonitoredMachineListByDeviceId");
        return this.queryAll_myBatis("com.iyeeku.remote.dao.IMobileRemoteDao.findMonitoredMachineListByDeviceId",deviceId);
    }

    @Override
    public Map<String, Object> findMonitoredMachineInfoByZj(String key) {
        this.logger.info("MobileRemoteDaoImpl findMonitoredMachineInfoByZj");
        return this.queryOne_myBatis("com.iyeeku.remote.dao.IMobileRemoteDao.findMonitoredMachineInfoByZj",key);
    }
}
