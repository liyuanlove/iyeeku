package com.iyeeku.ext.staff.service;

import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.staff.vo.PFStaffVO;

import java.io.OutputStream;
import java.util.List;
import java.util.Map;

public interface PFStaffService {

    public abstract Map<String,Object> findAllStaffs(PFStaffVO staffVO, Pagination pagination);

    public abstract Map<String, Object> getListNotAddedStaff(Map<String, String> map, Pagination pagination);

    public abstract Map<String , Object> getListAddedRole(String yhbh ,String jsmc , Pagination pagination);

    public abstract Map<String,Object> getListNotAddedRole(String yhbh , String jsmc , Pagination pagination);

    public abstract List<PFStaffVO> findAllStaffInfos();

    public abstract PFStaffVO findStaffByYhbh(String yhbh);

    public abstract void save(PFStaffVO staffVO);

    public abstract void update(PFStaffVO staffVO);

    public abstract void delete(PFStaffVO staffVO);

    public abstract void exportStaffExcel(OutputStream out);

}
