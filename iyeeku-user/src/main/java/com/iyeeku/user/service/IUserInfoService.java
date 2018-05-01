package com.iyeeku.user.service;

import com.iyeeku.user.vo.UserInfoVO;

import java.util.List;

public interface IUserInfoService {

    public List<UserInfoVO> getAllUserInfos(UserInfoVO userInfoVO);

    public void register(UserInfoVO userInfoVO);

}
