package com.iyeeku.ext.staff.service.impl;

import com.iyeeku.core.context.ContextUtil;
import com.iyeeku.core.util.UUIDGenerator;
import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.staff.dao.PFStaffDao;
import com.iyeeku.ext.staff.service.PFStaffService;
import com.iyeeku.ext.staff.vo.PFStaffVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PFStaffServiceImpl implements PFStaffService {

    private final Logger logger = LoggerFactory.getLogger(PFStaffServiceImpl.class);

    @Autowired
    private PFStaffDao pfStaffDao;

    @Override
    public Map<String, Object> findAllStaffs(PFStaffVO staffVO, Pagination pagination) {
        Map<String , Object> result = new HashMap<>();

        List<PFStaffVO> list = this.pfStaffDao.findAllStaffs(staffVO ,
                pagination.getPageIndex()*pagination.getPageSize() , pagination.getPageSize());
        int count = this.pfStaffDao.findAllStaffsCount(staffVO);

        result.put("data" , list);
        result.put("total" , count);
        return result;
    }

    @Override
    public Map<String, Object> getListNotAddedRole(String yhbh, String jsmc, Pagination pagination) {

        return null;
    }

    @Override
    public Map<String, Object> getListNotAddedStaff(Map<String, String> map, Pagination pagination) {
        List<PFStaffVO> list = this.pfStaffDao.findListNotAddedStaff(map ,
                pagination.getPageIndex() * pagination.getPageSize() , pagination.getPageSize());
        int count = this.pfStaffDao.findListNotAddedStaffCount(map);
        Map<String , Object> result = new HashMap<>();
        result.put("data" , list);
        result.put("total" , count);
        return result;
    }

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
        staffVO.setCjr(ContextUtil.getLoginUser().getUserId());
        staffVO.setCjsj(new Date());
        staffVO.setJlzt("1");
        staffVO.setRzrq(new Date());
        this.pfStaffDao.save(staffVO);
    }

    @Override
    public void update(PFStaffVO staffVO) {
        this.logger.info("PFStaffServiceImpl update");
        staffVO.setZhxgr(ContextUtil.getLoginUser().getUserId());
        staffVO.setZhxgsj(new Date());
        this.pfStaffDao.update(staffVO);
    }

    @Override
    public void delete(PFStaffVO staffVO) {
        this.logger.info("PFStaffServiceImpl delete");
        this.pfStaffDao.delete(staffVO);
    }

}
