package com.iyeeku.core.security.session;

import com.iyeeku.core.security.IyeekuUserInfo;
import com.iyeeku.core.security.session.service.IyeekuSessionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.security.core.session.SessionDestroyedEvent;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.util.Assert;

import java.util.ArrayList;
import java.util.List;

public class IyeekuSessionRegistryImpl implements SessionRegistry , ApplicationListener<SessionDestroyedEvent> {

    private final Logger logger = LoggerFactory.getLogger(IyeekuSessionRegistryImpl.class);

    private IyeekuSessionService sessionService = null;

    @Override
    public void onApplicationEvent(SessionDestroyedEvent event) {
        String sessionId = event.getId();
        removeSessionInformation(sessionId);
    }

    @Override
    public List<Object> getAllPrincipals() {
        return null;
    }

    @Override
    public List<SessionInformation> getAllSessions(Object principal, boolean includeExpiredSessions) {
        List<SessionInformation> rtnValue = new ArrayList<>();
        List<IyeekuSessionInformation> iyeekuSessionValueList = this.sessionService.updAndGetAllSessions((IyeekuUserInfo) principal);

        if ((iyeekuSessionValueList != null) && (iyeekuSessionValueList.size() > 0)){
            for (IyeekuSessionInformation oneSession : iyeekuSessionValueList){
                if ( includeExpiredSessions || !oneSession.isExpired() ){
                    rtnValue.add(oneSession);
                }
            }
        }
        return rtnValue;
    }

    @Override
    public SessionInformation getSessionInformation(String sessionId) {
        Assert.hasText(sessionId , "sessionId required as per interface contract");
        SessionInformation sessionInfo = this.sessionService.updAndGetSessionInformation(sessionId);
        return sessionInfo;
    }

    @Override
    public void refreshLastRequest(String sessionId) {
        System.out.println(sessionId);
        System.out.println();

        Assert.hasText(sessionId , "SessionId required as per");

        SessionInformation info = getSessionInformation(sessionId);

        if (info != null){
            info.refreshLastRequest();
        }

    }

    @Override
    public void registerNewSession(String sessionId, Object principal) {

        Assert.hasText(sessionId , "SessionId required as per interface contract");
        Assert.notNull(principal , "Principal required as per interface contract");

        if (this.logger.isDebugEnabled()){
            this.logger.debug("Registering session " + sessionId + " , for principal " + principal);
        }

        this.sessionService.createSessionInfo(sessionId , (IyeekuUserInfo) principal);

        if (this.logger.isTraceEnabled()){
            this.logger.trace("Sessions used by '" + principal + "' : " + sessionId);
        }

    }

    @Override
    public void removeSessionInformation(String sessionId) {
        Assert.hasText(sessionId , "sessionId required as per interface contract");
        if (this.logger.isTraceEnabled()){
            this.logger.debug("Removing session " + sessionId + " from set of registered sessions");
        }

        this.sessionService.removeSessionInformation(sessionId);
    }

    public void setSessionToExpired(String sessionId){
        Assert.hasText(sessionId , "sessionId required as per interface contract");
        if (this.logger.isTraceEnabled()){
            this.logger.debug("Removing session " + sessionId + " from set of registered sessions");
        }

        this.sessionService.updateSessionToExpired(sessionId);
    }

    public IyeekuSessionService getSessionService() {
        return sessionService;
    }

    public void setSessionService(IyeekuSessionService sessionService) {
        this.sessionService = sessionService;
    }
}
