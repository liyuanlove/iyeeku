package com.iyeeku.core.util;

import java.util.Enumeration;
import java.util.Properties;
import java.util.ResourceBundle;

public class PropertyMgr {

    public static synchronized Properties init(String sPropFile){
        Properties props = new Properties();
        ResourceBundle bundle = ResourceBundle.getBundle(sPropFile);
        Enumeration enums = bundle.getKeys();
        Object key = null;
        Object value = null;
        while(enums.hasMoreElements()){
            key = enums.nextElement();
            value = bundle.getString(key.toString());
            props.put(key, value);
        }
        bundle = null;
        return props;
    }

}
