package com.iyeeku.core.mq.sender;

import com.iyeeku.core.mq.util.MessageInfoCreator;
import com.iyeeku.core.mq.vo.MessageInfoObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jms.core.JmsTemplate;

import javax.jms.Destination;
import java.util.List;
import java.util.Map;

public class SendMessageImpl implements SendMessage {

    private static final Logger logger = LoggerFactory.getLogger(SendMessageImpl.class);
    private JmsTemplate jmsTemplate;
    private Destination destination;

    @Override
    public void sendObjectMessage(MessageInfoObject objMessage) {

    }

    @Override
    public void sendObjectMessage(String destination, MessageInfoObject objMessage) {

    }

    @Override
    public void sendListObjectMessage(List<MessageInfoObject> list) {

    }

    @Override
    public void sendListObjectMessage(String destination, List<MessageInfoObject> list) {

    }

    @Override
    public void sendTextMessage(String textMessage) {
        if (textMessage != null){
            logger.debug("正在发送TextMessage类型消息,消息内容: " + textMessage);
            this.jmsTemplate.send(this.destination , new MessageInfoCreator(textMessage));
            logger.debug("消息:'" + textMessage + "'发送成功");
        }else {
            logger.info("textMessage为NULL");
        }
    }

    @Override
    public void sendTextMessage(String destination, String textMessage) {
        if (textMessage != null){
            logger.debug("正在发送TextMessage类型消息,消息内容: " + textMessage);
            this.jmsTemplate.send(destination , new MessageInfoCreator(textMessage));
            logger.debug("消息:'" + textMessage + "'发送成功");
        }else {
            logger.info("textMessage为NULL");
        }
    }

    @Override
    public void sendListTextMessage(List<String> paramList) {

    }

    @Override
    public void sendListTextMessage(String destination, List<String> list) {

    }

    @Override
    public void sendMapMessage(Map<String, String> paramMap) {

    }

    @Override
    public void sendMapMessage(String destination, Map<String, String> paramMap) {

    }

    @Override
    public void sendListMapMessage(List<Map<String, String>> paramList) {

    }

    @Override
    public void sendListMapMessage(String destination, List<Map<String, String>> paramList) {

    }

    public JmsTemplate getJmsTemplate() {
        return jmsTemplate;
    }

    public void setJmsTemplate(JmsTemplate jmsTemplate) {
        this.jmsTemplate = jmsTemplate;
    }

    public Destination getDestination() {
        return destination;
    }

    public void setDestination(Destination destination) {
        this.destination = destination;
    }
}
