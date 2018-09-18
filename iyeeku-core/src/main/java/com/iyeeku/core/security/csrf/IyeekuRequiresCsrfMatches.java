package com.iyeeku.core.security.csrf;

import org.springframework.security.web.util.matcher.RequestMatcher;

import javax.servlet.http.HttpServletRequest;
import java.util.regex.Pattern;

public class IyeekuRequiresCsrfMatches implements RequestMatcher {

    private Pattern allowedMethods = Pattern.compile("^(GET|HEAD|TRACE|OPTIONS)$");

    @Override
    public boolean matches(HttpServletRequest request) {
        if ((request.getServletPath().indexOf("j_spring_security_check") != -1) || (request.getServletPath().indexOf("j_spring_cas_security_check") != -1) || (request.getServletPath().indexOf("j_spring_cas_security_logout") != -1) || ((request.getContentType() != null) && ( request.getContentType().toLowerCase().indexOf("multipart/") != -1))){
            return false;
        }
        return !this.allowedMethods.matcher(request.getMethod()).matches();
    }

}
