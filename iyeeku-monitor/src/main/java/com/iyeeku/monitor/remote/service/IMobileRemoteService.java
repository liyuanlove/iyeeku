package com.iyeeku.monitor.remote.service;

import java.util.List;
import java.util.Map;

public interface IMobileRemoteService {

    public abstract List<Map<String,Object>> findMonitoredMachineListByDeviceId(String deviceId);

    public abstract Map<String,Object> findMonitoredMachineInfoByZj(String zj,String deviceId);

    public abstract void updateMachineStatus(String zj,String zt);

}
