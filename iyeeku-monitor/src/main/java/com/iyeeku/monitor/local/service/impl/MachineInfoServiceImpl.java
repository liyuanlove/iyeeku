package com.iyeeku.monitor.local.service.impl;

import com.iyeeku.monitor.local.dao.IMachineInfoDao;
import com.iyeeku.monitor.local.service.IMachineInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MachineInfoServiceImpl implements IMachineInfoService {

    private Logger logger = LoggerFactory.getLogger(MachineInfoServiceImpl.class);

    @Autowired
    private IMachineInfoDao iMachineInfoDao;



}
