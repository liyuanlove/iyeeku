package com.iyeeku.ext.codeinfo.service;

import com.iyeeku.ext.codeinfo.vo.PFCodeInfoVO;

import java.util.List;

public interface PFCodeInfoService {

    public abstract void delete(PFCodeInfoVO codeInfoVO);

    public abstract void save(PFCodeInfoVO codeInfoVO);

    public abstract void update(PFCodeInfoVO codeInfoVO);

    public abstract List<PFCodeInfoVO> findAllInfosByCodeType(String codetype);

    public abstract PFCodeInfoVO findCodeInfoByZj(String zj);

}
