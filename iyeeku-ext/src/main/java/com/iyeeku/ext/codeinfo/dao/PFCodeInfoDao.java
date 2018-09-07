package com.iyeeku.ext.codeinfo.dao;

import com.iyeeku.ext.codeinfo.vo.PFCodeInfoVO;
import com.iyeeku.ext.directory.vo.DirectoryVO;

import java.util.List;
import java.util.Map;

public interface PFCodeInfoDao {

    public abstract void delete(PFCodeInfoVO codeInfoVO);

    public abstract void save(PFCodeInfoVO codeInfoVO);

    public abstract void update(PFCodeInfoVO codeInfoVO);

    public abstract List<PFCodeInfoVO> findAllInfosByCodeType(String codetype);

    public abstract PFCodeInfoVO findCodeInfoByZj(String zj);

    public abstract List<DirectoryVO> findCodeInfosByCodeType(Map<String,String> param);

    public abstract List<Map<String,String>> findCodeInfoCacheDataByCodeType(String codetype);


}
