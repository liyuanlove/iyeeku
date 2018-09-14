package com.iyeeku.ext.security.dao;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.core.security.IyeekuUserInfo;
import com.iyeeku.core.security.dao.IyeekuUserDetailsDao;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class IyeekuExtUserDetailsDaoImpl extends BaseDaoImpl implements IyeekuUserDetailsDao {

    @Override
    public IyeekuUserInfo loadUserDetailsByLoginName(String paramString1, String paramString2) throws UsernameNotFoundException {
        return null;
    }


}
