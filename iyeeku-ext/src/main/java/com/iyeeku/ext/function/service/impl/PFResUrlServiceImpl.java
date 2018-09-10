package com.iyeeku.ext.function.service.impl;

import com.iyeeku.core.utils.UUIDGenerator;
import com.iyeeku.ext.function.dao.PFResMenuDao;
import com.iyeeku.ext.function.dao.PFResUrlDao;
import com.iyeeku.ext.function.service.PFResUrlService;
import com.iyeeku.ext.function.vo.PFResMenuVO;
import com.iyeeku.ext.function.vo.PFResUrlVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class PFResUrlServiceImpl implements PFResUrlService {

    private Logger logger = LoggerFactory.getLogger(PFResUrlServiceImpl.class);

    @Autowired
    private PFResUrlDao pfResUrlDao;

    @Autowired
    private PFResMenuDao pfResMenuDao;

    @Override
    public List<PFResUrlVO> findNotMenuUrl(String key) {
        Map<String,String> map = new HashMap<>();
        if(key != null && !"".equals(key)){
            map.put("key" , "%"+key+"%");
        }
        return this.pfResUrlDao.findNotMenuUrl(map);
    }

    @Override
    public void reloadAllUrlData(Map<String, String> initUrlData) {
        this.logger.info("开发处理url...");
        Map<String,String> processData = processInitUrlData(initUrlData);

        processData.forEach((k ,v ) -> System.out.println("URL：" + k + " , DESC：" + v));
        // 从已经入库的数据中 分离出 "所有url" 和 "模块url"
        Set<String> existUrls = new HashSet<>();
        Set<String> existModuleUrls = new HashSet<>();
        List<PFResUrlVO> resUrlVOList = this.pfResUrlDao.findAllUrls();
        for (PFResUrlVO resUrlVO : resUrlVOList){
            String url = resUrlVO.getUrllj();
            existUrls.add(url);
            if(url.indexOf("/",1) > 1){
                String moduleUrl = url.substring(0,url.indexOf("/",1)) + "/**/*";
                if (!existModuleUrls.contains(moduleUrl)){
                    existModuleUrls.add(moduleUrl);
                }
            }
        }

        this.logger.info("已经入库列表：\t\n{}");

        // 从所有扫描的所有controller方法url数据中  分离出 "所有url" 和 "模块url"
        Set<String> initUrls = new HashSet<>();
        Set<String> initModuleUrls = new HashSet<>();
        Set<String> initSets = processData.keySet();
        for (String initUrl : initSets){
            String url = initUrl + "";   // + ".do" 可以转换URL
            initUrls.add(url);
            if ( url.indexOf("/",1) > -1){
                String moduleUrl = url.substring(0,url.indexOf("/",1)) + "/**/*";
                if (!initModuleUrls.contains(moduleUrl)){
                    initModuleUrls.add(moduleUrl);
                }
            }
        }
        Set<String> allInitUrls = new HashSet<>();  //将 分离出 "所有url" 和 "模块url" 合并到一起
        allInitUrls.addAll(initUrls);
        allInitUrls.addAll(initModuleUrls);
        this.logger.info("扫描列表：\t\n{}");

        Set<String> addUrls = new HashSet<>();
        addUrls.addAll(initUrls);
        addUrls.removeAll(existUrls);  // 得到controller中新添加的 url (对比数据中)

        PFResUrlVO urlVO = null;
        Set<String> addModuleUrls = new HashSet<>();

        for (Iterator<String> it = initUrls.iterator(); it.hasNext(); ){
            String url = it.next();

            if ( url.indexOf("/",1) > -1) {

                String moduleUrl = url.substring(0, url.indexOf("/", 1)) + "/**/*";

                if ((!addModuleUrls.contains(moduleUrl)) && (!existModuleUrls.contains(moduleUrl))) { //把新增加的 模块url保存到数据库中
                    addModuleUrls.add(moduleUrl);

                    urlVO = new PFResUrlVO();
                    urlVO.setUrlbh(UUIDGenerator.generate(""));
                    urlVO.setUrlbm("");
                    urlVO.setUrllj(moduleUrl);
                    urlVO.setUrlms("该模块下的所有功能");
                    urlVO.setUrllx("0");
                    // 做save操作
                    this.pfResUrlDao.addUrl(urlVO);
                }
            }

            urlVO = new PFResUrlVO();
            urlVO.setUrllj(url);
            urlVO.setUrlms(processData.get(url));
            urlVO.setUrllx("0");
            if (addUrls.contains(url)){
                urlVO.setUrlbh(UUIDGenerator.generate(""));
                // 做save操作
                this.pfResUrlDao.addUrl(urlVO);
            } else {
                // 做update操作 （根据URL路径更新）
                this.pfResUrlDao.updateUrlByLj(urlVO);
            }
        }

        this.logger.info("新增列表：\t\n{}");

        // 这个以后做个配置，刷新URL时，是否需要删除URL信息和授权信息
        if (true) {

            Set<String> delUrls = new HashSet<>();
            delUrls.addAll(existUrls);
            delUrls.removeAll(initModuleUrls);
            delUrls.removeAll(initUrls);

            for (Iterator<String> iterator = delUrls.iterator(); iterator.hasNext(); ) {
                String url = iterator.next();
                urlVO = new PFResUrlVO();
                urlVO.setUrllx(url);
                urlVO.setUrllx("0");
                // 做删除操作 根据url路径
                this.pfResUrlDao.deleteUrlByLj(urlVO);
            }
            this.logger.info("删除列表：\t\n{}");

            List<String> grantedUrlList = new ArrayList<>();
            //List<>

        }


    }

    private Map<String,String> processInitUrlData(Map<String,String> initUrlData){
        Map<String,String> processData = new HashMap<>();
        String url = "";
        for (Map.Entry<String,String> entry : initUrlData.entrySet()){
            url = entry.getKey();
            if((url.indexOf("{") > -1) || (url.indexOf("}") > -1)){
               this.logger.info("url like %{% or %}%");  //过滤掉类似  /xxx/xxx/{} 这种形式的 url
            }else {
                processData.put(url + "" , entry.getValue()); //这里如果 url+".do" , 那么方法扫描出来的全是 .do 的形式
            }
        }
        List<PFResMenuVO> menuVOList = this.pfResMenuDao.findAllMenu();
        for (PFResMenuVO menuVO : menuVOList){
            if((menuVO.getCdurl() != null) && (!menuVO.getCdurl().trim().equals(""))){
                String menuUrl = menuVO.getCdurl();
                if(processData.containsKey(menuUrl)){
                    processData.put(menuUrl , "【" + menuVO.getCdmc() + "】主页面 | " + processData.get(menuUrl));
                }
            }
        }
        return processData;
    }



}
