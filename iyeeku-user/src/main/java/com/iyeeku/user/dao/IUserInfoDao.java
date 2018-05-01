package com.iyeeku.user.dao;

import com.iyeeku.user.vo.UserInfoVO;

import java.util.List;

public interface IUserInfoDao {

    public List<UserInfoVO> getAllUserInfos(UserInfoVO userInfoVO);

    public Integer getAllUserInfosCount(UserInfoVO userInfoVO);

}
