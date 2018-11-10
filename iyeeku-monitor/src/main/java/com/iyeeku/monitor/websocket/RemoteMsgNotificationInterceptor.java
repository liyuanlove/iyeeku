package com.iyeeku.monitor.websocket;

import com.iyeeku.core.websocket.IyeekuHandshakeInterceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public class RemoteMsgNotificationInterceptor implements IyeekuHandshakeInterceptor {

    private static final Logger logger = LoggerFactory.getLogger(RemoteMsgNotificationInterceptor.class);
    
    /**
     *初次握手前
     */
    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
        logger.info("初次握手成功...");
        if (request instanceof ServletServerHttpRequest){
            HttpServletRequest servletRequest = ((ServletServerHttpRequest)request).getServletRequest();
            String sessionId = servletRequest.getSession().getId(); //获取游览器的session
            String username = (String) servletRequest.getSession().getAttribute("name");
            logger.info("获取session里面的name：{} ==>> " + username);
            if (username == null){
                username = "WEBSOCKET_USERNAME_IS_NULL";
            }
            attributes.put("WEBSOCKET_USERNAME" , username);
            servletRequest.getSession().setAttribute("WEBSOCKET_USERNAME" , username);
        }
        return true;
    }

    @Override
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception exception) {

    }
}
