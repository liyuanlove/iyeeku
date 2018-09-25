package com.iyeeku.core.security.session;

import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;

public class IyeekuConcurrentSessionFilter extends GenericFilterBean {

    private SessionRegistry sessionRegistry;
    private String expireUrl;
    private LogoutHandler[] handlers = { new SecurityContextLogoutHandler() };
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {

    }

}
