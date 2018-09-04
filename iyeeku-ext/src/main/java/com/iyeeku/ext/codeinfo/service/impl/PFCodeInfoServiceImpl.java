package com.iyeeku.ext.codeinfo.service.impl;

import com.iyeeku.core.utils.UUIDGenerator;
import com.iyeeku.ext.codeinfo.dao.PFCodeInfoDao;
import com.iyeeku.ext.codeinfo.service.PFCodeInfoService;
import com.iyeeku.ext.codeinfo.vo.PFCodeInfoVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PFCodeInfoServiceImpl implements PFCodeInfoService {

    private final Logger logger = LoggerFactory.getLogger(PFCodeInfoServiceImpl.class);

    @Autowired
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
    public List<PFCodeInfoVO> findAllInfosByCodeType(String codetype) {
        this.logger.info("PFCodeInfoServiceImpl findAllInfosByCodeType");
        return this.pfCodeInfoDao.findAllInfosByCodeType(codetype);
    }

    @Override
    public PFCodeInfoVO findCodeInfoByZj(String zj) {
        this.logger.info("PFCodeInfoServiceImpl findCodeInfoByZj");
        return this.pfCodeInfoDao.findCodeInfoByZj(zj);
    }
}
