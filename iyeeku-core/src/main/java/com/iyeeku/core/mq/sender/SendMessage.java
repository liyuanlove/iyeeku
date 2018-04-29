package com.iyeeku.core.mq.sender;

import com.iyeeku.core.mq.vo.MessageInfoObject;

import java.util.List;
import java.util.Map;


public abstract interface SendMessage {

    public static final String BEAN_ID = "sendMessage";

    public abstract void sendObjectMessage(MessageInfoObject objMessage);

    public abstract void sendObjectMessage(String destination , MessageInfoObject objMessage);

    public abstract void sendListObjectMessage(List<MessageInfoObject> list);

    public abstract void sendListObjectMessage(String destination , List<MessageInfoObject> list);

    public abstract void sendTextMessage(String textMessage);

    public abstract void sendTextMessage(String destination , String textMessage);

    public abstract void sendListTextMessage(List<String> paramList);

    public abstract void sendListTextMessage(String destination , List<String> list);

    public abstract void sendMapMessage(Map<String , String> paramMap);

    public abstract void sendMapMessage(String destination , Map<String , String> paramMap);

    public abstract void sendListMapMessage(List<Map<String , String>> paramList);

    public abstract void sendListMapMessage(String destination , List<Map<String , String>> paramList);


}
