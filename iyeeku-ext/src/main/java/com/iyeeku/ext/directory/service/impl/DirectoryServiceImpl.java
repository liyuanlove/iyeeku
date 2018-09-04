package com.iyeeku.ext.directory.service.impl;

import com.iyeeku.ext.codeinfo.dao.PFCodeInfoDao;
import com.iyeeku.ext.directory.service.DirectoryService;
import com.iyeeku.ext.directory.vo.DirectoryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DirectoryServiceImpl implements DirectoryService {

    @Autowired
    private PFCodeInfoDao pfCodeInfoDao;

    @Override
    public List<DirectoryVO> findInfoListByCodeType(String codetype , String sjsxsyOrder) {

        Map<String,String> param = new HashMap<>();
        param.put("codetype",codetype);

        if(null == sjsxsyOrder || "".equals(sjsxsyOrder)){
            param.put("sjsxsyOrder","TRUE");
        }else{
            param.put("sjsxsyOrder","FALSE");
        }

        return this.pfCodeInfoDao.findCodeInfosByCodeType(param);
    }


}
