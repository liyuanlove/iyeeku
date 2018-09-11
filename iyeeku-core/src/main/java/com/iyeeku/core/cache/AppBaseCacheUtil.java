package com.iyeeku.core.cache;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class AppBaseCacheUtil {
    private static final Logger logger = LoggerFactory.getLogger(AppBaseCacheUtil.class);
    private static final String keyPrefix = "";
    public static final String CACHE_NAME = "appBaseCache";
    private static EhCacheCacheManager cacheManager;
    private static JdbcTemplate jdbcTemplate;
    private static Cache cache;

    @Autowired
    public void setCacheManager(EhCacheCacheManager cacheManager) {
        AppBaseCacheUtil.cacheManager = cacheManager;
    }

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        AppBaseCacheUtil.jdbcTemplate = jdbcTemplate;
    }

    @PostConstruct
    public void initAppBaseCacheUtil(){
        logger.info("初始基础缓存工具类 : AppBaseCacheUtil");
        cache = cacheManager.getCache(CACHE_NAME);
        if (cache == null){
            logger.error("未找到名为 : "+ CACHE_NAME + "的缓存");
            //System.exit(0);//目前设置为退出程序
        }
    }

    public static void initAppBaseCache() throws Exception{
        logger.info("初始化基础缓存...");
        String sql = "select cdbh,cdmc,cdtp,cdurl from PF_RESMENU where sjcdbh = 'DEFAULT_MENUTREE_ROOT' order by cdsxh asc";
        List<Map<String , Object>> list = jdbcTemplate.queryForList(sql);
        cache.put("navMenu" , walkMenuTreeData(list));  //加载菜单导航缓存
        logger.info("基础缓存初始化结束...");
    }

    private static List<Map<String,Object>> walkMenuTreeData(List<Map<String , Object>> list){
        String sql = "SELECT cdbh,cdmc,cdtp,cdurl FROM PF_RESMENU WHERE sjcdbh = ? order by cdsxh asc";
        List<Map<String,Object>> rtnList = new ArrayList<>();
        Map<String ,Object> rtnMap = null;
        for (Map<String,Object> map : list){
            rtnMap = new HashMap<>();
            String cdbh = String.valueOf(map.get("CDBH"));
            List<Map<String , Object>> children = jdbcTemplate.queryForList(sql , cdbh);
            if (children != null && children.size() > 0){
                rtnMap.put("id" , String.valueOf(map.get("CDBH")));
                rtnMap.put("iconCls" , String.valueOf(map.get("CDTP")));
                rtnMap.put("text" , String.valueOf(map.get("CDMC")));
                rtnMap.put("children",walkMenuTreeData(children));
                rtnList.add(rtnMap);
            }else{
                rtnMap.put("id" , String.valueOf(map.get("CDBH")));
                rtnMap.put("iconCls" , String.valueOf(map.get("CDTP")));
                rtnMap.put("text" , String.valueOf(map.get("CDMC")));
                rtnMap.put("url" , String.valueOf(map.get("CDURL")));
                rtnList.add(rtnMap);
            }
        }
        return rtnList;
    }

    public static void put(String key,Object value){
        cache.put(key,value);
    }

    public static<T> T get(String key , Class<T> type){
        return cache.get(key,type);
    }

}
