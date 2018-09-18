package com.iyeeku.core.cache;


import net.sf.ehcache.Cache;
import org.springframework.cache.ehcache.EhCacheCacheManager;

import java.util.*;

public class CacheUtil<K ,V> {

    private static EhCacheCacheManager cacheManager;

    public void init(){
        CacheUtil.cacheManager = this.cacheManager;
    }

    public static Cache findCache(String cacheName){
        return cacheManager.getCacheManager().getCache(cacheName);
    }

    public static void destoryCache(String cacheName){
        //cacheManager.getCacheManager().
    }

    public static Set<?> getAllKeys(String cacheName){

        Cache cache = findCache(cacheName);
        if (cache == null){
            return new HashSet<>();
        }
        Set keys = (Set) cache.getKeys();
        return keys;
    }

    public static List<?> getValues(String cacheName){
        Cache cache = findCache(cacheName);
        if (cache == null){
            return new ArrayList<>();
        }
        List<String> keys = cache.getKeys();
        List values = new ArrayList();
        for (String key : keys){
            values.add(cache.get(key));
        }
        return Collections.unmodifiableList(values);
    }

    public static boolean isClusteredCache(Cache cache){
        //cacheManager.
        return false;
    }

    public static void setCacheManager(EhCacheCacheManager cacheManager) {
        CacheUtil.cacheManager = cacheManager;
    }
}
