package com.iyeeku.core.security.dao;

import org.springframework.security.access.ConfigAttribute;

import java.util.Collection;
import java.util.Map;

public abstract interface IyeekuSecurityMetadataSourceDao {

    public abstract Map<String , Collection<ConfigAttribute>> loadResourceDefine();

}
