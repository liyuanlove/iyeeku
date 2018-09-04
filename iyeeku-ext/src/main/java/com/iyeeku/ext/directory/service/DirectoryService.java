package com.iyeeku.ext.directory.service;

import com.iyeeku.ext.directory.vo.DirectoryVO;

import java.util.List;

public interface DirectoryService {

    public abstract List<DirectoryVO> findInfoListByCodeType(String codetype , String sjsxsyOrder);

}
