package com.iyeeku.core.exception;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.iyeeku.core.context.ContextUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.ExceptionHandlerExceptionResolver;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class AnnotationHandlerMethodExceptionResolver extends ExceptionHandlerExceptionResolver {

    private Logger logger = LoggerFactory.getLogger(AnnotationHandlerMethodExceptionResolver.class);

    @Override
    protected ModelAndView doResolveHandlerMethodException(HttpServletRequest request, HttpServletResponse response, HandlerMethod handlerMethod, Exception exception) {

        Locale locale = RequestContextUtils.getLocaleResolver(request).resolveLocale(request);

        Throwable cause = null;

        if ((exception instanceof SQLException)){
            cause = exception;
        }else if ( (exception.getCause() instanceof  SQLException)){
            cause = exception.getCause();
        }
        if ((cause instanceof SQLException)){
            SQLException eNext = (SQLException) cause;

            while (eNext != null){
                this.logger.error("SQLCODE: {} {}" , new Object[]{ Integer.valueOf(eNext.getErrorCode()) , eNext.getMessage()});

                Throwable causeNew = eNext.getCause();
                if (causeNew != null){
                    if ((causeNew instanceof SQLException)){
                        this.logger.error("SQLCODE: {} {}" , new Object[]{ Integer.valueOf(((SQLException)causeNew).getErrorCode()) , ((SQLException)causeNew).getMessage()});
                    }
                    this.logger.error(causeNew.getMessage());
                }
                eNext = eNext.getNextException();
            }
        }

        if (handlerMethod == null){
            ModelAndView view = new ModelAndView();
            if ((exception instanceof MaxUploadSizeExceededException)){
                //TODO
            }else if ((exception instanceof HttpRequestMethodNotSupportedException)){
                this.logger.error("请求接口：" + request.getRequestURI() + "，不支持该类型！" ,exception);
            }
            view.addObject("errStack" , getStackString(exception , "<br/>"));
            view.setViewName("error/error");
            return view;
        }

        Method method = handlerMethod.getMethod();
        if (method == null){
            return null;
        }
        ResponseBody responseBodyAnn = AnnotationUtils.findAnnotation(method , ResponseBody.class);

        response.setStatus(500);
        ModelAndView view = new ModelAndView();

        if (responseBodyAnn != null){
            Map<String , String> errMap = new HashMap<>();
            processException(exception , view , locale , errMap);
            errMap.put("errStack" , getStackString(exception , "\n"));
            ObjectMapper objMapper = new ObjectMapper();
            try{
                view.addObject("errStack" , objMapper.writeValueAsString(errMap));
            }catch (Exception e){
                this.logger.error("将消息转换为JSON串出错！" , e);
            }
            view.setViewName("error/ajaxerror");
            return view;
        }

        processException(exception , view , locale , null);
        view.setViewName("error/error");
        view.addObject("errStack" , getStackString(exception , "<br/>"));
        return view;
    }


    private String getStackString(Throwable ex , String lineFlag){
        String resultStr = ex.toString() + lineFlag;
        StackTraceElement[] stacks = ex.getStackTrace();
        if (stacks != null){
            for (StackTraceElement oneStack : stacks){
                String oneStackStr = oneStack.toString();
                if (oneStackStr.startsWith("com.iyeeku")){  //只展示自己编写java文件的保存堆栈信息
                    resultStr = resultStr + oneStackStr + lineFlag;
                }
            }
        }
        if (resultStr != null){
            resultStr = resultStr.substring(0 , resultStr.length() - lineFlag.length());
        }
        return resultStr;
    }

    private void processException(Throwable ex , ModelAndView view , Locale locale , Map<String,String> errMap){

        if (false){
            //TODO

        }else {
            String errCode = "platform.syserror.000001";
            String errMsg = "UnKnown exception , please call administrator!";
            //if ((ex instanceof))
            if (false){
                //TODO
            }else{
                errMsg = ContextUtil.getMessage(errCode , null , errCode , locale);
                if (errMsg == null || "".equals(errMsg)){
                    errMsg = "未知异常，请联系管理员！";
                }
            }
            String logMsg = "业务逻辑异常！\nerrCode:" + errCode + "\nerrMsg:" + errMsg;
            this.logger.error(logMsg,ex);
            if (errMap != null){
                errMap.put("errCode" , errCode);
                errMap.put("errMsg" , errMsg);
            }else{
                view.addObject("errCode" , errCode);
                view.addObject("errMsg" , errMsg);
            }
        }
    }

}
