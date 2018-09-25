package com.iyeeku.core.security.session;

import com.iyeeku.core.security.session.service.IyeekuSessionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.security.core.session.SessionDestroyedEvent;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;

import java.util.List;

public class IyeekuSessionRegistryImpl implements SessionRegistry , ApplicationListener<SessionDestroyedEvent> {

    private final Logger logger = LoggerFactory.getLogger(IyeekuSessionRegistryImpl.class);

    private IyeekuSessionService sessionService = null;


    @Override
    public void onApplicationEvent(SessionDestroyedEvent event) {

    }

    @Override
    public List<Object> getAllPrincipals() {
        return null;
    }

    @Override
    public List<SessionInformation> getAllSessions(Object principal, boolean includeExpiredSessions) {
        return null;
    }

    @Override
    public SessionInformation getSessionInformation(String sessionId) {
        return null;
    }

    @Override
    public void refreshLastRequest(String sessionId) {

    }

    @Override
    public void registerNewSession(String sessionId, Object principal) {

    }

    @Override
    public void removeSessionInformation(String sessionId) {

    }

    public IyeekuSessionService getSessionService() {
        return sessionService;
    }

    public void setSessionService(IyeekuSessionService sessionService) {
        this.sessionService = sessionService;
    }
}
