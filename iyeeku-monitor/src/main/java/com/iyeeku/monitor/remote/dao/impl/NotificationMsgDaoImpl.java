package com.iyeeku.monitor.remote.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.monitor.remote.dao.NotificationMsgDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class NotificationMsgDaoImpl extends BaseDaoImpl implements NotificationMsgDao {

    private static Logger logger = LoggerFactory.getLogger(NotificationMsgDaoImpl.class);

    @Override
    public Map<String, String> getNotificationMsgResultMapByZJ(String zj) {
        logger.info("NotificationMsgDao getNotificationMsgResultMapByZJ");
        return this.queryOne_myBatis("com.iyeeku.monitor.remote.dao.NotificationMsgDao.getNotificationMsgResultMapByZJ" ,zj);
    }
}
