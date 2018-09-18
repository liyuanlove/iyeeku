package com.iyeeku.core.cache;

import com.iyeeku.core.context.ContextUtil;
import com.iyeeku.core.security.dao.IyeekuSecurityMetadataSourceDao;
import org.springframework.security.access.ConfigAttribute;

import java.util.Collection;
import java.util.Map;

public class PermissionCacheLoader implements ICacheLoader<String , Map<String , Collection<ConfigAttribute>>> {

    public static final String CACHE_NAME = "CacheForPermission";
    public static final String KEY_NAME = "_RES_ROLE";

    @Override
    public Map<String, Map<String, Collection<ConfigAttribute>>> preLoad() {
        return null;
    }

    @Override
    public Map<String, Collection<ConfigAttribute>> get(Object paramObject) {
        IyeekuSecurityMetadataSourceDao metadataSourceDao = (IyeekuSecurityMetadataSourceDao)ContextUtil.getBean("iyeekuExtSecurityMetadataSourceDao");
        Map resRoleMap = metadataSourceDao.loadResourceDefine();
        return resRoleMap;
    }

    @Override
    public void put(String paramK, Map<String, Collection<ConfigAttribute>> paramV) {

    }

    @Override
    public Map<String, Collection<ConfigAttribute>> remove(Object paramObject) {
        return null;
    }

}
