package com.iyeeku.remote.service;

import java.util.List;
import java.util.Map;

public interface IMobileRemoteService {

    public abstract List<Map<String,Object>> findMonitoredMachineListByDeviceId(String deviceId);

    public abstract Map<String,Object> findMonitoredMachineInfoByZj(String key);

}
