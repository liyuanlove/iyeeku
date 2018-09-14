package com.iyeeku.ext.directory.web;

import com.iyeeku.core.cache.DirectoryCacheUtil;
import com.iyeeku.ext.directory.service.DirectoryService;
import com.iyeeku.ext.directory.vo.DirectoryVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/directory")
public class DirectoryController {

    private final Logger logger = LoggerFactory.getLogger(DirectoryController.class);

    @Autowired
    private DirectoryService directoryService;

    @RequestMapping(value = "/loadDict/{dictId}" , method = RequestMethod.GET , name = "根据码值查找详情")
    @ResponseBody
    public List<Map<String,String>> loadDict(@PathVariable String dictId){
        this.logger.info("DirectoryController loadDict");
        System.out.println("dictId ==>> " + dictId);
        if (dictId == null || "".equals(dictId)){
            return null;
        }else {
            return this.directoryService.loadDictFromCacheByKey(dictId);
        }
    }

    @RequestMapping(value = "/loadDict1/{dictId}" , method = RequestMethod.GET , name = "根据码值查找详情111")
    @ResponseBody
    public List<Map<String,String>> loadDict1(@PathVariable String dictId){
        this.logger.info("DirectoryController loadDict");
        System.out.println("dictId ==>> " + dictId);
        if (dictId == null || "".equals(dictId)){
            return null;
        }else {
            return this.directoryService.loadDictFromCacheByKey(dictId);
        }
    }

    @RequestMapping(value = "/refreshDict/{dictId}",method = RequestMethod.POST , name = "刷新码值缓存")
    @ResponseBody
    public List<DirectoryVO> refreshDict(@PathVariable String dictId){
        this.logger.info("重新刷新【dictionaryCache】中key为 (#str_"+dictId+") 的缓存");
        return this.directoryService.refreshDictCacheByCodeType(dictId,null);
    }

    @RequestMapping(value = "/refreshDict" , method = RequestMethod.POST , name = "刷新码值缓存")
    @ResponseBody
    public void refreshDict11(String dictId){
        this.logger.info("重新刷新【dictionaryCache】中key为 (#str_"+dictId+") 的缓存");
        this.directoryService.refreshDictCacheByCodeType1(dictId);
    }

    @RequestMapping(value = "/refreshDictAll" , method = RequestMethod.POST , name = "刷新码值缓存")
    @ResponseBody
    public void refreshDictAll(){
        this.logger.info("刷新码表缓存");
        this.directoryService.refreshDictCache();
    }


}
