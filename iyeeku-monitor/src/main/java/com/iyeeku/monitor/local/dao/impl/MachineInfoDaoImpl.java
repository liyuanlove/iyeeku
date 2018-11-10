package com.iyeeku.monitor.local.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.monitor.local.dao.IMachineInfoDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class MachineInfoDaoImpl extends BaseDaoImpl implements IMachineInfoDao {

    private Logger logger = LoggerFactory.getLogger(MachineInfoDaoImpl.class);


}
