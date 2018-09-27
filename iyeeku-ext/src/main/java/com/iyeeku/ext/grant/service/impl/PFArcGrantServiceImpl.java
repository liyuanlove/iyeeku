package com.iyeeku.ext.grant.service.impl;

import com.iyeeku.ext.grant.dao.PFArcGrantDao;
import com.iyeeku.ext.grant.service.PFArcGrantService;

public class PFArcGrantServiceImpl implements PFArcGrantService {

    private PFArcGrantDao pfArcGrantDao;


    public void setPfArcGrantDao(PFArcGrantDao pfArcGrantDao) {
        this.pfArcGrantDao = pfArcGrantDao;
    }

}
