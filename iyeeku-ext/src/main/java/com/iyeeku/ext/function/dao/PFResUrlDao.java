package com.iyeeku.ext.function.dao;

import com.iyeeku.ext.function.vo.PFResRelationVO;
import com.iyeeku.ext.function.vo.PFResUrlVO;

import java.util.List;
import java.util.Map;

public interface PFResUrlDao {

    public abstract List<PFResUrlVO> findAllUrls();

    public abstract List<PFResUrlVO> findNotMenuUrl(Map<String,String> map);

    public abstract List<PFResUrlVO> findMKRelationUrl(Map<String,String> map);

    public abstract void addUrl(PFResUrlVO resUrlVO);

    public abstract void updateUrlByLj(PFResUrlVO resUrlVO);

    public abstract void deleteUrlByLj(PFResUrlVO resUrlVO);

    public abstract List<PFResUrlVO> findAssignedUrlByYhbh(String paramString);

    public abstract List<PFResUrlVO> findMenuRelationUrl(PFResRelationVO relationVO);

    public abstract List<PFResUrlVO> findNotMenuRelationUrl(Map<String,Object> paramMap);

}
