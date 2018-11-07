package com.iyeeku.monitor.listener;

import java.util.EventListener;

public interface MachineStatusListener extends EventListener {

    public void machineStatusEvent(MachineStatusEvent mse);

}
