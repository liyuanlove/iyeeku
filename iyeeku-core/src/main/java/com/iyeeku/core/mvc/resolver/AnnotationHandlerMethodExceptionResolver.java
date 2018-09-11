package com.iyeeku.core.mvc.resolver;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.ExceptionHandlerExceptionResolver;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.Locale;

public class AnnotationHandlerMethodExceptionResolver extends ExceptionHandlerExceptionResolver {

    private Logger logger = LoggerFactory.getLogger(AnnotationHandlerMethodExceptionResolver.class);
    private  String defaultErrorView;

    public String getDefaultErrorView() {
        return defaultErrorView;
    }

    public void setDefaultErrorView(String defaultErrorView) {
        this.defaultErrorView = defaultErrorView;
    }


    @Override
    protected ModelAndView doResolveHandlerMethodException(HttpServletRequest request, HttpServletResponse response, HandlerMethod handlerMethod, Exception exception) {

        Locale locale = RequestContextUtils.getLocaleResolver(request).resolveLocale(request);

        Throwable cause = null;

        if( (exception instanceof SQLException)){
            cause = exception;
        }else if ((exception.getCause() instanceof SQLException)){
            cause = exception.getCause();
        }


        return super.doResolveHandlerMethodException(request, response, handlerMethod, exception);
    }
}
