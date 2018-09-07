package com.iyeeku.core.orm;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface IBaseDao {

    public static final String BEAN_ID = "baseDao";

    public abstract <T> int save_myBatis(String sql,T obj);

    public abstract <T> int save_myBatis(String sql);

    public abstract <T> int delete_myBatis(String sql,T obj);

    public abstract <T> int delete_myBatis(String sql);

    public abstract <T> int update_myBatis(String sql,T obj);

    public abstract <T> int update_myBatis(String sql);

    public abstract <T> T queryOne_myBatis(String sql);

    public abstract <T> T queryOne_myBatis(String sql, Serializable entityId);

    public abstract <T> List<T> queryAll_myBatis(String sql);

    public abstract <T> List<T> queryAll_myBatis(String sql,Object param);

    public abstract <T> List<T> queryAll_myBatis(String sql, int offset , int size);

    public abstract <T> List<T> queryAll_myBatis(String sql , Object param , int offset , int size);

    public abstract int save_Jdbc(String sql, Object[] values);

    public abstract int update_Jdbc(String sql , Object[] values);

    public abstract List<Map<String,Object>> queryAll_Jdbc(String sql);




}
