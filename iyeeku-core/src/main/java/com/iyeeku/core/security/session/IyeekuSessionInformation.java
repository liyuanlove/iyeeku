package com.iyeeku.core.security.session;

import com.iyeeku.core.context.ContextUtil;
import org.springframework.security.core.session.SessionInformation;

import java.util.Date;

public class IyeekuSessionInformation extends SessionInformation {

    private IyeekuSessionRegistryImpl sessionRegistry = null;

    public IyeekuSessionInformation(Object principal , String sessionId , Date lastRequest){
        super(principal , sessionId , lastRequest);
    }

    @Override
    public void expireNow() {
        if (this.sessionRegistry == null){
            this.sessionRegistry = (IyeekuSessionRegistryImpl)ContextUtil.getBean("sessionRegistry");
            this.sessionRegistry.setSessionToExpired(super.getSessionId());
        }
        super.expireNow();
    }

}
