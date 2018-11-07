package com.iyeeku.monitor.remote.dao;

import java.util.List;
import java.util.Map;

public interface IMobileRemoteDao {

    public abstract List<Map<String, Object>> findMonitoredMachineListByDeviceId(String deviceId);

    public Map<String, Object> findMonitoredMachineInfoByZj(String key);

}
