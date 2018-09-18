package com.iyeeku.core.security.service;

import java.util.Map;

public abstract interface IyeekuCheckUserPasswordService {

    public static final String RETURE_VALUE_ISMATCHED = "isMatched";
    public static final String RETURE_VALUE_NOTESID = "notesId";

    public abstract Map<String,String> checkUserNameAndPassword(String paramString1,String paramString2,String paramString3,String paramString4,String paramString5);

}
