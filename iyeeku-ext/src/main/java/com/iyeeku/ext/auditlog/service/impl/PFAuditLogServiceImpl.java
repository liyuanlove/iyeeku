package com.iyeeku.ext.auditlog.service.impl;

import com.iyeeku.core.context.ContextUtil;
import com.iyeeku.core.util.UUIDGenerator;
import com.iyeeku.ext.auditlog.dao.PFAuditLogDao;
import com.iyeeku.ext.auditlog.service.PFAuditLogService;
import com.iyeeku.ext.auditlog.vo.PFAuditLogVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import java.util.Arrays;
import java.util.Date;

public class PFAuditLogServiceImpl implements PFAuditLogService {

    private Logger logger = LoggerFactory.getLogger(PFAuditLogServiceImpl.class);

    private PFAuditLogDao pfAuditLogDao;

    @Override
    public void saveAuditLog(String bizType, String opType, String opCode, String ipAddr, String logInfo) {
        saveAuditLog(bizType , opType , opCode , ipAddr , "" , true , logInfo , "");
    }

    @Override
    public void saveAuditLog(String bizType, String opType, String opCode, String ipAddr, String bizID, boolean opResult, String logInfo, String logInfoDetail) {
        this.logger.debug("业务模块类型：{}，操作类型：{}，登陆用户代码：{}，登陆用户地址：{}，登陆对象标识：{}，操作结果：{}，操作信息：{}" , new Object[] {
                bizType, opType, opCode, ipAddr, bizID, opResult , logInfo});
        PlatformTransactionManager txManager = null;
        TransactionStatus status = null;
        try {

            this.logger.debug("审计日志开关状态（true表示开，false表示关）：{}");

            PFAuditLogVO logVO = new PFAuditLogVO();
            logVO.setRzbh(UUIDGenerator.generate(""));
            logVO.setYwlxbm(bizType);
            logVO.setCzbm(opType);
            logVO.setCzkhjqip(ipAddr);
            logVO.setRzjlsj(new Date());
            logVO.setYwdxbz(bizID);
            if (opResult){
                logVO.setCzjg("1");
            }else{
                logVO.setCzjg("0");
            }
            if (logInfo != null && (logInfo.getBytes().length > 255)){
                logInfo = new String(Arrays.copyOf(logInfo.getBytes() , 250));
            }
            logVO.setCzrzxx(logInfo);
            if (logInfoDetail != null && (logInfoDetail.getBytes().length > 4000)){
                logInfoDetail = new String(Arrays.copyOf(logInfoDetail.getBytes() , 4000));
            }
            logVO.setRzxxxx(logInfoDetail);
            logVO.setRzjb("");
            logVO.setJlzt("1");
            logVO.setYhbh(opCode);

            txManager = (PlatformTransactionManager)ContextUtil.getBean("transactionManager");
            DefaultTransactionDefinition def = new DefaultTransactionDefinition();
            def.setName("SaveAuditLog");
            def.setPropagationBehavior(3);
            status = txManager.getTransaction(def);
            this.pfAuditLogDao.save(logVO);
            txManager.commit(status);
            logInfo = null;
            logInfoDetail = null;

        }catch (Exception e){
            this.logger.error("Error Saving Log:" , e);
        }
    }


    public PFAuditLogDao getPfAuditLogDao() {
        return pfAuditLogDao;
    }

    public void setPfAuditLogDao(PFAuditLogDao pfAuditLogDao) {
        this.pfAuditLogDao = pfAuditLogDao;
    }
}
