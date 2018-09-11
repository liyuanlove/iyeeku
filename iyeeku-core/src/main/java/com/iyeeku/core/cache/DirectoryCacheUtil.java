package com.iyeeku.core.cache;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.Map;

@Component
public class DirectoryCacheUtil {

    private static Logger logger = LoggerFactory.getLogger(DirectoryCacheUtil.class);

    private static final String keyPrefix = "";
    public static final String CACHE_NAME = "dictionaryCache";  //dictionaryCache
    private static EhCacheCacheManager cacheManager;
    private static JdbcTemplate jdbcTemplate;
    private static Cache cache;

    @Autowired
    public void setCacheManager(EhCacheCacheManager cacheManager) {
        DirectoryCacheUtil.cacheManager = cacheManager;
    }

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        DirectoryCacheUtil.jdbcTemplate = jdbcTemplate;
    }

    @PostConstruct
    public void initDirectoryCacheUtil(){
        logger.info("初始字典缓存工具类 : DirectoryCacheUtil");
        cache = cacheManager.getCache(CACHE_NAME);
        if (cache == null){
            logger.error("未找到名为 : "+ CACHE_NAME + "的缓存");
            //System.exit(0); // 目前设置为退出程序
        }
    }

    /**
     * cache 的 key 命名规则 #str_xxxxx
     * @throws Exception
     */
    public static void initDirectoryCache() throws Exception{
        logger.info("开始初始化字典缓存...");
        String sql = "select SJLXBH from PF_CODETYPE WHERE JLZT = '1'";
        List<Map<String , Object>> list = jdbcTemplate.queryForList(sql);

        StringBuilder sb = new StringBuilder();
        sb.append("select i.mblxbh as \"id\",i.mbtmz as \"text\" from PF_CODEINFO i")
                .append(" left join PF_CODETYPE t on i.sjlx = t.zj")
                .append(" where t.sjlxbh = ? and t.jlzt = '1' and i.jlzt = '1'")
                .append(" order by i.sjsxsy asc");

        for (Map<String , Object> map : list){
            if ( map.get("sjlxbh") != null ){
                String sjlxbh = String.valueOf(map.get("sjlxbh")).trim();
                List<Map<String,Object>> rtn = jdbcTemplate.queryForList(sb.toString(),sjlxbh);
                if (cache != null) {
                    cache.put(keyPrefix + sjlxbh, rtn);
                }else {
                    logger.error("未找到名为 : "+ CACHE_NAME + "的缓存");
                    throw new Exception("\"未找到名为 : \"+ CACHE_NAME + \"的缓存\"");
                }
            }
        }
        logger.info("字典缓存初始化成功...");
    }

    public static List<Map<String,String>> loadDictFromCache(String dictId){
        return cache.get(keyPrefix + dictId , List.class);
    }

    public static void reloadDictCache(String dictId ,List<Map<String,String>> value){
        cache.put(keyPrefix + dictId ,value);
    }


}
