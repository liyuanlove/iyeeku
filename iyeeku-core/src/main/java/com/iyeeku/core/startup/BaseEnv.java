package com.iyeeku.core.startup;

import java.io.Serializable;
import java.util.Properties;

public class BaseEnv implements Serializable {

    private static final long serialVersionUID = 1L;

    private static BaseEnv BASE_ENV = new BaseEnv();
    private Properties systemProps = null ;

    public static BaseEnv getInstance(){
        return BASE_ENV;
    }

    public Properties getSystemProps(){
        return this.systemProps;
    }

    public void setSystemProps(Properties systemProps){
        this.systemProps = systemProps;
    }

    public String getSystemProp(String key){
        return getSystemProps().getProperty(key);
    }


}
