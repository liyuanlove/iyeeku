package com.iyeeku.core.security.dao;

import com.iyeeku.core.security.IyeekuUserInfo;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public interface IyeekuUserDetailsDao {

    public abstract IyeekuUserInfo loadUserDetailsByLoginName(String paramString1 , String paramString2)
        throws UsernameNotFoundException;

}
