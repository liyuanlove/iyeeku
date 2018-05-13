package com.iyeeku.core.security;

import com.iyeeku.core.utils.DesUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Properties;

public class C3P0DatasourcePropertiesFactory {

    private static final String PRODUCTION_MODE = "0";
    private static final String PROP_PASSWORD = "password";
    private final static Logger logger = LoggerFactory.getLogger(C3P0DatasourcePropertiesFactory.class);

    public static Properties getProperties(String pwd , String production) throws Exception{

        Properties p = new Properties();

        if(PRODUCTION_MODE.equals(production)){
            try{
                System.out.println(pwd);
                String dec_pwd = new DesUtils().decrypt(pwd);
                System.out.println(dec_pwd);
                p.setProperty(PROP_PASSWORD , dec_pwd);
            }catch (Exception e){
                logger.error("C3P0DatasourcePropertiesFactory getProperties is error!" , e);
            }
        }else{
            p.setProperty(PROP_PASSWORD , pwd);
        }

        return p;
    }

}
