package com.iyeeku.ext.security.dao.impl;

import com.iyeeku.core.orm.impl.BaseDaoImpl;
import com.iyeeku.core.security.IyeekuUserInfo;
import com.iyeeku.core.security.dao.IyeekuUserDetailsDao;
import com.iyeeku.ext.common.util.IyeekuExtConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.util.StringUtils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class IyeekuExtUserDetailsDaoImpl extends BaseDaoImpl implements IyeekuUserDetailsDao {

    private Logger logger = LoggerFactory.getLogger(IyeekuExtUserDetailsDaoImpl.class);

    @Override
    public IyeekuUserInfo loadUserDetailsByLoginName(String loginName, String loginType) throws UsernameNotFoundException {
        Map<String , String> params = new HashMap<>();
        List authorities = new ArrayList();

        if (StringUtils.isEmpty(loginName)){
            throw new UsernameNotFoundException("用户名不能为空！");
        }
        try {
            loginName = URLDecoder.decode(loginName , "UTF-8");
        }catch (UnsupportedEncodingException e){
            this.logger.debug("中文用户名转换错误" ,e);
        }

        if ("NotesID".equals(loginType)){
            params.put("NOTESID" , loginName);
        }else if ("YHBH".equals(loginType)){
            params.put("YHBH" , loginName);
        }else if ("StaffCode".equals(loginType)){
            params.put("YHDLM" , loginName);
        }else {
            this.logger.debug("使用了非默认的登陆方式");
            params.put("loginType" , loginType);
            params.put("loginName" , loginName);
        }

        List<Map> list = this.queryAll_myBatis("com.iyeeku.core.security.findStaffRole" , params);

        Map firstRecord = null;

        boolean enabled = true;
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;

        Object yhbh = "";

        if ((list != null) && (list.size() > 0)){
            if (firstRecord == null){
                firstRecord = (Map) list.get(0);
                for (int i = 0 , l = list.size() ; i < l ; i++){
                    if ( !"0".equals(((Map)list.get(i)).get("ZT")) ){
                        firstRecord = (Map)list.get(i);
                        break;
                    }
                }
                yhbh = firstRecord.get("YHBH");

                if ("0".equals(firstRecord.get("ZT"))){
                    enabled = false;
                }

                Timestamp now = new Timestamp(System.currentTimeMillis());
                Timestamp acc_exp_time = (Timestamp)firstRecord.get("ZHGQSJ");
                if ((acc_exp_time != null) && (now.after(acc_exp_time))){
                    accountNonExpired = false;
                }

                if ("2".equals(firstRecord.get("ZT"))){
                    accountNonLocked = false;
                }
            }

            // 这里授予用户“公共权限角色”
            GrantedAuthority role_anonymous = new SimpleGrantedAuthority(IyeekuExtConstants.ROLE_ANONYMOUS_CODE);
            authorities.add(role_anonymous);

            for (Map record : list){
                System.out.println(record);
                if ( (yhbh.equals(record.get("YHBH"))) && ("1".equals(record.get("RS_JLZT"))) &&
                        ("1".equals(record.get("R_JLZT"))) &&
                        (!StringUtils.isEmpty(record.get("JSBH"))) &&
                        ("1".equals(record.get("JSZT")))){
                    GrantedAuthority oneAuthority = new SimpleGrantedAuthority((String) record.get("JSBH"));
                    authorities.add(oneAuthority); //将用户所拥有的角色编号添加到 authorities 中
                }
            }
        }

        IyeekuUserInfo userInfo = null;
        if (firstRecord != null){
            String loginPwd = (String) firstRecord.get("DLMM");
            if (StringUtils.isEmpty(loginPwd)){
                //throw new Exception("密码不能为空");
            }

            userInfo = new IyeekuUserInfo(
                    (String) firstRecord.get("YHBH"),
                    (String) firstRecord.get("YHDLM"),
                    (String) firstRecord.get("YHMC"),
                    (String) firstRecord.get("NOTESID"),
                    (String) firstRecord.get("ZJ"),
                    (String) firstRecord.get("XZCXLJ"),
                    (String) firstRecord.get("JGMC"),
                    loginPwd,
                    (String) firstRecord.get("MMYZ"),
                    enabled,
                    accountNonExpired,
                    credentialsNonExpired,
                    accountNonLocked,
                authorities);
        }
        return userInfo;
    }

}
