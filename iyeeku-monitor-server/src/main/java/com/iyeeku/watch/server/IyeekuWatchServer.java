package com.iyeeku.watch.server;

import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class IyeekuWatchServer {

    private static int port = 6060;

    private static int corePoolSize = 1024;
    private static int maximunPoolSize = 4096;
    private static int QueueSize = 50;
    private static long keepAliveTime = 5;
    private static int iTimeOutSeconds = 60 * 10;

    private static ServerSocket server = null;

    public static void run() throws Exception{

        final ThreadGroup threadGroup = new ThreadGroup(Thread.currentThread().getThreadGroup(),"Transaction");
        ThreadPoolExecutor executor = new ThreadPoolExecutor(corePoolSize , maximunPoolSize , keepAliveTime ,
                TimeUnit.SECONDS , new ArrayBlockingQueue<Runnable>(QueueSize) , new ThreadPoolExecutor.AbortPolicy());

        ThreadFactory factory = new ThreadFactory() {
            @Override
            public Thread newThread(Runnable r) {
                return new Thread(threadGroup , r , r.getClass().getSimpleName());
            }
        };

        executor.setThreadFactory(factory);

        server = new ServerSocket(port);
        Socket socket;

        int i = 1;

        while (true){

            try {
                socket = server.accept();
                socket.setSoTimeout(1000*iTimeOutSeconds);
                IyeekuWatchThread trans = new IyeekuWatchThread(socket ,i++);
                executor.execute(trans);
            }catch (Exception ex){
                ex.printStackTrace();
                System.out.println("出现异常，整个服务器停止!");
                try {
                    server.close();
                }catch (Exception e){
                    System.out.println("服务关闭出现异常!");
                }
                break;
            }

        }

    }

}
