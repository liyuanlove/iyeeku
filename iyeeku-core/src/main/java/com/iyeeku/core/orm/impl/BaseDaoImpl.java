package com.iyeeku.core.orm.impl;

import com.iyeeku.core.orm.IBaseDao;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import java.io.Serializable;
import java.util.List;

public class BaseDaoImpl extends SqlSessionDaoSupport implements IBaseDao {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory(sqlSessionFactory);
    }

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public <T> int save_myBatis(String sql, T obj) {
        return this.getSqlSession().insert(sql,obj);
    }

    public <T> int save_myBatis(String sql) {
        return this.getSqlSession().insert(sql);
    }

    public <T> int delete_myBatis(String sql, T obj) {
        return this.getSqlSession().delete(sql,obj);
    }

    public <T> int delete_myBatis(String sql) {
        return this.getSqlSession().delete(sql);
    }

    public <T> int update_myBatis(String sql, T obj) {
        return this.getSqlSession().update(sql,obj);
    }

    public <T> int update_myBatis(String sql) {
        return this.getSqlSession().update(sql);
    }

    public <T> T queryOne_myBatis(String sql) {
        return this.getSqlSession().selectOne(sql);
    }

    public <T> T queryOne_myBatis(String sql, Serializable entityId) {
        return this.getSqlSession().selectOne(sql,entityId);
    }

    public <T> List<T> queryAll_myBatis(String sql) {
        return this.getSqlSession().selectList(sql);
    }

    public <T> List<T> queryAll_myBatis(String sql, Object param) {
        return this.getSqlSession().selectList(sql,param);
    }

    public <T> List<T> queryAll_myBatis(String sql, int offset, int size) {
        if( offset >= 0 && size > 0){
            RowBounds rowBounds = new RowBounds(offset,size);
            return this.getSqlSession().selectList(sql,rowBounds);
        }else{
            return this.getSqlSession().selectList(sql);
        }
    }

    public <T> List<T> queryAll_myBatis(String sql, Object param, int offset, int size) {
        if( offset >= 0 && size > 0){
            RowBounds rowBounds = new RowBounds(offset,size);
            return this.getSqlSession().selectList(sql,param,rowBounds);
        }else{
            return this.getSqlSession().selectList(sql,param);
        }
    }

    public int save_Jdbc(String sql, Object[] values) {
        return 0;
    }

    public int update_Jdbc(String sql, Object[] values) {
        return 0;
    }

}
