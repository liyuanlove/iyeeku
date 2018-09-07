package com.iyeeku.core.context;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class ContextUtil implements ApplicationContextAware {

    private static ApplicationContext appContext = null;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        appContext = applicationContext;
    }

    public static <T> T getBean(String beanId , Class<T> clazz) throws Exception{
        return appContext.getBean(beanId,clazz);
    }

    public static <T> T getBean(Class<T> clazz) throws BeansException{
        return appContext.getBean(clazz);
    }

}
