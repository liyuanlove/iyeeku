package com.iyeeku.ext.security.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.core.security.dao.IyeekuSecurityMetadataSourceDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;

import java.util.*;

public class IyeekuExtSecurityMetadataSourceDaoImpl extends BaseDaoImpl implements IyeekuSecurityMetadataSourceDao {

    private Logger logger = LoggerFactory.getLogger(IyeekuExtSecurityMetadataSourceDaoImpl.class);

    @Override
    public Map<String, Collection<ConfigAttribute>> loadResourceDefine() {

        Map<String , Collection<ConfigAttribute>> resourceMap = new HashMap<>();
        Set roleList = null;
        List<Map> resultList = this.queryAll_myBatis("com.iyeeku.core.security.findUrlRole",null);

        String url = null;
        if (resultList != null){
            for (Map map : resultList){
                url = (String) map.get("URLLJ");
                roleList = (Set) resourceMap.get(url);
                if (roleList == null){
                    roleList = new HashSet();
                    roleList.add(new SecurityConfig((String) map.get("ROLEID")));
                    resourceMap.put(url , roleList);
                }else{
                    roleList.add(new SecurityConfig((String) map.get("ROLEID")));
                }
            }
        }
        return resourceMap;
    }
}
