package com.iyeeku.core.orm.impl;

import com.iyeeku.core.orm.IBaseDao;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.jdbc.core.JdbcTemplate;

import java.io.Serializable;
import java.util.List;

public class BaseDaoImpl extends SqlSessionDaoSupport implements IBaseDao {

    private JdbcTemplate jdbcTemplate;

    @Override
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory(sqlSessionFactory);
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public <T> int save_myBatis(String sql, T obj) {
        return this.getSqlSession().insert(sql,obj);
    }

    @Override
    public <T> int save_myBatis(String sql) {
        return this.getSqlSession().insert(sql);
    }

    @Override
    public <T> int delete_myBatis(String sql, T obj) {
        return this.getSqlSession().delete(sql,obj);
    }

    @Override
    public <T> int delete_myBatis(String sql) {
        return this.getSqlSession().delete(sql);
    }

    @Override
    public <T> int update_myBatis(String sql, T obj) {
        return this.getSqlSession().update(sql,obj);
    }

    @Override
    public <T> int update_myBatis(String sql) {
        return this.getSqlSession().update(sql);
    }

    @Override
    public <T> T queryOne_myBatis(String sql) {
        return this.getSqlSession().selectOne(sql);
    }

    @Override
    public <T> T queryOne_myBatis(String sql, Serializable entityId) {
        return this.getSqlSession().selectOne(sql,entityId);
    }

    @Override
    public <T> List<T> queryAll_myBatis(String sql) {
        return this.getSqlSession().selectList(sql);
    }

    @Override
    public <T> List<T> queryAll_myBatis(String sql, Object param) {
        return this.getSqlSession().selectList(sql,param);
    }

    @Override
    public <T> List<T> queryAll_myBatis(String sql, int offset, int size) {
        if( offset >= 0 && size > 0){
            RowBounds rowBounds = new RowBounds(offset,size);
            return this.getSqlSession().selectList(sql,rowBounds);
        }else{
            return this.getSqlSession().selectList(sql);
        }
    }

    @Override
    public <T> List<T> queryAll_myBatis(String sql, Object param, int offset, int size) {
        if( offset >= 0 && size > 0){
            RowBounds rowBounds = new RowBounds(offset,size);
            return this.getSqlSession().selectList(sql,param,rowBounds);
        }else{
            return this.getSqlSession().selectList(sql,param);
        }
    }

    @Override
    public int save_Jdbc(String sql, Object[] values) {
        return 0;
    }

    @Override
    public int update_Jdbc(String sql, Object[] values) {
        return 0;
    }

}
