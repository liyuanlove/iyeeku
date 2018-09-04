package com.iyeeku.ext.staff.service;

import com.iyeeku.ext.staff.vo.PFStaffVO;

import java.util.List;

public interface PFStaffService {

    public abstract List<PFStaffVO> findAllStaffInfos();

    public abstract PFStaffVO findStaffByYhbh(String yhbh);

    public abstract void save(PFStaffVO staffVO);

    public abstract void update(PFStaffVO staffVO);

    public abstract void delete(PFStaffVO staffVO);

}
