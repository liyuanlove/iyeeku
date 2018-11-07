package com.iyeeku.monitor.listener;

import java.util.Enumeration;
import java.util.Vector;

public class MachineStatusService {

    private Vector repository = new Vector();
    private MachineStatusListener msl;

    public MachineStatusService(){

    }

    //注册监听器，如果这里没有使用Vector而是使用ArrayList那么要注意同步问题
    public void addMachineStatusListener(MachineStatusListener msl){
        repository.addElement(msl); //这步要注意同步问题
    }

    public void notifyLocationEvent(MachineStatusEvent event){
        Enumeration e = repository.elements(); //这步要注意同步问题
        while (e.hasMoreElements()){
            msl = (MachineStatusListener)e.nextElement();
            msl.machineStatusEvent(event);
        }
    }

    public void removeLocationListener(MachineStatusListener msl){
        repository.remove(msl);
    }


    public void testApi(){
        System.out.println("==>> testApi");
        notifyLocationEvent(new MachineStatusEvent(this));
    }




}
