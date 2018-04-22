package com.iyeeku.core.orm.impl;

import com.iyeeku.core.orm.IBaseDao;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.io.Serializable;

public class BaseDaoImpl extends SqlSessionDaoSupport implements IBaseDao {

    @Override
    public <T> int save_myBatis(String sql, T obj) {
        return 0;
    }

    @Override
    public <T> int save_myBatis(String sql) {
        return 0;
    }

    @Override
    public <T> int delete_myBatis(String sql, T obj) {
        return 0;
    }

    @Override
    public <T> int update_myBatis(String sql, T obj) {
        return 0;
    }

    @Override
    public <T> T queryOne_myBatis(String sql, Serializable entityId) {
        return null;
    }
}
