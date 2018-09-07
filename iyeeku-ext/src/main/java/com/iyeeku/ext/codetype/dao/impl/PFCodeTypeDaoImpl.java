package com.iyeeku.ext.codetype.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.ext.codetype.dao.PFCodeTypeDao;
import com.iyeeku.ext.codetype.vo.PFCodeTypeVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PFCodeTypeDaoImpl extends BaseDaoImpl implements PFCodeTypeDao {

    private final Logger logger = LoggerFactory.getLogger(PFCodeTypeDaoImpl.class);

    @Override
    public List<PFCodeTypeVO> findAllTypes() {
        this.logger.info("PFCodeTypeDaoImpl findAllTypes");
        return findAllTypes(null,-1,-1);
    }

    @Override
    public List<PFCodeTypeVO> findAllTypes(PFCodeTypeVO vo, int offSet, int pageSize) {
        this.logger.info("PFCodeTypeDaoImpl findAllTypes");
        return this.queryAll_myBatis("com.iyeeku.ext.codetype.dao.PFCodeTypeDao.findAllTypes",vo,offSet,pageSize);
    }

    @Override
    public int findAllTypesCount(PFCodeTypeVO vo) {
        this.logger.info("PFCodeTypeDaoImpl findAllTypesCount");
        return this.queryOne_myBatis("com.iyeeku.ext.codetype.dao.PFCodeTypeDao.findAllTypesCount",vo);
    }

    @Override
    public PFCodeTypeVO findCodeTypeByZj(String zj) {
        this.logger.info("PFCodeTypeDaoImpl findCodeTypeByZj");
        return this.queryOne_myBatis("com.iyeeku.ext.codetype.dao.PFCodeTypeDao.findCodeTypeByZj",zj);
    }

    @Override
    public void save(PFCodeTypeVO vo) {
        this.logger.info("PFCodeTypeDaoImpl save");
        this.save_myBatis("com.iyeeku.ext.codetype.dao.PFCodeTypeDao.save",vo);
    }

    @Override
    public void update(PFCodeTypeVO vo) {
        this.logger.info("PFCodeTypeDaoImpl update");
        this.update_myBatis("com.iyeeku.ext.codetype.dao.PFCodeTypeDao.update",vo);
    }

    @Override
    public void delete(PFCodeTypeVO vo) {
        this.logger.info("PFCodeTypeDaoImpl delete");
        this.delete_myBatis("com.iyeeku.ext.codetype.dao.PFCodeTypeDao.delete",vo);
    }

    @Override
    public List<String> findAllSjlxbh() {
        return this.queryAll_myBatis("com.iyeeku.ext.codetype.dao.PFCodeTypeDao.findAllSjlxbh");
    }
}
