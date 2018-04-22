package com.iyeeku.core.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.BeanFactoryUtils;
import org.springframework.context.ApplicationContext;

public class ContextUtil {

    private static final String NULL_BEAN = "null";
    public static final String SCOPE_SESSION = "sessionContextHolder";
    public static final String SCOPE_REQUEST = "requestContextHolder";
    public static final String SCOPE_APPLICATION = "applicationContextHolder";
    public static final String CONTEXT_HTTP_REQUEST = "httpRequest";
    public static final String CONTEXT_HTTP_SESSION = "httpSession";
    private static Log log = LogFactory.getLog(ContextUtil.class);
    private static ApplicationContext APPLICATION_CONTEXT;

    public static ApplicationContext getApplicationContext() {
        return APPLICATION_CONTEXT;
    }
    public static void setApplicationContext(ApplicationContext applicationContext) {
        APPLICATION_CONTEXT = applicationContext;
    }

    public static Object getBean(String beanId){
        if(beanId == null){
            return null;
        }

        if("null".equalsIgnoreCase(beanId)){
            return null;
        }

        return getBeanByBeanIdOrClass(beanId, null);
    }


    public static List getBeansByClass(Class targetClass){
        List ret = new ArrayList();
        if((APPLICATION_CONTEXT==null)||(targetClass==null)){
            return ret;
        }

        Map beans = BeanFactoryUtils.beansOfTypeIncludingAncestors(APPLICATION_CONTEXT, targetClass,true,true);

        if(beans.size()==0){
            log.info("No bean of type "+ targetClass.toString() + " found.");
            return new ArrayList();
        }

        return new ArrayList(beans.values());
    }

    public static Object getBeanByBeanIdOrClass(String beanId,Class clazz){
        if(APPLICATION_CONTEXT == null){
            return null;
        }

        if("null".equalsIgnoreCase(beanId)){
            return null;
        }

        if((beanId != null)&&(APPLICATION_CONTEXT.containsBean(beanId))){
            return APPLICATION_CONTEXT.getBean(beanId);
        }

        List l = getBeansByClass(clazz);
        if(l.size()>0){
            return l.get(0);
        }

        return null;
    }

    public static void put(String key,Object value,String scopeBeanId){
        ContextHolder contextHolder=(ContextHolder) getBean(scopeBeanId);
        if(contextHolder != null){
            contextHolder.put(key, value);
        }
    }

    public static Object get(String key,String scopeBeanId){
        ContextHolder contextHolder=(ContextHolder) getBean(scopeBeanId);
        if(contextHolder != null){
            return contextHolder.get(key);
        }
        return null;
    }

    public static void clear(String scopeBeanId){
        ContextHolder contextHolder=(ContextHolder) getBean(scopeBeanId);
        if(contextHolder != null){
            contextHolder.clear();
        }
    }

}
