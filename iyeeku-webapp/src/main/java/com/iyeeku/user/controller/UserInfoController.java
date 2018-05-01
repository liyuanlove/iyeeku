package com.iyeeku.user.controller;


import com.iyeeku.user.service.IUserInfoService;
import com.iyeeku.user.vo.UserInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
public class UserInfoController{

    @Autowired
    private IUserInfoService iUserInfoService;

    public ModelAndView toUserInfos(){
        return null;
    }

    @RequestMapping(value = "/user",method = RequestMethod.GET)
    public ResponseEntity<List<UserInfoVO>> getUserInfosJson(){

        List<UserInfoVO> userInfoVOS = null;
        try{

            userInfoVOS = iUserInfoService.getAllUserInfos(null);
            if(userInfoVOS.isEmpty()){
                System.out.println(" empty !!!");
                return new ResponseEntity<List<UserInfoVO>>(HttpStatus.NO_CONTENT);
            }

        }catch (Exception ex){
            System.out.println("=================================>>>>>>> ");
            ex.printStackTrace();
        }
        return new ResponseEntity<List<UserInfoVO>>(userInfoVOS,HttpStatus.OK);
    }


}
