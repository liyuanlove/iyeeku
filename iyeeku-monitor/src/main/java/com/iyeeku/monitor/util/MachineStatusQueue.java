package com.iyeeku.monitor.util;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

public class MachineStatusQueue {

    public static BlockingQueue<String> queue = new LinkedBlockingQueue<>(10);


}
