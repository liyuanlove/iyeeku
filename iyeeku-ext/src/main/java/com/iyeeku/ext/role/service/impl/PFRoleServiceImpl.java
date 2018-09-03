package com.iyeeku.ext.role.service.impl;

import com.iyeeku.core.utils.UUIDGenerator;
import com.iyeeku.core.vo.Pagination;
import com.iyeeku.ext.role.dao.IPFRoleDao;
import com.iyeeku.ext.role.service.IPFRoleService;
import com.iyeeku.ext.role.vo.PFRole;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("iPFRoleService")
public class PFRoleServiceImpl implements IPFRoleService {

    private final Logger logger = LoggerFactory.getLogger(PFRoleServiceImpl.class);

    @Resource(name="iPFRoleDao")
    private IPFRoleDao iPFRoleDao;

    @Override
    public Map<String , Object> findAllRoleInfos(PFRole role , Pagination pagination) {
        this.logger.info("PFRoleServiceImpl findAllRoles");
        if(role.getJsmc() != null && role.getJsmc() != ""){
            role.setJsmc("%"+role.getJsmc()+"%");
        }

        System.out.println("pagination.getPageIndex() ==>> " + pagination.getPageIndex());
        System.out.println("pagination.getPageSize() ==>> " + pagination.getPageSize());

        List<PFRole> data = this.iPFRoleDao.findAllRoles(role , pagination.getPageIndex() , pagination.getPageSize());
        Integer total = this.iPFRoleDao.findAllInfosCount(role);

        Map<String , Object> result = new HashMap<>();
        result.put("data",data);
        result.put("total",total);

        return result;
    }

    @Override
    public PFRole findRoleByJsbh(String jsbh) {
        this.logger.info("PFRoleServiceImpl findRoleByJsbh");
        return this.iPFRoleDao.findRoleByJsbh(jsbh);
    }

    @Override
    public void saveRole(PFRole role) {
        this.logger.info("PFRoleServiceImpl saveRole");
        role.setJsbh(UUIDGenerator.generate(""));
        role.setCjsj(new Date());
        this.iPFRoleDao.saveRole(role);
    }

    @Override
    public void updateRole(PFRole role) {
        this.logger.info("PFRoleServiceImpl updateRole");
        this.iPFRoleDao.updateRole(role);
    }

    @Override
    public void deleteRole(String jsbh) {
        this.logger.info("PFRoleServiceImpl deleteRole");
        this.iPFRoleDao.deleteRole(jsbh);
    }
}
