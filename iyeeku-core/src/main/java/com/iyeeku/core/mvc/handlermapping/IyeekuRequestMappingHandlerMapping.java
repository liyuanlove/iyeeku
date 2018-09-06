package com.iyeeku.core.mvc.handlermapping;

import com.iyeeku.core.context.URLScanCacheUtil;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.condition.*;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import java.lang.reflect.Method;
import java.util.Set;

public class IyeekuRequestMappingHandlerMapping extends RequestMappingHandlerMapping {



    @Override
    protected void registerHandlerMethod(Object handler, Method method, RequestMappingInfo mapping) {
        super.registerHandlerMethod(handler, method, mapping);

        Set<String> patterns = getMappingPathPatterns(mapping);
        for (String pattern : patterns){
            if(!getPathMatcher().isPattern(pattern)){
/*                FunctionDesc funDesc = AnnotationUtils.findAnnotation(method , FunctionDesc.class);
                RequestMapping reqMap = AnnotationUtils.findAnnotation(method,RequestMapping.class);
                if(funDesc != null){


                }else {
                    if (reqMap != null){

                    }
                }*/

                RequestMapping reqMap = AnnotationUtils.findAnnotation(method,RequestMapping.class);
                if (reqMap != null){
                    URLScanCacheUtil.addURL( pattern , reqMap.name() );
                } else {
                    URLScanCacheUtil.addURL( pattern , "" );
                }

            }
        }

    }

 /*   @Override
    protected RequestMappingInfo getMappingForMethod(Method method, Class<?> handlerType) {

        RequestMappingInfo info = null;
        RequestMapping methodAnnotation = AnnotationUtils.findAnnotation(method , RequestMapping.class);

        if(methodAnnotation != null){
            RequestCondition methodCondition = getCustomMethodCondition(method);
            info = createRequestMappingInfo(methodAnnotation , methodCondition);
            RequestMapping typeAnnotation = AnnotationUtils.findAnnotation( handlerType , RequestMapping.class);
            if( typeAnnotation != null){
                RequestCondition typeCondition = getCustomTypeCondition(handlerType);
                info = createRequestMappingInfo(typeAnnotation , typeCondition).combine(info);
            }
        }else{
            RequestCondition methodCondition = getCustomMethodCondition(method);
            info = createMethodRequestMappingInfo(method,methodCondition);

            if (info != null){
                RequestMapping typeAnnotation = AnnotationUtils.findAnnotation(handlerType , RequestMapping.class);
                if(typeAnnotation != null){
                    RequestCondition typeCondition = getCustomTypeCondition(handlerType);
                    info = createRequestMappingInfo(typeAnnotation,typeCondition).combine(info);
                }
            }
        }

        if ((null != info) && (getPostMappingInfo(method))){
           info = new RequestMappingInfo(info.getPatternsCondition() , new RequestMethodsRequestCondition(new RequestMethod[]{ RequestMethod.POST}) , info.getParamsCondition() , info.getHeadersCondition() , info.getConsumesCondition() , info.getProducesCondition() , info.getCustomCondition());
        }
        return info;
    }*/

    protected RequestMappingInfo createMethodRequestMappingInfo(Method method , RequestCondition<?> condition){
        if(method != null){
            if( 1 != method.getModifiers())
                return null;
            String methodUrl = method.getName();
            if(!methodUrl.startsWith("/")){
                methodUrl = "/" + methodUrl;
                String[] patterns = new String[1];
                patterns[0] = methodUrl;

                RequestMethod[] methods = new RequestMethod[0];
                String[] params = new String[0];
                String[] headers = new String[0];
                String[] consumes = new String[0];
                String[] producers = new String[0];

                return new RequestMappingInfo(new PatternsRequestCondition(patterns,getUrlPathHelper(),getPathMatcher(),useSuffixPatternMatch(),useTrailingSlashMatch(),getFileExtensions()),new RequestMethodsRequestCondition(methods),new ParamsRequestCondition(params),new HeadersRequestCondition(headers),new ConsumesRequestCondition(consumes ,headers),new ProducesRequestCondition(producers ,headers , getContentNegotiationManager()),condition);
            }
        }
        return null;
    }


    private boolean getPostMappingInfo(Method method){
        if(null == method){
            return false;
        }
        ForcePostMethod methodAnnotation = AnnotationUtils.findAnnotation(method , ForcePostMethod.class);
        if(null != methodAnnotation){
            return true;
        }
        return false;
    }



}
