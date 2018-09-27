package com.iyeeku.ext.codeinfo.service.impl;

import com.iyeeku.core.util.UUIDGenerator;
import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.codeinfo.dao.PFCodeInfoDao;
import com.iyeeku.ext.codeinfo.service.PFCodeInfoService;
import com.iyeeku.ext.codeinfo.vo.PFCodeInfoVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class PFCodeInfoServiceImpl implements PFCodeInfoService {

    private final Logger logger = LoggerFactory.getLogger(PFCodeInfoServiceImpl.class);

    private PFCodeInfoDao pfCodeInfoDao;

    @Override
    public void delete(PFCodeInfoVO codeInfoVO) {
        this.logger.info("PFCodeInfoServiceImpl delete");
        this.pfCodeInfoDao.delete(codeInfoVO);
    }

    @Override
    public void save(PFCodeInfoVO codeInfoVO) {
        this.logger.info("PFCodeInfoServiceImpl save");
        codeInfoVO.setZj(UUIDGenerator.generate(""));
        codeInfoVO.setJlzt("1");
        this.pfCodeInfoDao.save(codeInfoVO);
    }

    @Override
    public void update(PFCodeInfoVO codeInfoVO) {
        this.logger.info("PFCodeInfoServiceImpl update");
        this.pfCodeInfoDao.update(codeInfoVO);
    }

    @Override
    public Map<String, Object> findAllInfosByCodeType(String codetype, PFCodeInfoVO codeInfoVO, Pagination pagination) {
        Map<String,String> param = new HashMap<>();
        param.put("sjlx" , codetype);

        List<PFCodeInfoVO> list = this.pfCodeInfoDao.findCodeInfosByCodeType(param,
                pagination.getPageIndex() * pagination.getPageSize() , pagination.getPageSize());
        int count = this.pfCodeInfoDao.findCodeInfoCountByCodeType(param);

        Map<String , Object> result = new HashMap<>();
        result.put("data" , list);
        result.put("total" , count);
        return result;
    }

    @Override
    public List<PFCodeInfoVO> findAllInfosByCodeType(String codetype) {
        this.logger.info("PFCodeInfoServiceImpl findAllInfosByCodeType");
        return this.pfCodeInfoDao.findAllInfosByCodeType(codetype);
    }

    @Override
    public PFCodeInfoVO findCodeInfoByZj(String zj) {
        this.logger.info("PFCodeInfoServiceImpl findCodeInfoByZj");
        return this.pfCodeInfoDao.findCodeInfoByZj(zj);
    }


    public void setPfCodeInfoDao(PFCodeInfoDao pfCodeInfoDao) {
        this.pfCodeInfoDao = pfCodeInfoDao;
    }
}
