package com.iyeeku.ext.function.web;

import com.iyeeku.core.context.URLScanCacheUtil;
import com.iyeeku.core.util.StringUtil;
import com.iyeeku.ext.function.service.PFResUrlService;
import com.iyeeku.ext.function.vo.PFResUrlVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/url")
public class PFResUrlController {

    @Autowired
    private PFResUrlService pfResUrlService;

    @RequestMapping(value = "/refreshUrl" , name = "刷新URL")
    @ResponseBody
    public void refreshUrl(){
        System.out.println("刷新URL：执行到这里");
        Map<String,String> allUrls = URLScanCacheUtil.getAllURL();
        this.pfResUrlService.reloadAllUrlData(allUrls);
    }

    @RequestMapping(value = "listNotMenuRelationUrl" , method = RequestMethod.POST , name = "获取菜单可选择关联URL信息")
    @ResponseBody
    public Map<String,Object> listNotMenuRelationUrl(String cdbh , String cdurl , String key){
        Map<String , Object> rtnMap = new HashMap<>();
        List<PFResUrlVO> list = this.pfResUrlService.findNotMenuRelationUrl(cdbh,cdurl,key);
        rtnMap.put("data" , list);
        rtnMap.put("total" , Integer.valueOf(list.size()));
        return rtnMap;
    }

    @RequestMapping(value = "listMenuRelationUrl" , method = {RequestMethod.GET , RequestMethod.POST}, name = "获取菜单关联URL信息")
    @ResponseBody
    public Map<String,Object> listMenuRelationUrl(String cdbh){
        Map<String,Object> rtnMap = new HashMap<>();
        if (StringUtil.isEmpty(cdbh)){
            rtnMap = null;
        }else{
            List<PFResUrlVO> list = this.pfResUrlService.findMenuRelationUrl(cdbh);
            rtnMap.put("data" , list);
            rtnMap.put("total" , Integer.valueOf(list.size()));
        }
        return rtnMap;
    }


}
