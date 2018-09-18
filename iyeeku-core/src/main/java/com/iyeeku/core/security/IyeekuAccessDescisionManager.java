package com.iyeeku.core.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;
import java.util.Iterator;

/**
 * @description 访问决策器
 * 决定某个用户具有的角色，是否有足够的权限去访问某个资源 ;做最终的访问控制决定
 */
public class IyeekuAccessDescisionManager implements AccessDecisionManager {

    private Logger logger = LoggerFactory.getLogger(IyeekuAccessDescisionManager.class);

    /**
     * @description 认证用户是否具有权限访问该url地址
     * @param authentication
     * @param object
     * @param configAttributes
     * @throws AccessDeniedException
     * @throws InsufficientAuthenticationException
     */
    public void decide(Authentication authentication, Object object, Collection<ConfigAttribute> configAttributes) throws AccessDeniedException, InsufficientAuthenticationException {
        if (configAttributes == null)
            return;
        Iterator it = configAttributes.iterator();
        String needRole;
        System.out.println("==================>> needRole");
        while (it.hasNext()){
            ConfigAttribute ca = (ConfigAttribute)it.next();
            needRole = ((SecurityConfig)ca).getAttribute();
            System.out.println(needRole);

            for (GrantedAuthority ga : authentication.getAuthorities()){
                if (needRole.trim().equals(ga.getAuthority().trim())){
                    return;
                }
            }
        }
        this.logger.error("No permission:{}!" , object);
        throw new AccessDeniedException("Access reject!");
    }

    /**
     * 启动时候被AbstractSecurityInterceptor调用，决定AccessDecisionManager是否可以执行传递ConfigAttribute。
     * @param attribute
     * @return
     */
    public boolean supports(ConfigAttribute attribute) {
        return true;
    }

    /**
     * 被安全拦截器实现调用，包含安全拦截器将显示的AccessDecisionManager支持安全对象的类型
     * @param clazz
     * @return
     */
    public boolean supports(Class<?> clazz) {
        return true;
    }
}
