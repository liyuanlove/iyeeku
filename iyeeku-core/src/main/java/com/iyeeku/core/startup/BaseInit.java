package com.iyeeku.core.startup;

import com.iyeeku.core.utils.ContextUtil;
import com.iyeeku.core.utils.PropertyMgr;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContextEvent;
import java.util.Properties;

public class BaseInit {

    private static boolean B_INITED = false;

    public static synchronized void init(ServletContextEvent context){

        Properties props = PropertyMgr.init("config.env.app");
        BaseEnv.getInstance().setSystemProps(props);

        try{

            if(true){
                ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(context.getServletContext());
                ContextUtil.setApplicationContext(ctx);
            }

        }catch (Exception e){
            e.printStackTrace();
        }




    }

}
