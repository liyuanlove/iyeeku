package com.iyeeku.core.startup;

import com.iyeeku.core.cache.AppBaseCacheUtil;
import com.iyeeku.core.cache.DirectoryCacheUtil;
import com.iyeeku.core.util.ContextUtil;
import com.iyeeku.core.util.PropertyMgr;
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

                //加载字典缓存
                DirectoryCacheUtil.initDirectoryCache();
                //加载系统基础缓存
                AppBaseCacheUtil.initAppBaseCache();

                // 清除在线列表
                AppBaseCacheUtil.clearOnline();


                //加载缓存jdbcTemplate
                //IBaseDao baseDao = ctx.getBean(BaseDaoImpl.class);
                //CacheManager cacheManager = (CacheManager)ctx.getBean("ehCacheManager");
                //Cache cache = cacheManager.getCache("dictionaryCache");

/*                JdbcTemplate jdbcTemplate = (JdbcTemplate)ctx.getBean("jdbcTemplate");

                EhCacheCacheManager cacheManager = (EhCacheCacheManager)ctx.getBean("ehCacheManager");
                Cache cache = cacheManager.getCache("dictionaryCache");

                String sql = "select SJLXBH from PF_CODETYPE WHERE JLZT = '1'";
                List<Map<String , Object>> list = jdbcTemplate.queryForList(sql);

                StringBuilder sb = new StringBuilder();
                sb.append("select i.mblxbh as id,i.mbtmz as text from PF_CODEINFO i")
                        .append(" left join PF_CODETYPE t on i.sjlx = t.zj")
                        .append(" where t.sjlxbh = ? and t.jlzt = '1' and i.jlzt = '1'")
                        .append(" order by i.sjsxsy asc");

                for (Map<String , Object> map : list){
                    if ( map.get("sjlxbh") != null ){
                        String sjlxbh = String.valueOf(map.get("sjlxbh")).trim();
                        System.out.println(sjlxbh);

                        List<Map<String,Object>> rtn = jdbcTemplate.queryForList(sb.toString(),sjlxbh);
                        //jdbcTemplate.queryForList(sb.toString() , sjlxbh , List<Map<String,String>> )

                        cache.put("#str_"+sjlxbh , rtn);
                        // List aa = cache.get("#str_roleType" , List.class);

                    }
                }

                List<Map<String,String>> data = cache.get("#str_roleType" , List.class);
                System.out.println("拿出cache中的数据");
                for (Map<String,String> map : data ){
                    System.out.println(map.get("id") + " ," + map.get("text"));
                }*/

            }

        }catch (Exception e){
            e.printStackTrace();
        }




    }

}
