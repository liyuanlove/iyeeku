package com.iyeeku.ext.function.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.ext.function.dao.PFResUrlDao;
import com.iyeeku.ext.function.vo.PFResRelationVO;
import com.iyeeku.ext.function.vo.PFResUrlVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PFResUrlDaoImpl extends BaseDaoImpl implements PFResUrlDao {

    @Override
    public List<PFResUrlVO> findAllUrls() {
        return this.queryAll_myBatis("com.iyeeku.ext.function.dao.PFResUrlDao.findAllUrls");
    }

    @Override
    public List<PFResUrlVO> findNotMenuUrl(Map<String, String> map) {
        return this.queryAll_myBatis("com.iyeeku.ext.function.dao.PFResUrlDao.findNotMenuUrl",map);
    }

    @Override
    public List<PFResUrlVO> findMKRelationUrl(Map<String, String> map) {
        return this.queryAll_myBatis("com.iyeeku.ext.function.dao.PFResUrlDao.findMKRelationUrl" , map);
    }

    @Override
    public void addUrl(PFResUrlVO resUrlVO) {
        this.save_myBatis("com.iyeeku.ext.function.dao.PFResUrlDao.addUrl" , resUrlVO);
    }

    @Override
    public void updateUrlByLj(PFResUrlVO resUrlVO) {
        this.update_myBatis("com.iyeeku.ext.function.dao.PFResUrlDao.updateUrlByLj" , resUrlVO);
    }

    @Override
    public void deleteUrlByLj(PFResUrlVO resUrlVO) {
        this.delete_myBatis("com.iyeeku.ext.function.dao.PFResUrlDao.deleteUrlByLj" , resUrlVO);
    }

    @Override
    public List<PFResUrlVO> findAssignedUrlByYhbh(String yhbh) {
        Map<String , String> param = new HashMap<>();
        param.put("jlzt" , "1");
        param.put("sqzylx" , "LJ");
        param.put("yhbh" , yhbh);
        return this.queryAll_myBatis("com.iyeeku.ext.function.dao.PFResUrlDao.findAssignedUrlByYhbh" , param);
    }

    @Override
    public List<PFResUrlVO> findMenuRelationUrl(PFResRelationVO relationVO) {
        return this.queryAll_myBatis("com.iyeeku.ext.function.dao.PFResUrlDao.findMenuRelationUrl" , relationVO);
    }

    @Override
    public List<PFResUrlVO> findNotMenuRelationUrl(Map<String, Object> paramMap) {
        return this.queryAll_myBatis("com.iyeeku.ext.function.dao.PFResUrlDao.findNotMenuRelationUrl" ,paramMap);
    }

}
