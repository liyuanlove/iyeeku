package com.iyeeku.ext.staff.dao;

import com.iyeeku.ext.staff.vo.PFStaffVO;

import java.util.List;

public interface PFStaffDao {

    public abstract List<PFStaffVO> findAllStaffInfos();

    public abstract PFStaffVO findStaffByYhbh(String yhbh);

    public abstract void save(PFStaffVO staffVO);

    public abstract void update(PFStaffVO staffVO);

    public abstract void delete(PFStaffVO staffVO);
}
