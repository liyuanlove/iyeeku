package com.iyeeku.monitor.websocket;

import com.iyeeku.core.websocket.IyeekuWebSocketHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import java.util.ArrayList;

public class RemoteMsgNotificationHandler implements IyeekuWebSocketHandler {

    private static final Logger logger = LoggerFactory.getLogger(RemoteMsgNotificationHandler.class);

    private static final ArrayList<WebSocketSession> webSocketSessions = new ArrayList<>();

    /**
     * 初次链接成功执行 js调用 send 方法时触发
     * @param session
     * @throws Exception
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        logger.info("链接成功...");
    }

    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        String recvMsg = (String) message.getPayload();
        logger.info("收到的消息==>> " + recvMsg );

        //JSONPObject jsonObject =

        session.sendMessage(new TextMessage("服务器返回的数据..."));


    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        if (session.isOpen()){
            session.close();
        }
        logger.debug("WebSocket链接关闭...");
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        logger.debug("WebSocket链接关闭... (关闭后做什么事情...)");
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }

}
