package com.iyeeku.controller.user;


import com.iyeeku.user.service.IUserInfoService;
import com.iyeeku.user.vo.BlogInfoVO;
import com.iyeeku.user.vo.UserInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
public class UserInfoController{

    @Autowired
    private IUserInfoService iUserInfoService;

    public ModelAndView toUserInfos(){
        return null;
    }

    @RequestMapping(value = "/user/register" , method = RequestMethod.POST)
    public void register(UserInfoVO vo,HttpServletRequest request){

        String regType = request.getParameter("regType");

        if("email".equals(regType)){
            vo.setEmail(vo.getLoginname());
        }
        this.iUserInfoService.register(vo);
    }

    @RequestMapping(value = "/user/login" , method = RequestMethod.POST)
    public void login(HttpServletRequest request , HttpServletResponse response){

    }

    @RequestMapping(value = "/user/logout" , method = RequestMethod.GET)
    public void logout(){

    }

    @RequestMapping(value = "/user/newblog" , method = RequestMethod.POST)
    public void createBlog(BlogInfoVO blogInfoVO,HttpServletRequest request, HttpServletResponse response){

        this.iUserInfoService.createBlog(blogInfoVO);

    }

    @RequestMapping(value = "/user/modifyProfile" , method = RequestMethod.POST)
    public void modifyProfile(UserInfoVO userInfoVO){

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
