package com.iyeeku.monitor.remote.service.impl;

import com.iyeeku.monitor.remote.dao.IMobileRemoteDao;
import com.iyeeku.monitor.remote.service.IMobileRemoteService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MobileRemoteServiceImpl implements IMobileRemoteService {

    private Logger logger = LoggerFactory.getLogger(MobileRemoteServiceImpl.class);

    @Autowired
    private IMobileRemoteDao iMobileRemoteDao;

    @Override
    public List<Map<String, Object>> findMonitoredMachineListByDeviceId(String deviceId) {
        return this.iMobileRemoteDao.findMonitoredMachineListByDeviceId(deviceId);
    }

    @Override
    public Map<String, Object> findMonitoredMachineInfoByZj(String zj,String deviceId) {
        Map<String,String> param = new HashMap<>();
        param.put("zj" , zj);
        param.put("sbbh" , deviceId);
        return this.iMobileRemoteDao.findMonitoredMachineInfoByMap(param);
    }

    @Override
    public void updateMachineStatus(String zj, String zt) {
        Map<String,String> param = new HashMap<>();
        param.put("zj" , zj);
        param.put("zt",zt);
        this.iMobileRemoteDao.updateMachineStatus(param);
    }

}
