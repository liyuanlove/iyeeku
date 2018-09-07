package com.iyeeku.ext.function.dao;

import com.iyeeku.ext.function.vo.PFResUrlVO;

import java.util.List;

public interface PFResUrlDao {

    public abstract List<PFResUrlVO> findAllUrls();

    public abstract void addUrl(PFResUrlVO resUrlVO);

    public abstract void updateUrlByLj(PFResUrlVO resUrlVO);

    public abstract void deleteUrlByLj(PFResUrlVO resUrlVO);

}
