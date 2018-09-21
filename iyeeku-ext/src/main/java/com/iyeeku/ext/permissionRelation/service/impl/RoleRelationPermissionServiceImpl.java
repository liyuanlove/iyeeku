package com.iyeeku.ext.permissionRelation.service.impl;

import com.iyeeku.core.util.StringUtil;
import com.iyeeku.core.util.UUIDGenerator;
import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.commonPermission.service.CommonPermissionService;
import com.iyeeku.ext.function.service.PFResUrlService;
import com.iyeeku.ext.function.vo.PFResUrlVO;
import com.iyeeku.ext.grant.vo.PFArcGrantVO;
import com.iyeeku.ext.permissionRelation.dao.RoleRelationPermissionDao;
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
    private RoleRelationPermissionDao roleRelationPermissionDao;
    @Autowired
    private PFRoleDao pfRoleDao;
    @Autowired
    private CommonPermissionService commonPermissionService;
    @Autowired
    private PFResUrlService pfResUrlService;

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
    public List<PFResUrlVO> findRoleMenunodeUrl(String cdbh, String sqdxbh, String gnssmk) {
        Map<String,String> map = new HashMap<>();
        map.put("sqdxbh" , sqdxbh);
        map.put("jlzt" , "1");
        map.put("gnssmk" , StringUtil.formatDbNoEscapeLeftLikeValue(gnssmk));
        map.put("cdbh" , cdbh);
        return roleRelationPermissionDao.findRoleMenunodeUrl(map);
    }

    @Override
    public List<PFResUrlVO> findSsmkUrl(String key, String cdbh, String sqdxbh, String gnssmk) {
        Map<String,String> map = new HashMap<>();
        map.put("sqdxbh" , sqdxbh);
        map.put("gnssmk" , StringUtil.formatDbNoEscapeLeftLikeValue(gnssmk));
        map.put("cdbh" , cdbh);
        if (!StringUtil.isEmpty(key)){
            map.put("key" , StringUtil.formatDbNoEscapeLikeValue(key));
        }

        return this.roleRelationPermissionDao.findSsmkUrl(map);
    }

    @Override
    public void addRoleMenuPer(String sqdxbh, String[] sqzybms, String[] gnssmks, String delCdbh, String delCdurl, String sqzylx) {

        PFArcGrantVO arcGrantVO = new PFArcGrantVO();
        for (String sqzybm : sqzybms){
            if (!StringUtils.isEmpty(sqzybm)){
                arcGrantVO.setSqdxbh(sqdxbh);
                arcGrantVO.setSqzybm(sqzybm);
                arcGrantVO.setSqzylx(sqzylx);
                arcGrantVO.setJlzt("1");
                if (this.commonPermissionService.isExist(arcGrantVO)){ //判断是否存在
                    this.commonPermissionService.updateMenuOrUrlRolePer(arcGrantVO);
                }else{
                    arcGrantVO.setSqbzj(UUIDGenerator.generate(""));
                    this.commonPermissionService.addCommonPer(arcGrantVO);
                }
            }
        }

        // 为角色新增菜单上关联的 url 权限
        addRoleMenuUrlPer(sqdxbh , gnssmks);

        if (!StringUtils.isEmpty(delCdbh)){
            String[] delSqzybms = delCdbh.split(",");
            String[] delGnssmks = delCdurl.split(",");
            delRoleMenuPer(sqdxbh , delSqzybms , delGnssmks , sqzylx);
        }

    }

    public void addRoleMenuUrlPer(String sqdxbh ,String[] gnssmks){
        PFArcGrantVO arcGrantVO = new PFArcGrantVO();
        String sqzylx = "LJ";
        arcGrantVO.setSqdxbh(sqdxbh);
        arcGrantVO.setSqzylx(sqzylx);
        for (String gnssmk : gnssmks){
            if (!StringUtil.isEmpty(gnssmk)){
                if ("other".equals(gnssmk)){
                    //TODO
                }else{

                    String ssmkLj = StringUtil.getSSMK(gnssmk);
                    System.out.println("ssmkLj One ==>> " + ssmkLj);
                    ssmkLj = ssmkLj + "**/*";  //   **/*.*
                    System.out.println("ssmkLj Two ==>> " + ssmkLj);

                    Map<String,String> param = new HashMap<>();
                    param.put("ssmkLj" , StringUtil.formatDbNoEscapeLikeValue(ssmkLj));
                    param.put("cdurl" , gnssmk);
                    param.put("zdxlx" , "CD");
                    List<PFResUrlVO> list = this.pfResUrlService.findMKRalationUrl(param);
                    for (PFResUrlVO urlVO : list){
                        arcGrantVO.setSqzybm(urlVO.getUrlbh());
                        if (this.commonPermissionService.isExist(arcGrantVO)){
                            this.commonPermissionService.updateMenuOrUrlRolePer(arcGrantVO);
                        }else{
                            arcGrantVO.setSqbzj(UUIDGenerator.generate(""));
                            arcGrantVO.setJlzt("1");
                            this.commonPermissionService.addCommonPer(arcGrantVO);
                        }
                    }
                }
            }
        }

    }


    public void delRoleMenuPer(String sqdxbh, String[] sqzybms , String[] gnssmks , String sqzylx){
        PFArcGrantVO arcGrantVO = new PFArcGrantVO();
        arcGrantVO.setSqdxbh(sqdxbh);
        arcGrantVO.setSqzylx(sqzylx);
        for (String sqzybm : sqzybms){
            arcGrantVO.setSqzybm(sqzybm);
            this.commonPermissionService.delMenuPer(arcGrantVO);
        }
        // 移除 角色菜单（模块）上关联的 url 权限
        delRoleMenuUrlPer(sqdxbh , gnssmks);
    }

    public void delRoleMenuUrlPer(String sqdxbh , String[] gnssmks){
        Map<String,String> param = new HashMap<>();
        param.put("sqdxbh" , sqdxbh);
        for (String gnssmk : gnssmks){
            if (!StringUtil.isEmpty(gnssmk)){
                List sqzybms = null;
                List<PFArcGrantVO> list = null;
                if ("other".equals(gnssmk)){
                    //TODO

                }else{
                    param.put("cdurl" , gnssmk);
                    param.put("gnssmk" , StringUtil.formatDbNoEscapeLeftLikeValue(StringUtil.getSSMK(gnssmk)));
                    list = this.commonPermissionService.findSSmkGrantInfo(param); //获取某一模块的授权信息
                }
                PFArcGrantVO arcGrantVO = new PFArcGrantVO();
                arcGrantVO.setSqdxbh(sqdxbh);
                for (PFArcGrantVO vo : list){
                    arcGrantVO.setSqzybm(vo.getSqzybm());
                    this.commonPermissionService.delCommonPer(arcGrantVO);
                }
            }
        }
    }


}
