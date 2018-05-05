package com.iyeeku.user.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.user.dao.IUserInfoDao;
import com.iyeeku.user.vo.UserInfoVO;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserInfoDaoImpl extends BaseDaoImpl implements IUserInfoDao {

    private static final Logger LOGGER = Logger.getLogger(UserInfoDaoImpl.class);

    @Override
    public List<UserInfoVO> getAllUserInfos(UserInfoVO userInfoVO) {
        this.LOGGER.info("UserInfoDao getAllUserInfos");
        return this.queryAll_myBatis("com.iyeeku.user.dao.IUserInfoDao.getAllUserInfos",userInfoVO);
    }

    @Override
    public Integer getAllUserInfosCount(UserInfoVO userInfoVO) {
        this.LOGGER.info("UserInfoDao getAllUserInfosCount");
        return this.queryOne_myBatis("com.iyeeku.user.dao.IUserInfoDao.getAllUserInfosCount",userInfoVO);
    }

    @Override
    public void save(UserInfoVO userInfoVO) {
        this.save_myBatis("com.iyeeku.user.dao.IUserInfoDao.save",userInfoVO);
    }



}
