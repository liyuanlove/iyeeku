package com.iyeeku.ext.directory.service.impl;

import com.iyeeku.core.cache.DirectoryCacheUtil;
import com.iyeeku.ext.codeinfo.dao.PFCodeInfoDao;
import com.iyeeku.ext.codetype.dao.PFCodeTypeDao;
import com.iyeeku.ext.directory.service.DirectoryService;
import com.iyeeku.ext.directory.vo.DirectoryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DirectoryServiceImpl implements DirectoryService {

    @Autowired
    private PFCodeInfoDao pfCodeInfoDao;
    @Autowired
    private PFCodeTypeDao pfCodeTypeDao;

    /**
     *
     value：缓存位置名称，不能为空，如果使用EHCache，就是ehcache.xml中声明的cache的name
     key：缓存的key(保证唯一的参数)，默认为空，既表示使用方法的参数类型及参数值作为key，支持SpEL
     缓存key还可以用如下规则组成,当我们要使用root作为key时，可以不用写root直接@Cache(key="caches[1].name")。因为他默认是使用#root的
     1.methodName   当前方法名        #root.methodName
     2.method      当前方法        #root.method.name
     3.target      当前被动用对象        #root.target
     4.targetClass   当前被调用对象        Class#root.targetClass
     5.args       当前方法参数组成的数组  #root.args[0]
     6.caches      当前被调用方法所使用的Cache   #root.caches[0],name
     7.方法参数     假设包含String型参数str      #str
     #p0代表方法的第一个参数
     假设包含HttpServletRequest型参数request  #request.getAttribute('usId32')  调用入参对象的相关包含参数的方法
     假设包含User型参数user             #user.usId   调用入参对象的无参方法可以直接用此形式
     8.字符串                                                    '字符串内容'

     condition：触发条件,只有满足条件的情况才会加入缓存,默认为空,既表示全部都加入缓存,支持SpEL
     unless：   触发条件,只有不满足条件的情况才会加入缓存,默认为空,既表示全部都加入缓存,支持SpEL
     #result  可以获得返回结果对象
     *
     */
    @Cacheable(value = "dictionaryCache",key = "#str+'_'+#p0")
    public List<DirectoryVO> findInfoListByCodeType(String codetype , String sjsxsyOrder) {

        Map<String,String> param = new HashMap<>();
        param.put("codetype",codetype);

        if(null == sjsxsyOrder || "".equals(sjsxsyOrder)){
            param.put("sjsxsyOrder","TRUE");
        }else{
            param.put("sjsxsyOrder","FALSE");
        }

        return this.pfCodeInfoDao.findCodeInfosByCodeType(param);
    }


    @Cacheable(value = "dictionaryCache" , key = "#str+'_'+#p0")
    public List<Map<String,String>> findInfoListByCodeType1(String codetype){
/*        Map<String,String> param = new HashMap<>();
        param.put("codetype",codetype);
        param.put("sjsxsyOrder","TRUE");
        List<DirectoryVO> directoryVOS = this.pfCodeInfoDao.findCodeInfosByCodeType(param);

        List<Map<String,String>> rtnList = new ArrayList<>();
        Map<String,String> rtnMap;
        for (DirectoryVO vo : directoryVOS){
            rtnMap = new HashMap<>();
            rtnMap.put("id" , vo.getId());
            rtnMap.put("text", vo.getText());
            rtnList.add(rtnMap);
        }
        return rtnList;*/
        return null;
    }

    @Cacheable(value = "dictionaryCache" , key = "#p0")
    public List<Map<String, String>> loadDictFromCacheByKey(String key) {
        Map<String,String> param = new HashMap<>();
        param.put("codetype",key);
        param.put("sjsxsyOrder","TRUE");
        List<DirectoryVO> directoryVOS = this.pfCodeInfoDao.findCodeInfosByCodeType(param);

        List<Map<String,String>> rtnList = new ArrayList<>();
        Map<String,String> rtnMap;
        for (DirectoryVO vo : directoryVOS){
            rtnMap = new HashMap<>();
            rtnMap.put("id" , vo.getId());
            rtnMap.put("text", vo.getText());
            rtnList.add(rtnMap);
        }
        return rtnList;
    }

    /**
     * @CachePut
     * 它虽然也可以声明一个方法支持缓存，但它执行方法前是不会去检查缓存中是否存在之前执行过的结果，
     * 而是每次都执行该方法，并将执行结果放入指定缓存中
     *
     * 该方法就是 ， 不坚持 key 为 ""#str+'_'+#p0"  是否在 dictionaryCache 中有缓存，
     * 直接执行 refreshDictCacheByCodeType 方法，再把返回结构放到缓存中
     *
     */
    @CachePut(value = "dictionaryCache",key = "#str+'_'+#p0")
    public List<DirectoryVO> refreshDictCacheByCodeType(String codetype , String sjsxsyOrder){
        Map<String,String> param = new HashMap<>();
        param.put("codetype",codetype);

        if(null == sjsxsyOrder || "".equals(sjsxsyOrder)){
            param.put("sjsxsyOrder","TRUE");
        }else{
            param.put("sjsxsyOrder","FALSE");
        }
        return this.pfCodeInfoDao.findCodeInfosByCodeType(param);
    }


    @Override
    public void refreshDictCacheByCodeType1(String codetype) {
        List<Map<String,String>> value = this.pfCodeInfoDao.findCodeInfoCacheDataByCodeType(codetype);
        DirectoryCacheUtil.reloadDictCache(codetype,value);
    }

    @Override
    public void refreshDictCache() {
        List<String> sjlxbhList = this.pfCodeTypeDao.findAllSjlxbh();
        for (String sjlxbh : sjlxbhList){
            List<Map<String,String>> value = this.pfCodeInfoDao.findCodeInfoCacheDataByCodeType(sjlxbh);
            DirectoryCacheUtil.reloadDictCache(sjlxbh , value);
        }
    }
}
