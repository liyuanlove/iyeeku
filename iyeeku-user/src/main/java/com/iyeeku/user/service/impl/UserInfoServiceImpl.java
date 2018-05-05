package com.iyeeku.user.service.impl;

import com.iyeeku.user.dao.IUserInfoDao;
import com.iyeeku.user.service.IUserInfoService;
import com.iyeeku.user.vo.UserInfoVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserInfoServiceImpl implements IUserInfoService {

    private static final Logger logger = LoggerFactory.getLogger(UserInfoServiceImpl.class);

    @Autowired
    private IUserInfoDao iUserInfoDao;

    @Override
    public List<UserInfoVO> getAllUserInfos(UserInfoVO userInfoVO) {
        logger.info("IUserInfoService getAllUserInfos");
        return this.iUserInfoDao.getAllUserInfos(userInfoVO);
    }

    @Override
    public void register(UserInfoVO userInfoVO) {
        logger.info("IUserInfoService register");
        this.iUserInfoDao.save(userInfoVO);

    }


}
