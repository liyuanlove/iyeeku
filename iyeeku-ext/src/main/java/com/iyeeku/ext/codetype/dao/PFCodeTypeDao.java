package com.iyeeku.ext.codetype.dao;

import com.iyeeku.ext.codetype.vo.PFCodeTypeVO;

import java.util.List;

public interface PFCodeTypeDao {

    public abstract List<PFCodeTypeVO> findAllTypes();

    public abstract List<PFCodeTypeVO> findAllTypes(PFCodeTypeVO vo , int offSet , int pageSize);

    public abstract int findAllTypesCount(PFCodeTypeVO vo);

    public abstract PFCodeTypeVO findCodeTypeByZj(String zj);

    public abstract void save(PFCodeTypeVO vo);

    public abstract void update(PFCodeTypeVO vo);

    public abstract void delete(PFCodeTypeVO vo);

}
