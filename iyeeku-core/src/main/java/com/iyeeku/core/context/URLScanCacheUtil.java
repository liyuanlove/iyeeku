package com.iyeeku.core.context;

import java.util.HashMap;
import java.util.Map;

public class URLScanCacheUtil {

    private static final Map<String,String> HANDLER_URL = new HashMap<>();

    public static void addURL(String url , String funDesc){
        HANDLER_URL.put(url,funDesc);
    }

    public static Map<String,String> getAllURL(){
        return HANDLER_URL;
    }

    public static void printAllURL(){
        HANDLER_URL.forEach((k ,v ) -> System.out.println("URL：" + k + " , DESC：" + v));
    }

}
