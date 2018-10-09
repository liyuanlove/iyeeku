package com.iyeeku.ext.staff.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.ext.staff.dao.PFStaffDao;
import com.iyeeku.ext.staff.vo.PFStaffVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public class PFStaffDaoImpl extends BaseDaoImpl implements PFStaffDao {

    private final Logger logger = LoggerFactory.getLogger(PFStaffDaoImpl.class);

    @Override
    public List<PFStaffVO> findAllStaffs(PFStaffVO staffVO, int offSet, int pageSize) {
        this.logger.info("PFStaffDaoImpl findAllStaffs");
        return this.queryAll_myBatis("com.iyeeku.ext.staff.dao.PFStaffDao.findAllStaffs" , staffVO , offSet , pageSize);
    }

    @Override
    public int findAllStaffsCount(PFStaffVO staffVO) {
        this.logger.info("PFStaffDaoImpl findAllStaffsCount");
        return this.queryOne_myBatis("com.iyeeku.ext.staff.dao.PFStaffDao.findAllStaffsCount" , staffVO);
    }

    @Override
    public List<PFStaffVO> findListNotAddedStaff(Map<String, String> map, int offSet, int pageSize) {
        return this.queryAll_myBatis("com.iyeeku.ext.staff.dao.PFStaffDao.findListNotAddedStaff" , map , offSet , pageSize);
    }

    @Override
    public int findListNotAddedStaffCount(Map<String, String> map) {
        return this.queryOne_myBatis("com.iyeeku.ext.staff.dao.PFStaffDao.findListNotAddedStaffCount" , (Serializable) map);
    }

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

    @Override
    public List<Map> getStaffExportData() {
        return this.queryAll_myBatis("com.iyeeku.ext.staff.dao.PFStaffDao.getStaffExportData");
    }
}
