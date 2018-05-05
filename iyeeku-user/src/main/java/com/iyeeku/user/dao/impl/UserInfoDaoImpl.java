package com.iyeeku.user.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.user.dao.IUserInfoDao;
import com.iyeeku.user.vo.UserInfoVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserInfoDaoImpl extends BaseDaoImpl implements IUserInfoDao {

    private static final Logger logger = LoggerFactory.getLogger(UserInfoDaoImpl.class);

    @Override
    public List<UserInfoVO> getAllUserInfos(UserInfoVO userInfoVO) {
        logger.info("UserInfoDao getAllUserInfos");
        return this.queryAll_myBatis("com.iyeeku.user.dao.IUserInfoDao.getAllUserInfos",userInfoVO);
    }

    @Override
    public Integer getAllUserInfosCount(UserInfoVO userInfoVO) {
        logger.info("UserInfoDao getAllUserInfosCount");
        return this.queryOne_myBatis("com.iyeeku.user.dao.IUserInfoDao.getAllUserInfosCount",userInfoVO);
    }

    @Override
    public void save(UserInfoVO userInfoVO) {
        logger.info("UserInfoDao save");
        this.save_myBatis("com.iyeeku.user.dao.IUserInfoDao.save",userInfoVO);
        System.out.println(userInfoVO.getUserid());
    }



}
