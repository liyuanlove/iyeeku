package com.iyeeku.monitor.websocket;

import com.iyeeku.core.websocket.IyeekuWebSocketHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import java.util.Vector;

public class RemoteMsgNotificationHandler implements IyeekuWebSocketHandler {

    private static final Logger logger = LoggerFactory.getLogger(RemoteMsgNotificationHandler.class);
    //private INotificationMsgService iNotificationMsgService;

    // ArrayList 线程不安全
    //private static final ArrayList<WebSocketSession> webSocketSessions = new ArrayList<>();

    /**
     * ConcurrentHashMap支持高并发、高吞吐量的线程安全HashMap实现，其实现原理是锁分离机制，
     * 将数据分Segment管理。每个Segment拥有独立的锁。
     */
    //private static final Map<String,WebSocketSession> sessionMap = new ConcurrentHashMap<>();

    //private static final NotificationThread thread = new NotificationThread(webSocketSessions);


    private static final Vector<WebSocketSession> sessions = new Vector<>();

    private static final NotificationThread thread = new NotificationThread(sessions);

    static {

        thread.start();

    }

    /**
     * 初次链接成功执行 js调用 send 方法时触发
     * @param session
     * @throws Exception
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        logger.debug("\n链接成功... , 将连接存储集合中...\n");
        sessions.add(session);
        logger.debug("建立连接后：WebSocketSession个数 ：" + sessions.size());
        //初次连接成功后，开启一个通知线程，阻塞监听队列中是否有值变化，如果有，则进行消息推送
        //NotificationThread thread = new NotificationThread(session);
        //thread.start();
    }

    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        String recvMsg = (String) message.getPayload();
        logger.info("收到的消息==>> " + recvMsg );
        session.sendMessage(new TextMessage("handleMessage！！！！"));
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        logger.debug("\n出现异常，WebSocket链接关闭...");
        logger.debug("异常处理前：WebSocketSession个数 ：" + sessions.size());
        if (session.isOpen()){
            session.close();
        }
        sessions.remove(session);
        logger.debug("出现异常：WebSocketSession个数 ：" + sessions.size());
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        logger.debug("\nWebSocket链接关闭... (关闭后做什么事情...) 例如关闭Session\n");
        if (session.isOpen()){
            session.close();
        }
        sessions.remove(session);
        logger.debug("关闭链接后：WebSocketSession个数 ：" + sessions.size());
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }

}
