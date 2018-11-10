package com.iyeeku.monitor.listener;

import com.iyeeku.monitor.util.MachineStatusQueue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

public class MachineStatusQueneMsgListener implements MessageListener {

    private static final Logger logger = LoggerFactory.getLogger(MachineStatusQueneMsgListener.class);

    @Override
    public void onMessage(Message message) {
        TextMessage text = (TextMessage) message;
        try {
            System.out.println("监听到了状态变化,从MQ服务器上拿到的值: " + text.getText());
            try {
                MachineStatusQueue.queue.put(text.getText());
            }catch (InterruptedException e){
                e.printStackTrace();
            }
        }catch (JMSException ex){
            logger.error("监听机器状态改变出现错误..." ,ex.getMessage());
        }
    }

}
