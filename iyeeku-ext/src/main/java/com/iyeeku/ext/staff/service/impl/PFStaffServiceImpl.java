package com.iyeeku.ext.staff.service.impl;

import com.iyeeku.core.utils.UUIDGenerator;
import com.iyeeku.ext.staff.dao.PFStaffDao;
import com.iyeeku.ext.staff.service.PFStaffService;
import com.iyeeku.ext.staff.vo.PFStaffVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class PFStaffServiceImpl implements PFStaffService {

    private final Logger logger = LoggerFactory.getLogger(PFStaffServiceImpl.class);

    @Autowired
    private PFStaffDao pfStaffDao;

    @Override
    public List<PFStaffVO> findAllStaffInfos() {
        this.logger.info("PFStaffServiceImpl findAllStaffInfos");
        return this.pfStaffDao.findAllStaffInfos();
    }

    @Override
    public PFStaffVO findStaffByYhbh(String yhbh) {
        this.logger.info("PFStaffServiceImpl findStaffByYhbh");
        return this.pfStaffDao.findStaffByYhbh(yhbh);
    }

    @Override
    public void save(PFStaffVO staffVO) {
        this.logger.info("PFStaffServiceImpl save");
        staffVO.setYhbh(UUIDGenerator.generate("").substring(0,9));
        staffVO.setJlzt("1");
        staffVO.setRzrq(new Date());
        this.pfStaffDao.save(staffVO);
    }

    @Override
    public void update(PFStaffVO staffVO) {
        this.logger.info("PFStaffServiceImpl update");
        this.pfStaffDao.update(staffVO);
    }

    @Override
    public void delete(PFStaffVO staffVO) {
        this.logger.info("PFStaffServiceImpl delete");
        this.pfStaffDao.delete(staffVO);
    }

}
