package com.iyeeku.monitor.listener;

public class TestMain implements MachineStatusListener {

    MachineStatusService mss;

    public TestMain(){
        mss = new MachineStatusService();
        mss.addMachineStatusListener(this);
        System.out.println("添加监听器完毕!!");

        //mss.testApi();
    }

    @Override
    public void machineStatusEvent(MachineStatusEvent mse) {
        System.out.println("做什么事情!!");
/*        ScheduledExecutorService executor = Executors.newSingleThreadScheduledExecutor();
        executor.scheduleWithFixedDelay(new Runnable() {
            @Override
            public void run() {
                System.out.println("====");
            }
        },1000,3000, TimeUnit.MILLISECONDS);*/
    }

    public MachineStatusService getMachineStatusService(){
        return mss;
    }

    public static void main(String[] args) throws InterruptedException {
        TestMain aa = new TestMain();

        aa.machineStatusEvent(null);

        Thread.sleep(3000);

        MachineStatusService bb = aa.getMachineStatusService();
        System.out.println(bb);

        bb.testApi();

    }

}
