package com.iyeeku.core.mq.util;

import com.iyeeku.core.mq.vo.MessageInfoObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jms.core.MessageCreator;

import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.Session;
import java.util.Map;
import java.util.Set;

public class MessageInfoCreator implements MessageCreator {

    protected Logger logger = LoggerFactory.getLogger(MessageInfoCreator.class);
    MessageInfoObject messageInfoObject;
    public String textMessage;
    public Map<String,String> map = null;

    public MessageInfoCreator(Object message){
        this.messageInfoObject = ((MessageInfoObject) message);
    }

    public MessageInfoCreator(String textMessage){
        this.textMessage = textMessage;
    }

    public MessageInfoCreator(Map<String,String> map){
        this.map = map;
    }

    public Message createMessage(Session session) throws JMSException {
        this.logger.debug("创建消息...");
        if(this.messageInfoObject != null){
            Message message = session.createObjectMessage(this.messageInfoObject);
            this.logger.debug("对象消息创建成功");
            return message;
        }if(this.textMessage != null){
            Message message = session.createTextMessage(this.textMessage);
            this.logger.debug("文本消息创建成功");
            return message;
        }
        MapMessage message = session.createMapMessage();
        Set set = this.map.keySet();
        Object[] strArray = set.toArray();
        for(int i=0; i<strArray.length ; i++){
            String key = (String)strArray[i];
            message.setString(key, (String)this.map.get(key));
        }
        this.logger.debug("Map类型消息创建成功");
        return message;
    }

    public Map<String, String> getMap() {
        return map;
    }

    public void setMap(Map<String, String> map) {
        this.map = map;
    }

}
