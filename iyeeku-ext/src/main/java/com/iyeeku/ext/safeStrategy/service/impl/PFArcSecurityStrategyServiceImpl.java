package com.iyeeku.ext.safeStrategy.service.impl;

import com.iyeeku.ext.safeStrategy.dao.PFArcSecurityStrategyDao;
import com.iyeeku.ext.safeStrategy.service.PFArcSecurityStrategyService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PFArcSecurityStrategyServiceImpl implements PFArcSecurityStrategyService {

    private Logger logger = LoggerFactory.getLogger(PFArcSecurityStrategyServiceImpl.class);

    private PFArcSecurityStrategyDao pfArcSecurityStrategyDao;

    public void setPfArcSecurityStrategyDao(PFArcSecurityStrategyDao pfArcSecurityStrategyDao) {
        this.pfArcSecurityStrategyDao = pfArcSecurityStrategyDao;
    }


}
