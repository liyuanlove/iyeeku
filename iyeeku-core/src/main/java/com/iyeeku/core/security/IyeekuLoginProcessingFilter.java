package com.iyeeku.core.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.util.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class IyeekuLoginProcessingFilter extends AbstractAuthenticationProcessingFilter {

    private Logger logger = LoggerFactory.getLogger(IyeekuLoginProcessingFilter.class);

    private String userNameParameter = "j_username";
    private String passwordParameter = "j_password";
    private String userTypeParameter = "j_usertype";
    private String loginTypeParameter = "j_logintype";
    private String isLocalDBCheckParameter = "j_islocaldbcheck";
    private boolean localDBAuth = true;
    private String crossAuthUserTypeParameter = "";
    private String crossAuthUserNameParameter = "";
    private String crossAuthPassWordParameter = "";

    private String userType = "NotesID";

    private String loginType = "";

    public IyeekuLoginProcessingFilter(){
        super("/j_spring_security_check");
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException, IOException, ServletException {

        String loginType = request.getParameter(getLoginTypeParameter());
        IyeekuUsernamePasswordAuthenticationToken authRquest = null;
        if(loginType == null || ("form".equalsIgnoreCase(loginType))){
            this.logger.debug("本地认证");


            String username = request.getParameter(getUserNameParameter());
            String password = request.getParameter(getPasswordParameter());
            String usertype = request.getParameter(getUserTypeParameter());

            if (usertype == null){
                authRquest = new IyeekuUsernamePasswordAuthenticationToken(username,password,getUserType());
            }else{
                authRquest = new IyeekuUsernamePasswordAuthenticationToken(username,password,usertype);
            }

            authRquest.setLoginType(getLoginType());
            authRquest.setLocalDBAuth(isLocalDBAuth());

        }else{
            this.logger.debug("交叉验证");
            String username = request.getParameter(getCrossAuthUserNameParameter());
            String password = request.getParameter(getCrossAuthPassWordParameter());
            String usertype = request.getParameter(getCrossAuthUserTypeParameter());
            if (usertype == null){
                authRquest = new IyeekuUsernamePasswordAuthenticationToken(username,password,getUserType());
            }else{
                authRquest = new IyeekuUsernamePasswordAuthenticationToken(username,password,usertype);
            }

            authRquest.setLoginType(getLoginType());
            authRquest.setLocalDBAuth(false);
        }
        authRquest.setUserIP(getIpAddr(request));

        if (request.getParameter(getIsLocalDBCheckParameter()) != null){
            authRquest.setLocalDBAuth(Boolean.parseBoolean(request.getParameter(getIsLocalDBCheckParameter())));
        }

        Authentication rtn = getAuthenticationManager().authenticate(authRquest); // TO  IyeekuAuthenticationProvider

        return rtn;
    }


    private String getIpAddr(HttpServletRequest request){
        String ip = request.getHeader("X-Real-IP");
        if (!StringUtils.isEmpty(ip) && (!"unknown".equalsIgnoreCase(ip))){
            return ip;
        }
        ip = request.getHeader("X-Forwarded-For");
        if (!StringUtils.isEmpty(ip) && (!"unknown".equalsIgnoreCase(ip))){
            int index = ip.indexOf(",");
            if (index != -1){
                return ip.substring( 0 , index);
            }
            return ip;
        }
        return request.getRemoteAddr();
    }


    public String getUserNameParameter() {
        return userNameParameter;
    }

    public String getPasswordParameter() {
        return passwordParameter;
    }

    public String getUserTypeParameter() {
        return userTypeParameter;
    }

    public String getLoginTypeParameter() {
        return loginTypeParameter;
    }

    public String getIsLocalDBCheckParameter() {
        return isLocalDBCheckParameter;
    }

    public boolean isLocalDBAuth() {
        return localDBAuth;
    }

    public String getCrossAuthUserTypeParameter() {
        return crossAuthUserTypeParameter;
    }

    public String getCrossAuthUserNameParameter() {
        return crossAuthUserNameParameter;
    }

    public String getCrossAuthPassWordParameter() {
        return crossAuthPassWordParameter;
    }

    public String getUserType() {
        return userType;
    }

    public String getLoginType() {
        return loginType;
    }
}
