package com.iyeeku.ext.directory.web;

import com.iyeeku.ext.directory.service.DirectoryService;
import com.iyeeku.ext.directory.vo.DirectoryVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/directory")
public class DirectoryController {

    private final Logger logger = LoggerFactory.getLogger(DirectoryController.class);

    @Autowired
    private DirectoryService directoryService;

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
     * @param dictId
     * @return
     */
    @Cacheable(value = "dictionaryCache",key = "#str+'_'+#p0")
    @RequestMapping(value = "/loadDict/{dictId}" , method = RequestMethod.GET , name = "根据码值查找详情")
    @ResponseBody
    public List<DirectoryVO> loadDict(@PathVariable String dictId){
        this.logger.info("DirectoryController loadDict");
        System.out.println("dictId ==>> " + dictId);
        if (dictId == null || "".equals(dictId)){
            return null;
        }else {
            return this.directoryService.findInfoListByCodeType(dictId , null);
        }
    }

    /**
     * @CachePut
     * 它虽然也可以声明一个方法支持缓存，但它执行方法前是不会去检查缓存中是否存在之前执行过的结果，
     * 而是每次都执行该方法，并将执行结果放入指定缓存中
     *
     * 该方法就是 ， 不坚持 key 为 ""#str+'_'+#p0"  是否在 dictionaryCache 中有缓存，
     * 直接执行里面 findInfoListByCodeType 方法，再把结构放到缓存中
     *
     * @param dictId
     * @return
     */
    @CachePut(value = "dictionaryCache",key = "#str+'_'+#p0")
    @RequestMapping(value = "/refreshDict/{dictId}",method = RequestMethod.POST , name = "刷新码值缓存")
    @ResponseBody
    public List<DirectoryVO> refreshDict(@PathVariable String dictId){
        this.logger.info("重新刷新【dictionaryCache】中key为 (#str_"+dictId+") 的缓存");
        return this.directoryService.findInfoListByCodeType(dictId,null);
    }

}
