package com.iyeeku.ext.staff.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.ext.staff.dao.PFStaffDao;
import com.iyeeku.ext.staff.vo.PFStaffVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PFStaffDaoImpl extends BaseDaoImpl implements PFStaffDao {

    private final Logger logger = LoggerFactory.getLogger(PFStaffDaoImpl.class);

    @Override
    public List<PFStaffVO> findAllStaffInfos() {
        this.logger.info("PFStaffDaoImpl findAllStaffInfos");
        return this.queryAll_myBatis("com.iyeeku.ext.staff.dao.PFStaffDao.findAllStaffInfos");
    }

    @Override
    public PFStaffVO findStaffByYhbh(String yhbh) {
        this.logger.info("PFStaffDaoImpl findStaffByYhbh");
        return this.queryOne_myBatis("com.iyeeku.ext.staff.dao.PFStaffDao.findStaffByYhbh",yhbh);
    }

    @Override
    public void save(PFStaffVO staffVO) {
        this.logger.info("PFStaffDaoImpl save");
        this.save_myBatis("com.iyeeku.ext.staff.dao.PFStaffDao.save",staffVO);
    }

    @Override
    public void update(PFStaffVO staffVO) {
        this.logger.info("PFStaffDaoImpl update");
        this.update_myBatis("com.iyeeku.ext.staff.dao.PFStaffDao.update",staffVO);
    }

    @Override
    public void delete(PFStaffVO staffVO) {
        this.logger.info("PFStaffDaoImpl delete");
        this.delete_myBatis("com.iyeeku.ext.staff.dao.PFStaffDao.delete",staffVO);
    }
}
