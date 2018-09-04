package com.iyeeku.ext.codeinfo.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.ext.codeinfo.dao.PFCodeInfoDao;
import com.iyeeku.ext.codeinfo.vo.PFCodeInfoVO;
import com.iyeeku.ext.directory.vo.DirectoryVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class PFCodeInfoDaoImpl extends BaseDaoImpl implements PFCodeInfoDao {

    private final Logger logger = LoggerFactory.getLogger(PFCodeInfoDaoImpl.class);

    @Override
    public void delete(PFCodeInfoVO codeInfoVO) {
        this.logger.info("PFCodeInfoDaoImpl delete");
        this.delete_myBatis("com.iyeeku.ext.codeinfo.dao.PFCodeInfoDao.delete",codeInfoVO);
    }

    @Override
    public void save(PFCodeInfoVO codeInfoVO) {
        this.logger.info("PFCodeInfoDaoImpl save");
        this.save_myBatis("com.iyeeku.ext.codeinfo.dao.PFCodeInfoDao.save",codeInfoVO);
    }

    @Override
    public void update(PFCodeInfoVO codeInfoVO) {
        this.logger.info("PFCodeInfoDaoImpl update");
        this.update_myBatis("com.iyeeku.ext.codeinfo.dao.PFCodeInfoDao.update",codeInfoVO);
    }

    @Override
    public List<PFCodeInfoVO> findAllInfosByCodeType(String codetype) {
        this.logger.info("PFCodeInfoDaoImpl findAllInfosByCodeType");
        return this.queryAll_myBatis("com.iyeeku.ext.codeinfo.dao.PFCodeInfoDao.findAllInfosByCodeType",codetype);
    }

    @Override
    public PFCodeInfoVO findCodeInfoByZj(String zj) {
        this.logger.info("PFCodeInfoDaoImpl findCodeInfoByZj");
        return this.queryOne_myBatis("com.iyeeku.ext.codeinfo.dao.PFCodeInfoDao.findCodeInfoByZj",zj);
    }

    @Override
    public List<DirectoryVO> findCodeInfosByCodeType(Map<String, String> param) {
        this.logger.info("PFCodeInfoDaoImpl findCodeInfosByCodeType");
        return this.queryAll_myBatis("com.iyeeku.ext.codeinfo.dao.PFCodeInfoDao.findCodeInfosByCodeType",param);
    }
}
