package com.iyeeku.ext.function.web;

import com.iyeeku.core.context.URLScanCacheUtil;
import com.iyeeku.ext.function.service.PFResUrlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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


}
