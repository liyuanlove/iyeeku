package com.iyeeku.core.security;

import com.iyeeku.core.context.ContextUtil;
import com.iyeeku.core.security.service.IyeekuCheckUserPasswordService;
import com.iyeeku.core.security.service.IyeekuLoginSuccessService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.security.authentication.*;
import org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider;
import org.springframework.security.authentication.encoding.BasePasswordEncoder;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.Map;

public class IyeekuAuthenticationProvider extends AbstractUserDetailsAuthenticationProvider {

    private Logger logger = LoggerFactory.getLogger(IyeekuAuthenticationProvider.class);

    private IyeekuUserDetailsService iyeekuUserDetailsService;
    private BasePasswordEncoder passwordEncoder;
    private boolean useRequestUserType = false;
    private static final String DEFAULT_USER_TYPE = "NotesID";

    @Override
    public boolean supports(Class<?> authentication) {
        return IyeekuUsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
    }

    @Override
    protected void additionalAuthenticationChecks(UserDetails userDetails, UsernamePasswordAuthenticationToken authentication) throws AuthenticationException {
        IyeekuUsernamePasswordAuthenticationToken iyeekuAuthentication = (IyeekuUsernamePasswordAuthenticationToken)authentication;

        if (iyeekuAuthentication.isLocalDBAuth()){

            if (authentication.getCredentials() == null){
                this.logger.debug("Authentication failed : no credentials provided");
                throw new BadCredentialsException("bad Credentials");
            }

            String presentedPassword = authentication.getCredentials().toString();
            System.out.println(presentedPassword);    //7c4a8d09ca3762af61e59520943dc26494f8941b
            System.out.println(userDetails.getPassword());  //e10adc3949ba59abbe56e057f20f883e

            this.passwordEncoder.isPasswordValid(userDetails.getPassword() , presentedPassword , ((IyeekuUserInfo)userDetails).getMmyz());


        }

    }


    private void passwordCheck(IyeekuUsernamePasswordAuthenticationToken authenticationToken , UserDetails userDetails , String presentedPassword){
        if (this.passwordEncoder != null){
            if (!this.passwordEncoder.isPasswordValid(userDetails.getPassword() , presentedPassword , ((IyeekuUserInfo)userDetails).getMmyz())){
                this.logger.debug("AuthenticationToken failed : password does not match stored value");
                throw new BadCredentialsException("bad Credentials");
            }
        }
        else if ((presentedPassword == null) || (!authenticationToken.getCredentials().equals(userDetails.getPassword())) ){
            this.logger.debug("AuthenticationToken failed : password does not match stored value");
            throw new BadCredentialsException("bad Credentials");
        }
    }


    @Override
    protected UserDetails retrieveUser(String username, UsernamePasswordAuthenticationToken authentication) throws AuthenticationException {
        IyeekuUsernamePasswordAuthenticationToken iyeekuAuthentication = (IyeekuUsernamePasswordAuthenticationToken)authentication;

        if ( (username == null) || (authentication.getCredentials() == null) ){
            throw new BadCredentialsException("bad Credentials");
        }
        if (iyeekuAuthentication.isLocalDBAuth() != true){

            IyeekuCheckUserPasswordService userPasswordCheck = ContextUtil.getBean(IyeekuCheckUserPasswordService.class);
            if (userPasswordCheck == null){
                throw new AuthenticationServiceException("Bean IyeekuCheckUserPasswordService can't be found!");
            }
            Map resMap = userPasswordCheck.checkUserNameAndPassword(iyeekuAuthentication.getUserType() , iyeekuAuthentication.getLoginType() , username , authentication.getCredentials().toString() , null);
            int checkResult = Integer.parseInt((String) resMap.get("isMatched"));

            if (checkResult != 0){
                if (checkResult == 1)
                    throw new BadCredentialsException("用户名或密码错误！");
                if (checkResult == 2)
                    throw new LockedException("用户被锁定！");
                if (checkResult == 3)
                    throw new AccountExpiredException("密码过期！");
                if (checkResult == 4)
                    throw new DisabledException("用户已失效！");
                throw new AuthenticationServiceException("未知错误，登陆失败！");
            }

            String notesId = username;
            if (!isUseRequestUserType()){
                notesId = (String) resMap.get("notesId");
                iyeekuAuthentication.setUserType("NotesID");
            }
            IyeekuUserInfo userInfo = (IyeekuUserInfo)getUserDetailInfo( notesId , iyeekuAuthentication);
            doAfterLoginSuccess(userInfo);
            return userInfo;

        }
        return getUserDetailInfo(username , iyeekuAuthentication);
    }

    private UserDetails getUserDetailInfo(String username , IyeekuUsernamePasswordAuthenticationToken iyeekuAuthentication){
        UserDetails userInfo = this.iyeekuUserDetailsService.loadUserByUsername(username , iyeekuAuthentication.getUserType());
        if (userInfo == null){
            throw new UsernameNotFoundException("指定用户不存在！");
        }
        ((IyeekuUserInfo)userInfo).setUserIP(iyeekuAuthentication.getUserIP());
        return userInfo;
    }

    private void passwordCheck(UsernamePasswordAuthenticationToken authentication , UserDetails userDetails , String presentedPassword){
        if (this.passwordEncoder != null){
            if (!this.passwordEncoder.isPasswordValid(userDetails.getPassword() , presentedPassword ,((IyeekuUserInfo)userDetails).getMmyz())){
                this.logger.debug("Authentication failed: password does not match stored value");
                throw new BadCredentialsException("bad Credentials");
            }
        }else{
            if ((presentedPassword == null) || (!authentication.getCredentials().equals(userDetails.getPassword()))){
                this.logger.debug("Authentication failed: password does not match stored value");
                throw new BadCredentialsException("bad Credentials");
            }
        }
    }

    private void doAfterLoginSuccess(UserDetails userDetails){
        try {
            IyeekuLoginSuccessService loginSuccessService = ContextUtil.getBean(IyeekuLoginSuccessService.class);
            if (loginSuccessService != null){
                loginSuccessService.saveAfterLoginSuccess((IyeekuUserInfo) userDetails);
            }
        }catch (NoSuchBeanDefinitionException e){

        }
    }

    public IyeekuUserDetailsService getIyeekuUserDetailsService() {
        return iyeekuUserDetailsService;
    }

    public void setIyeekuUserDetailsService(IyeekuUserDetailsService iyeekuUserDetailsService) {
        this.iyeekuUserDetailsService = iyeekuUserDetailsService;
    }

    public BasePasswordEncoder getPasswordEncoder() {
        return passwordEncoder;
    }

    public void setPasswordEncoder(BasePasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    public boolean isUseRequestUserType() {
        return useRequestUserType;
    }

    public void setUseRequestUserType(boolean useRequestUserType) {
        this.useRequestUserType = useRequestUserType;
    }

}
