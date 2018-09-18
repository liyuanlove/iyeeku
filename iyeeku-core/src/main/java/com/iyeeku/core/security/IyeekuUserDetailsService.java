package com.iyeeku.core.security;

import com.iyeeku.core.security.dao.IyeekuUserDetailsDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class IyeekuUserDetailsService {

    private Logger logger = LoggerFactory.getLogger(IyeekuUserDetailsService.class);

    private IyeekuUserDetailsDao userDetailsDao = null;

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserDetails userDetails = loadUserByUsername(username , "");
        if (userDetails == null){
            throw new UsernameNotFoundException("指定用户不存在！");
        }
        return userDetails;
    }

    public UserDetails loadUserByUsername(String username , String userType) throws UsernameNotFoundException{
        return this.userDetailsDao.loadUserDetailsByLoginName(username,userType);
    }

    protected Object loadOtherInfo(String userId){ return null;}

    public void setUserDetailsDao(IyeekuUserDetailsDao userDetailsDao) {
        this.userDetailsDao = userDetailsDao;
    }

}
