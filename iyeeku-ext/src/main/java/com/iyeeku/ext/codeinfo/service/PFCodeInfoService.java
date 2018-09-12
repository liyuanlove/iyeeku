package com.iyeeku.ext.codeinfo.service;

import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.codeinfo.vo.PFCodeInfoVO;

import java.util.List;
import java.util.Map;

public interface PFCodeInfoService {

    public abstract void delete(PFCodeInfoVO codeInfoVO);

    public abstract void save(PFCodeInfoVO codeInfoVO);

    public abstract void update(PFCodeInfoVO codeInfoVO);

    public abstract Map<String , Object> findAllInfosByCodeType(String codetype, PFCodeInfoVO codeInfoVO, Pagination pagination);

    public abstract List<PFCodeInfoVO> findAllInfosByCodeType(String codetype);

    public abstract PFCodeInfoVO findCodeInfoByZj(String zj);

}
