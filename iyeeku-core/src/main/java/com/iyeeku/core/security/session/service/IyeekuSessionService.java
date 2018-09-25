package com.iyeeku.core.security.session.service;

import com.iyeeku.core.security.IyeekuUserInfo;
import com.iyeeku.core.security.session.IyeekuSessionInformation;

import java.util.List;

public abstract interface IyeekuSessionService {

    public abstract void createSessionInfo(String paramString , IyeekuUserInfo userInfo);

    public abstract List<IyeekuSessionInformation> updAndGetAllSessions(IyeekuUserInfo userInfo);

    public abstract IyeekuSessionInformation updAndGetSessionInformation(String paramString);

    public abstract void removeSessionInformation(String paramString);

    public abstract int getAllowedMaxSession();

    public abstract boolean isRejectLoginMaxSession();

    public abstract void updateSessionToExpired(String paramString);

    public abstract void deleteSessionInfo();

    public abstract boolean existSessionInformation(String paramString);

}
