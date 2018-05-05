package com.iyeeku.user.service.impl;

import com.iyeeku.user.dao.IUserInfoDao;
import com.iyeeku.user.service.IUserInfoService;
import com.iyeeku.user.vo.UserInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserInfoServiceImpl implements IUserInfoService {

    @Autowired
    private IUserInfoDao iUserInfoDao;

    public void setiUserInfoDao(IUserInfoDao iUserInfoDao) {
        this.iUserInfoDao = iUserInfoDao;
    }

    @Override
    public List<UserInfoVO> getAllUserInfos(UserInfoVO userInfoVO) {
        return this.iUserInfoDao.getAllUserInfos(userInfoVO);
    }

    @Override
    public void register(UserInfoVO userInfoVO) {

        this.iUserInfoDao.save(userInfoVO);

    }


}
