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

      //  try{
          /*  userInfoVO.setPasswd(MD5Encrypt.md5(userInfoVO.getPasswd()));*/

            this.iUserInfoDao.save(userInfoVO);

            try {

                int i = 1/0; //测试spring事物

            } catch (Exception e) {
                System.out.println("异常444444444444444444444444444444444444444444");
                e.printStackTrace();

                // 经测试 如果自己捕获异常，不进行抛出，spring控制的事物就不会回滚。
                /**
                 *
                 默认spring事务只在发生未被捕获的 runtimeexcetpion时才回滚。
                 spring aop  异常捕获原理：被拦截的方法需显式抛出异常，并不能经任何处理，这样aop代理才能捕获到方法的异常，才能进行回滚，默认情况下aop只捕获runtimeexception的异常，但可以通过

                 配置来捕获特定的异常并回滚
                 换句话说在service的方法中不使用try catch 或者在catch中最后加上throw new runtimeexcetpion（），这样程序异常时才能被aop捕获进而回滚
                 解决方案：
                 方案1.例如service层处理事务，那么service中的方法中不做异常捕获，或者在catch语句中最后增加throw new RuntimeException()语句，以便让aop捕获异常再去回滚，
                        并且在service上层（webservice客户端，view层action）要继续捕获这个异常并处理
                 方案2.在service层方法的catch语句中增加：TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();语句，手动回滚，这样上层就无需去处理异常（现在项目的做法）
                 * **/

            }

            System.out.println("USERID  ==>> "+userInfoVO.getUserid() );

/*        }catch (Exception e){

        }*/

    }


}
