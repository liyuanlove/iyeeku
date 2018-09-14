package com.iyeeku.core.security;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class IyeekuUserInfo extends User {

    private String userId = null;
    private Object otherInfo = null;

    public IyeekuUserInfo(String userId , String userCode , String userName , String userNotesID , String userUnit , String unitPath , String unitName , String password , String mmyz , boolean enabled ,
                          boolean accountNonExpired , boolean credentialsNonExpired , boolean accountNonLocked , Collection<? extends GrantedAuthority> authorities)
    {
        super(userName,password,enabled,accountNonExpired,credentialsNonExpired,accountNonLocked,authorities);
        this.userId = userId;

    }

}
