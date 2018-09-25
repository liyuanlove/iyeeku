package com.iyeeku.ext.security.session.impl;

import com.iyeeku.core.context.ContextUtil;
import com.iyeeku.core.security.IyeekuUserInfo;
import com.iyeeku.core.security.session.IyeekuSessionInformation;
import com.iyeeku.core.security.session.service.IyeekuSessionService;
import com.iyeeku.ext.auditlog.service.PFAuditLogService;
import com.iyeeku.ext.common.arcuserauth.service.PFArcUserAuthService;
import com.iyeeku.ext.common.arcuserauth.vo.PFArcUserAuthVO;
import com.iyeeku.ext.online.service.PFOnlineService;
import com.iyeeku.ext.online.vo.PFOnlineVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class IyeekuSessionServiceImpl implements IyeekuSessionService {

    private Logger logger = LoggerFactory.getLogger(IyeekuSessionServiceImpl.class);
    private PFAuditLogService pfAuditLogService;
    private PFOnlineService pfOnlineService;
    private PFArcUserAuthService pfArcUserAuthService;

    @Override
    public void createSessionInfo(String sessionId, IyeekuUserInfo userInfo) {
        this.logger.info("session 创建！\nsessionId : {}" , sessionId);
        this.logger.info("{}已登录" , userInfo.getUserName());

        Timestamp dlsj = new Timestamp(System.currentTimeMillis());

        PFOnlineVO onlineVO = new PFOnlineVO();
        onlineVO.setYhbh(userInfo.getUserId());
        onlineVO.setYhzxzt("1");
        onlineVO.setYhhhbh(sessionId);
        onlineVO.setYhdlsj(dlsj);
        //onlineVO.setZzjglj(userInfo.getUserPath());  //UnitPath
        onlineVO.setYhdljqdz(userInfo.getUserIP());
        this.pfOnlineService.saveOnline(onlineVO);


        PFArcUserAuthVO userAuthVO = this.pfArcUserAuthService.findUserByYhbh(userInfo.getUserId());
        String scdlip = userAuthVO.getZhycdlip();
        Date scdlsj = userAuthVO.getZhycdlsj();
        userAuthVO.setScdlip(scdlip);
        userAuthVO.setScdlsj(scdlsj);
        userAuthVO.setZhycdlip(userInfo.getUserIP());
        userAuthVO.setZhycdlsj(dlsj);
        userAuthVO.setYhzxzt("1");
        this.pfArcUserAuthService.update(userAuthVO);

        this.pfAuditLogService.saveAuditLog("session" , "01" , userInfo.getUserId() ,
                userInfo.getUserIP() , userInfo.getUserId() , true , "用户登陆" , "");

    }

    @Override
    public List<IyeekuSessionInformation> updAndGetAllSessions(IyeekuUserInfo userInfo) {

        if (userInfo == null){
            userInfo = ContextUtil.getLoginUser();
            if (userInfo == null){
                return null;
            }
        }

        List<IyeekuSessionInformation> sessionInfoList = new ArrayList<>();
        IyeekuSessionInformation sessionInfo = null;

        List<PFOnlineVO> list = this.pfOnlineService.getOnlineUsersByYhbh(userInfo.getUserId());
        for (PFOnlineVO onlineVO : list){
            sessionInfo = new IyeekuSessionInformation(userInfo , onlineVO.getYhhhbh() , onlineVO.getYhdlsj());

            if ("0".equals(onlineVO.getHhsfgq())){
                sessionInfo.expireNow();
            }
            sessionInfoList.add(sessionInfo);
        }

        return sessionInfoList;
    }

    @Override
    public IyeekuSessionInformation updAndGetSessionInformation(String sessionId) {
        IyeekuUserInfo userInfo = ContextUtil.getLoginUser();
        if (userInfo == null) {
            return null;
        }

        PFOnlineVO onlineVO = this.pfOnlineService.getOnlineVOBySessionId(sessionId);
        if (onlineVO == null){
            return null;
        }

        IyeekuSessionInformation sessionInfo = new IyeekuSessionInformation(
                userInfo , onlineVO.getYhhhbh() , onlineVO.getYhdlsj());

        if ("0".equals(onlineVO.getHhsfgq())){
            sessionInfo.expireNow();
        }

        return sessionInfo;
    }

    @Override
    public void removeSessionInformation(String sessionId) {
        IyeekuUserInfo userInfo = ContextUtil.getLoginUser();

        this.logger.info("session 销毁！\nsessionId : {}" , sessionId);

        this.pfOnlineService.deleteOnlineBySessionId(sessionId);

        if (userInfo != null){

            PFArcUserAuthVO userAuthVO = this.pfArcUserAuthService.findUserByYhbh(userInfo.getUserId());
            userAuthVO.setZhycdlsj(new Timestamp(System.currentTimeMillis()));
            userAuthVO.setYhzxzt("0");
            this.pfArcUserAuthService.update(userAuthVO);

            this.pfAuditLogService.saveAuditLog("session" , "02" , userInfo.getUserId() ,
                    userInfo.getUserIP() , userInfo.getUserId() , true , "用户退出" , "");

        }
    }

    @Override
    public int getAllowedMaxSession() {
        return 99999;
    }

    @Override
    public boolean isRejectLoginMaxSession() {
        return false;
    }

    @Override
    public void updateSessionToExpired(String paramString) {

    }

    @Override
    public void deleteSessionInfo() {

    }

    @Override
    public boolean existSessionInformation(String paramString) {
        return false;
    }

}
