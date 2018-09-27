package com.iyeeku.ext.codetype.service.impl;

import com.iyeeku.core.util.UUIDGenerator;
import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.codeinfo.dao.PFCodeInfoDao;
import com.iyeeku.ext.codeinfo.vo.PFCodeInfoVO;
import com.iyeeku.ext.codetype.dao.PFCodeTypeDao;
import com.iyeeku.ext.codetype.service.PFCodeTypeService;
import com.iyeeku.ext.codetype.vo.PFCodeTypeVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PFCodeTypeServiceImpl implements PFCodeTypeService {

    private final Logger logger = LoggerFactory.getLogger(PFCodeTypeServiceImpl.class);

    private PFCodeTypeDao pfCodeTypeDao;

    private PFCodeInfoDao pfCodeInfoDao;

    @Override
    public Map<String, Object> findAllTypes(PFCodeTypeVO codeTypeVO, Pagination pagination) {
        this.logger.info("PFCodeTypeServiceImpl ");

        List<PFCodeTypeVO> list = this.pfCodeTypeDao.findAllTypes(codeTypeVO ,
                pagination.getPageIndex() * pagination.getPageSize() , pagination.getPageSize());
        int count = this.pfCodeTypeDao.findAllTypesCount(codeTypeVO);

        Map<String ,Object> result = new HashMap<>();
        result.put("data", list);
        result.put("total",count);

        return result;
    }

    @Override
    public PFCodeTypeVO findCodeTypeByZj(String zj) {
        this.logger.info("PFCodeTypeServiceImpl ");
        return this.pfCodeTypeDao.findCodeTypeByZj(zj);
    }

    @Override
    public void save(PFCodeTypeVO vo) {
        this.logger.info("PFCodeTypeServiceImpl ");
        vo.setZj(UUIDGenerator.generate(""));
        vo.setJlzt("1");
        this.pfCodeTypeDao.save(vo);
    }

    @Override
    public void update(PFCodeTypeVO vo) {
        this.logger.info("PFCodeTypeServiceImpl ");
        this.pfCodeTypeDao.update(vo);
    }

    @Override
    public void delete(PFCodeTypeVO codeTypeVO) {
        this.logger.info("PFCodeTypeServiceImpl ");
        this.pfCodeTypeDao.delete(codeTypeVO);

        PFCodeInfoVO codeInfoVO = new PFCodeInfoVO();
        codeInfoVO.setSjlx(codeTypeVO.getZj());

        this.pfCodeInfoDao.delete(codeInfoVO);

    }



    public void setPfCodeTypeDao(PFCodeTypeDao pfCodeTypeDao) {
        this.pfCodeTypeDao = pfCodeTypeDao;
    }

    public void setPfCodeInfoDao(PFCodeInfoDao pfCodeInfoDao) {
        this.pfCodeInfoDao = pfCodeInfoDao;
    }

}
