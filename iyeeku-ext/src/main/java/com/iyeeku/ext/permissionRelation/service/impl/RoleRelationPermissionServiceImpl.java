package com.iyeeku.ext.permissionRelation.service.impl;

import com.iyeeku.core.util.UUIDGenerator;
import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.commonPermission.service.CommonPermissionService;
import com.iyeeku.ext.grant.vo.PFArcGrantVO;
import com.iyeeku.ext.permissionRelation.service.RoleRelationPermissionService;
import com.iyeeku.ext.role.dao.PFRoleDao;
import com.iyeeku.ext.role.vo.PFRoleVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RoleRelationPermissionServiceImpl implements RoleRelationPermissionService{

    @Autowired
    private PFRoleDao pfRoleDao;
    @Autowired
    private CommonPermissionService commonPermissionService;

    @Override
    public Map<String, Object> listRole(String jsmc, Pagination pagination) {
        PFRoleVO roleVO = new PFRoleVO();
        roleVO.setJsmc(jsmc);
        List<PFRoleVO> list = this.pfRoleDao.findAllRoles(roleVO ,
                pagination.getPageIndex() * pagination.getPageSize() , pagination.getPageSize());
        int count = this.pfRoleDao.findAllInfosCount(roleVO);
        Map<String , Object> rtn = new HashMap<>();
        rtn.put("data" , list);
        rtn.put("total" , count);
        return rtn;
    }

    @Override
    public void addRoleMenuPer(String sqdxbh, String[] sqzybms, String[] param2, String string1, String string2, String sqzylx) {

        PFArcGrantVO arcGrantVO = new PFArcGrantVO();
        for (String sqzybm : sqzybms){
            if (!StringUtils.isEmpty(sqzybm)){
                arcGrantVO.setSqdxbh(sqdxbh);
                arcGrantVO.setSqzybm(sqzybm);
                arcGrantVO.setSqzylx(sqzylx);
                arcGrantVO.setJlzt("1");
                if (true){ //判断是否存在

                }else{
                    arcGrantVO.setSqbzj(UUIDGenerator.generate(""));

                }

            }
        }

    }
}
