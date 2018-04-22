package com.iyeeku.core.orm;

import java.io.Serializable;

public interface IBaseDao {

    public static final String BEAN_ID = "baseDao";

    public abstract <T> int save_myBatis(String sql,T obj);

    public abstract <T> int save_myBatis(String sql);

    public abstract <T> int delete_myBatis(String sql,T obj);

    public abstract <T> int update_myBatis(String sql,T obj);

    public abstract <T> T queryOne_myBatis(String sql, Serializable entityId);




}
