package com.iyeeku.core.cache;

import org.springframework.cache.Cache;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.jdbc.core.JdbcTemplate;

public abstract class AbstractCacheUtil<K , V> implements ICacheLoader<K , V> {

    public static EhCacheCacheManager cacheManager;
    public static JdbcTemplate jdbcTemplate;
    public static Cache cache;

    public AbstractCacheUtil(){

    }

}


