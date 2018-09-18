package com.iyeeku.core.security;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;

import javax.security.auth.Subject;

public class IyeekuUsernamePasswordAuthenticationToken extends UsernamePasswordAuthenticationToken {

    private String userType;
    private String userIP;
    private boolean localDBAuth = true;

    private String loginType="form";

    public IyeekuUsernamePasswordAuthenticationToken(String principal, String credentials, String userType){
        super(principal,credentials);
        this.userType = userType;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getUserIP() {
        return userIP;
    }

    public void setUserIP(String userIP) {
        this.userIP = userIP;
    }

    public boolean isLocalDBAuth() {
        return localDBAuth;
    }

    public void setLocalDBAuth(boolean localDBAuth) {
        this.localDBAuth = localDBAuth;
    }

    public String getLoginType() {
        return loginType;
    }

    public void setLoginType(String loginType) {
        this.loginType = loginType;
    }

    @Override
    public boolean implies(Subject subject) {
        return false;
    }

}
