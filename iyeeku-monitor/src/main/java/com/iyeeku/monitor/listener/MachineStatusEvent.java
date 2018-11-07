package com.iyeeku.monitor.listener;

import java.util.EventObject;

public class MachineStatusEvent extends EventObject {

    private Object object;

    public MachineStatusEvent(Object source) {
        super(source);
        object = source;
    }

    @Override
    public Object getSource() {
        return object;
    }

}
