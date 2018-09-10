package com.iyeeku.ext.function.service;

import com.iyeeku.ext.function.vo.PFResUrlVO;

import java.util.List;
import java.util.Map;

public interface PFResUrlService {

    public abstract void reloadAllUrlData(Map<String ,String> initUrlData);

    public abstract List<PFResUrlVO> findNotMenuUrl(String key);
}
