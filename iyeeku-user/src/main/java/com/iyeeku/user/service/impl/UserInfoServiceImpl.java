package com.iyeeku.user.service.impl;

import com.iyeeku.user.dao.IUserInfoDao;
import com.iyeeku.user.service.IUserInfoService;
import com.iyeeku.user.vo.UserInfoVO;

import java.util.List;

public class UserInfoServiceImpl implements IUserInfoService {

    private IUserInfoDao iUserInfoDao;

    public void setiUserInfoDao(IUserInfoDao iUserInfoDao) {
        this.iUserInfoDao = iUserInfoDao;
    }

    @Override
    public List<UserInfoVO> getAllUserInfos(UserInfoVO userInfoVO) {
        return this.iUserInfoDao.getAllUserInfos(userInfoVO);
    }
}
