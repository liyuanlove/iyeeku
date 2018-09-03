package com.iyeeku.ext.codetype.service;

import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.codetype.vo.PFCodeTypeVO;

import java.util.Map;

public interface PFCodeTypeService {

    public abstract Map<String ,Object> findAllTypes(PFCodeTypeVO codeTypeVO , Pagination pagination);

    public abstract PFCodeTypeVO findCodeTypeByZj(String zj);

    public abstract void save(PFCodeTypeVO vo);

    public abstract void update(PFCodeTypeVO vo);

    public abstract void delete(PFCodeTypeVO vo);


}
