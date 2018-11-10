package com.iyeeku.monitor.util;

import com.iyeeku.core.util.JsonUtil;
import com.iyeeku.monitor.remote.service.NotificationMsgService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class NotificationMsgUtil {

    private static Logger logger = LoggerFactory.getLogger(NotificationMsgUtil.class);
    private static NotificationMsgService notificationMsgService;

    /**
     * spring 静态属性注入 ， 注意 setter 方法上的 static 不能加
     * @param notificationMsgService
     */
    @Autowired
    public void setNotificationMsgService(NotificationMsgService notificationMsgService) {
        NotificationMsgUtil.notificationMsgService = notificationMsgService;
    }

    public static String getNotiMsgToRemoteClient(String zj){
        System.out.println("111");
        System.out.println(notificationMsgService);

        Map<String,String> notiMsgMap = notificationMsgService.getNotificationMsgResultMapByZJ(zj);

        String msg = JsonUtil.bean2Json(notiMsgMap);

        return msg;

    }


}
