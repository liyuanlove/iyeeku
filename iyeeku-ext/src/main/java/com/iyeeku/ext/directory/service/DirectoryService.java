package com.iyeeku.ext.directory.service;

import com.iyeeku.ext.directory.vo.DirectoryVO;

import java.util.List;
import java.util.Map;

public interface DirectoryService {

    public abstract List<DirectoryVO> findInfoListByCodeType(String codetype , String sjsxsyOrder);

    public abstract List<DirectoryVO> refreshDictCacheByCodeType(String codetype , String sjsxsyOrder);

    public abstract void refreshDictCacheByCodeType1(String codetype);

    public abstract void refreshDictCache();

    public abstract List<Map<String,String>> findInfoListByCodeType1(String codetype);

}
