package com.iyeeku.ext.codetype.cache;

import com.iyeeku.core.cache.ICacheLoader;
import com.iyeeku.core.orm.impl.BaseDaoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.ehcache.EhCacheCacheManager;

import java.util.Map;

public class PFCodeTypeCacheLoader extends BaseDaoImpl implements ICacheLoader<String,Object> {

    @Autowired
    private EhCacheCacheManager cacheManager;

    @Override
    public Map<String, Object> preLoad() {
        return null;
    }

    @Override
    public Object get(Object paramObject) {
        return null;
    }

    @Override
    public void put(String paramK, Object paramV) {

    }

    @Override
    public Object remove(Object paramObject) {
        return null;
    }
}
