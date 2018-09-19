package com.iyeeku.ext.common.web;

import com.iyeeku.core.context.ContextUtil;
import com.iyeeku.core.security.IyeekuUserInfo;
import com.iyeeku.core.util.JsonUtil;
import com.iyeeku.ext.common.util.IyeekuExtConstants;
import com.iyeeku.ext.function.service.PFResMenuService;
import com.iyeeku.ext.function.vo.PFResMenuVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

    @Autowired
    private PFResMenuService pfResMenuService;

    @RequestMapping(value = "sessionTimeout" , method = RequestMethod.GET , name = "session超时页面")
    public ModelAndView sessionTimeout(){
        return new ModelAndView("sessionTimeout");
    }

    @RequestMapping(value = "login" , method = RequestMethod.GET , name = "登陆页面")
    public ModelAndView login(){
        return new ModelAndView("login");
    }


    @RequestMapping(value = "main" , method = RequestMethod.GET , name = "主页面")
    public ModelAndView main(){

        ModelAndView model = new ModelAndView("index1");

        IyeekuUserInfo userInfo = ContextUtil.getLoginUser();
        //获取用户所拥有的角色编号列表
        List<String> roleList = new ArrayList<>();
        if (userInfo == null){
            roleList.add(IyeekuExtConstants.ROLE_ANONYMOUS_CODE);
        }else{
            roleList = userInfo.getRoleList();
        }

        Map<String , Object> param = new HashMap<>();
        param.put("list" , roleList);
        List list = this.pfResMenuService.findGrantedMenu(param);  //查询角色授权的菜单信息
        String menuJson = JsonUtil.bean2Json(getMenu(list));
        model.addObject("menuJson" , menuJson);

        System.out.println(menuJson);

        return model;
    }


    private List getMenu(List<PFResMenuVO> list){
        List retList = new ArrayList();
        if (list != null && list.size() > 0) {
            for (PFResMenuVO menuVO : list) {
                if (("1".equals(menuVO.getCdsfkj())) && (IyeekuExtConstants.DEFAULT_MENUTREE_ROOT.equals(menuVO.getSjcdbh()))) {
                    Map map = findSubMenu(menuVO , list);
                    retList.add(map);
                }
            }
        }
        return retList;
    }

    public Map<String , Object> findSubMenu(PFResMenuVO menu , List<PFResMenuVO> menuList){
        Map retMap = new HashMap();
        List subList = new ArrayList();
        String pid = menu.getCdbh();
        for (PFResMenuVO menuVO : menuList){
            if (pid.equals(menuVO.getSjcdbh())){
                subList.add(findSubMenu(menuVO , menuList));
            }
        }
        retMap.put("id" , menu.getCdbh());
        retMap.put("text" , menu.getCdmc());
        retMap.put("cddkfs" , menu.getCddkfs());
        retMap.put("url" , menu.getCdurl());
        retMap.put("iconCls" , menu.getCdtp());

        if ( ("1".equals(menu.getCdsfkj())) && ("0".equals(menu.getCdsfky())) ){
            retMap.put("enabled" , Boolean.valueOf(false));
            retMap.put("id" , "noEnabledItemCls");
        }

        if (subList.size() > 0){
            retMap.put("children" , subList);
        }

        return retMap;

    }


}
