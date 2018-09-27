package com.iyeeku.core.security.session;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;
import org.springframework.security.web.util.UrlUtils;
import org.springframework.util.Assert;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class IyeekuConcurrentSessionFilter extends GenericFilterBean {

    private SessionRegistry sessionRegistry;
    private String expireUrl;
    private LogoutHandler[] handlers = { new SecurityContextLogoutHandler() };
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    public IyeekuConcurrentSessionFilter(){

    }

    public IyeekuConcurrentSessionFilter(SessionRegistry sessionRegistry){
        this(sessionRegistry , null);
    }

    public IyeekuConcurrentSessionFilter(SessionRegistry sessionRegistry , String expireUrl){
        this.sessionRegistry = sessionRegistry;
        this.expireUrl = expireUrl;
    }


    public void afterPropertiesSet(){
        Assert.notNull(this.sessionRegistry , "SessionRegistry required");
        Assert.isTrue((this.expireUrl == null) || (UrlUtils.isValidRedirectUrl(this.expireUrl)) , this.expireUrl + " isn't a valid redirect URL");
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse) resp;

        HttpSession session = request.getSession(false);

        if (session != null){
            System.out.println(session.getId());
            SessionInformation info = this.sessionRegistry.getSessionInformation(session.getId());
            if (info != null){
                if (info.isExpired()){  //判断session是否失效
                    doLogout(request , response);

                    String targetUrl = determineExpiredUrl(request , info);

                    if (targetUrl != null){  //判断session失效后，是否存在跳转页面,有，则跳转
                        request.getSession().setAttribute("SPRING_SECURITY_LAST_EXCEPTION" , new SessionAuthenticationException("已达到用户最大允许在线数！"));
                        this.redirectStrategy.sendRedirect(request , response , targetUrl);
                        return;
                    }

                    response.getWriter().print("This session has been expired ()");
                    response.flushBuffer();
                    return;
                }

                this.sessionRegistry.refreshLastRequest(info.getSessionId());
            }

        }

        filterChain.doFilter(request , response);

    }

    protected String determineExpiredUrl(HttpServletRequest request , SessionInformation info){
        return this.expireUrl;
    }

    private void doLogout(HttpServletRequest request , HttpServletResponse response){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        for (LogoutHandler handler : this.handlers){
            handler.logout(request , response , auth);
        }
    }

    public SessionRegistry getSessionRegistry() {
        return sessionRegistry;
    }

    public void setSessionRegistry(SessionRegistry sessionRegistry) {
        this.sessionRegistry = sessionRegistry;
    }

    public String getExpireUrl() {
        return expireUrl;
    }

    public void setExpireUrl(String expireUrl) {
        this.expireUrl = expireUrl;
    }

}
