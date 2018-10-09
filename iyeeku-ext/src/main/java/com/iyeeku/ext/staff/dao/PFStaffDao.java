package com.iyeeku.ext.staff.dao;

import com.iyeeku.ext.staff.vo.PFStaffVO;

import java.util.List;
import java.util.Map;

public interface PFStaffDao {

    public abstract List<PFStaffVO> findAllStaffs(PFStaffVO staffVO , int offSet , int pageSize);

    public abstract int findAllStaffsCount(PFStaffVO staffVO);

    public abstract List<PFStaffVO> findListNotAddedStaff(Map<String,String> map , int offSet , int pageSize);

    public abstract int findListNotAddedStaffCount(Map<String,String> map);

    public abstract List<PFStaffVO> findAllStaffInfos();

    public abstract PFStaffVO findStaffByYhbh(String yhbh);

    public abstract void save(PFStaffVO staffVO);

    public abstract void update(PFStaffVO staffVO);

    public abstract void delete(PFStaffVO staffVO);

    public abstract List<Map> getStaffExportData();
}
