package com.iyeeku.core.security;

import com.iyeeku.core.context.ContextUtil;
import com.iyeeku.core.security.dao.IyeekuSecurityMetadataSourceDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.util.AntPathMatcher;

import java.util.*;

/**
 * @description  资源源数据定义
 * 将所有的资源和权限对应关系建立起来，即定义某一资源可以被哪些角色访问
 */
public class IyeekuSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {

    private Logger logger = LoggerFactory.getLogger(IyeekuSecurityMetadataSource.class);
    private boolean loginCheck = true;
    private boolean urlCheck = true;
    private AntPathMatcher antPathMatcher = new AntPathMatcher();

    public IyeekuSecurityMetadataSource(boolean loginCheck , boolean urlCheck){
        this.urlCheck = urlCheck;
        this.loginCheck = loginCheck;
        loadResourceDefine();
    }

    private synchronized void loadResourceDefine(){

        if (this.loginCheck){

        }
    }

    /**
     * 对应的FilterInvocationSecurityMetadataSource 中的getAttributes(Object object)方法返回null的话，
     * AccessDecisionManager就不会起作用了。
     *
     * @param object
     * @return
     * @throws IllegalArgumentException
     */
    public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
        Collection<ConfigAttribute> urlNeedRoles = null;
        if (this.loginCheck){
            if (ContextUtil.getLoginUser() == null){
                this.logger.error("用户未登陆!!!");
                throw new AccessDeniedException("Access reject");
            }

            String url = ((FilterInvocation)object).getRequestUrl();
            int firstQuestionMarkIndex = url.indexOf("?");
            if (firstQuestionMarkIndex != -1){
                url = url.substring(0 , firstQuestionMarkIndex);
            }

            if (this.urlCheck){
                urlNeedRoles = getNeedRoleList(url);
                if (urlNeedRoles == null){

                }

                if (urlNeedRoles == null){
                    this.logger.error("Access reject:{}" , url);
                    throw new AccessDeniedException("Access reject");
                }
            }
        }
        this.logger.info("Request URL:{}" , object);
        if (urlNeedRoles != null){
            for (ConfigAttribute oneRole : urlNeedRoles){
                this.logger.info(oneRole.getAttribute());
            }
        }else{
            this.logger.info("urlNeedRoles is null");
        }
        return urlNeedRoles;
    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    public Collection<ConfigAttribute> getNeedRoleList(String urlString){
        //TODO 以后换成从缓存中取数据
        IyeekuSecurityMetadataSourceDao metadataSourceDao = (IyeekuSecurityMetadataSourceDao)ContextUtil.getBean("iyeekuSecurityMetadataSourceDao");
        System.out.println(metadataSourceDao);
        //Map<String,Object> resourceMap = CacheFORM
        Map<String,Collection<ConfigAttribute>> resourceMap = metadataSourceDao.loadResourceDefine();
        Set<ConfigAttribute> needRoles = null;
        Iterator it = resourceMap.keySet().iterator();
        while (it.hasNext()){
            String resUrl = (String)it.next();
            if (this.antPathMatcher.match(resUrl,urlString)){
                Collection tempRoles = (Collection)resourceMap.get(resUrl);
                if (needRoles == null){
                    needRoles = new HashSet();
                }
                needRoles.addAll(tempRoles);
            }
        }
        return needRoles;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return true;
    }

    public boolean isLoginCheck() {
        return loginCheck;
    }

    public void setLoginCheck(boolean loginCheck) {
        this.loginCheck = loginCheck;
    }

    public boolean isUrlCheck() {
        return urlCheck;
    }

    public void setUrlCheck(boolean urlCheck) {
        this.urlCheck = urlCheck;
    }
}
