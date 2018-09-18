package com.iyeeku.core.security.service;

import com.iyeeku.core.security.IyeekuUserInfo;

public abstract interface IyeekuLoginSuccessService {

    public abstract void saveAfterLoginSuccess(IyeekuUserInfo userInfo);

}
