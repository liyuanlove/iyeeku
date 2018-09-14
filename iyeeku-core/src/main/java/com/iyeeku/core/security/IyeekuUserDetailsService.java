package com.iyeeku.core.security;

import com.iyeeku.core.security.dao.IyeekuUserDetailsDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class IyeekuUserDetailsService implements UserDetailsService {

    private final Logger logger = LoggerFactory.getLogger(IyeekuUserDetailsService.class);

    private IyeekuUserDetailsDao userDetailsDao = null;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return null;
    }

    public void setUserDetailsDao(IyeekuUserDetailsDao userDetailsDao) {
        this.userDetailsDao = userDetailsDao;
    }

}
