package com.iyeeku.monitor.remote.dao;

import java.util.List;
import java.util.Map;

public interface IMobileRemoteDao {

    public abstract List<Map<String, Object>> findMonitoredMachineListByDeviceId(String deviceId);

    public abstract Map<String, Object> findMonitoredMachineInfoByMap(Map<String,String> map);

    public abstract void updateMachineStatus(Map<String,String> map);

}
