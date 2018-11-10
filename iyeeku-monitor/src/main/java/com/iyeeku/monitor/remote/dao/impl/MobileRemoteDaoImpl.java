package com.iyeeku.monitor.remote.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.monitor.remote.dao.IMobileRemoteDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Repository
public class MobileRemoteDaoImpl extends BaseDaoImpl implements IMobileRemoteDao {

    private Logger logger = LoggerFactory.getLogger(MobileRemoteDaoImpl.class);

    @Override
    public List<Map<String, Object>> findMonitoredMachineListByDeviceId(String deviceId) {
        this.logger.info("MobileRemoteDaoImpl findMonitoredMachineListByDeviceId");
        return this.queryAll_myBatis("com.iyeeku.monitor.remote.dao.IMobileRemoteDao.findMonitoredMachineListByDeviceId",deviceId);
    }

    @Override
    public Map<String, Object> findMonitoredMachineInfoByMap(Map<String,String> map){
        this.logger.info("MobileRemoteDaoImpl findMonitoredMachineInfoByMap");
        return this.queryOne_myBatis("com.iyeeku.monitor.remote.dao.IMobileRemoteDao.findMonitoredMachineInfoByMap",(Serializable) map);
    }

    @Override
    public void updateMachineStatus(Map<String, String> map) {
        this.logger.info("MobileRemoteDaoImpl updateMachineStatus");
        this.update_myBatis("com.iyeeku.monitor.remote.dao.IMobileRemoteDao.updateMachineStatus",(Serializable) map);
    }
}
