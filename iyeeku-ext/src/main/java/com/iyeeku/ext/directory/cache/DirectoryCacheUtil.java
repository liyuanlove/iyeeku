package com.iyeeku.ext.directory.cache;

import com.iyeeku.ext.codetype.dao.PFCodeTypeDao;
import com.iyeeku.ext.codetype.vo.PFCodeTypeVO;
import com.iyeeku.ext.directory.service.DirectoryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class DirectoryCacheUtil {

    /**
     * 注意这里关于静态属性的注入问题， @Autowired 不能直接作用在属性上，setter 方法也不能带有 static
     */
    private static Logger logger = LoggerFactory.getLogger(DirectoryCacheUtil.class);

    private static PFCodeTypeDao pfCodeTypeDao;
    private static DirectoryService directoryService;

    @Autowired
    public void setPfCodeTypeDao(PFCodeTypeDao pfCodeTypeDao) {
        DirectoryCacheUtil.pfCodeTypeDao = pfCodeTypeDao;
    }

    @Autowired
    public void setDirectoryService(DirectoryService directoryService) {
        DirectoryCacheUtil.directoryService = directoryService;
    }

    // @PostConstruct
    public void initCache(){
        logger.info("开始初始化码表缓存");
        List<PFCodeTypeVO> codeTypeVOList = pfCodeTypeDao.findAllTypes();
        for (PFCodeTypeVO codeTypeVO : codeTypeVOList){
            if (codeTypeVO.getSjlxbh() != null && !"".equals(codeTypeVO.getSjlxbh())){
                directoryService.findInfoListByCodeType(codeTypeVO.getSjlxbh(),null);
            }
        }
    }


/*    public static void initCodeTypeCache(){
        logger.info("开始初始化码表缓存");
        List<PFCodeTypeVO> codeTypeVOList = pfCodeTypeDao.findAllTypes();
        for (PFCodeTypeVO codeTypeVO : codeTypeVOList){
            if (codeTypeVO.getSjlxbh() != null && !"".equals(codeTypeVO.getSjlxbh())){
                directoryService.findInfoListByCodeType(codeTypeVO.getSjlxbh(),null);
            }
        }
    }*/

}
