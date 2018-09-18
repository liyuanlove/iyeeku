package com.iyeeku.core.context;

import com.iyeeku.core.security.IyeekuUserInfo;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContext;
import java.util.Locale;

public class ContextUtil implements ApplicationContextAware {

    private static ApplicationContext appContext = null;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        appContext = applicationContext;
    }

    public static String getMessage(String code , Object[] params , String defaultDesc , Locale locale){
        return appContext.getMessage(code , params , defaultDesc , locale);
    }

    public static <T> T getBean(String beanId , Class<T> clazz) throws Exception{
        return appContext.getBean(beanId,clazz);
    }

    public static <T> T getBean(Class<T> clazz) throws BeansException{
        return appContext.getBean(clazz);
    }

    public static Object getBean(String beanId) throws BeansException{
        return appContext.getBean(beanId);
    }

    public static IyeekuUserInfo getLoginUser(){
        Object userInfo = null;
        SecurityContext securityContext = SecurityContextHolder.getContext();
        if ((securityContext != null) && (securityContext.getAuthentication() != null)){
            userInfo = securityContext.getAuthentication().getPrincipal();
            if ((userInfo instanceof IyeekuUserInfo)){
                return (IyeekuUserInfo)userInfo;
            }
        }
        return null;
    }

    public static ServletContext getServletContext(){
        return ((WebApplicationContext)appContext).getServletContext();
    }

}
