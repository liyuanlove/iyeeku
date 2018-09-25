package com.iyeeku.ext.auditlog.service;

public interface PFAuditLogService {

    public abstract void saveAuditLog(String bizType, String opType, String opCode, String ipAddr, String logInfo);

    /**
     *
     * @param bizType   业务模块类型
     * @param opType    操作类型
     * @param opCode    登陆用户代码
     * @param ipAddr    登陆用户地址
     * @param bizID     登陆对象标识
     * @param opResult  操作结果
     * @param logInfo   操作信息
     * @param logInfoDetail 操作详细信息
     */
    public abstract void saveAuditLog(String bizType, String opType, String opCode, String ipAddr, String bizID, boolean opResult, String logInfo, String logInfoDetail);

}
