package com.iyeeku.monitor.websocket;

import com.iyeeku.monitor.util.MachineStatusQueue;
import com.iyeeku.monitor.util.NotificationMsgUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import java.util.Iterator;
import java.util.Vector;

public class NotificationThread extends Thread {

    private static Logger logger = LoggerFactory.getLogger(NotificationThread.class);

    //private WebSocketSession session;

    private Vector<WebSocketSession> sessions;
    //private INotificationMsgService iNotificationMsgService;


    //private ArrayList<WebSocketSession> sessions;

/*    public NotificationThread(WebSocketSession session){
        this.session = session;
    }*/

/*    public NotificationThread(ArrayList<WebSocketSession> sessions){
        this.sessions = sessions;
    }*/

    public NotificationThread(Vector<WebSocketSession> sessions){
        this.sessions = sessions;
        //this.iNotificationMsgService = iNotificationMsgService;
    }

    @Override
    public void run() {
        logger.info("==========================================================");
        logger.info("=============开启NotificationThread 通知线程===============");
        try {
/*            while (true){
                String status = MachineStatusQueue.queue.take();
                if ("1".equals(status)) {
                    status = "在线";
                } else {
                    status = "不在线";
                }
                if (session != null && session.isOpen()){
                    session.sendMessage(new TextMessage("机器状态为: ==>> " + status));
                }else{
                    logger.error("\n=================NotificationThread session问题========================");
                    logger.error("\nNotificationThread线程结束");
                    break;
                }
            }*/

            while (true){
                String status = MachineStatusQueue.queue.take();

                logger.debug("\n开始通知时 : WebSocketSession个数 ：" + sessions.size());

                if (sessions != null){
                    Iterator<WebSocketSession> it = sessions.iterator();
                    while (it.hasNext()){
                        WebSocketSession currentSession = it.next();

                        if (currentSession != null && currentSession.isOpen()){

                            String text = NotificationMsgUtil.getNotiMsgToRemoteClient(status);
                            // 给当前session发送信息
                            currentSession.sendMessage(new TextMessage(text));

                        }else {
                            logger.error("\n当前WebSocketSession会话已经失效!!\n");
                            sessions.remove(currentSession); //移除这个session
                            continue;
                        }
                    }
                }

                logger.debug("\n通知结束时 : WebSocketSession个数 ：" + sessions.size());

            }

        }catch (Exception ex){
            System.out.println("发送通知失败!!!");
            ex.printStackTrace();
        }
    }
}
