package com.iyeeku.core.orm.interceptor;

import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.reflection.DefaultReflectorFactory;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.ReflectorFactory;
import org.apache.ibatis.reflection.factory.DefaultObjectFactory;
import org.apache.ibatis.reflection.factory.ObjectFactory;
import org.apache.ibatis.reflection.wrapper.DefaultObjectWrapperFactory;
import org.apache.ibatis.reflection.wrapper.ObjectWrapperFactory;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Properties;

public class AbstractPaginationInterceptor implements Interceptor {

    private Logger log = LoggerFactory.getLogger(AbstractPaginationInterceptor.class);

    @Override
    public Object intercept(Invocation invocation) throws Throwable {

        StatementHandler statementHandler = (StatementHandler)invocation.getTarget();
        ObjectFactory objectFactory = new DefaultObjectFactory();
        ObjectWrapperFactory objectWrapperFactory = new DefaultObjectWrapperFactory();
        ReflectorFactory  reflectorFactory = new DefaultReflectorFactory();
        MetaObject metaObject = MetaObject.forObject(statementHandler,objectFactory,objectWrapperFactory,reflectorFactory);

        RowBounds rowBounds = (RowBounds)metaObject.getValue("delegate.rowBounds");

        if(rowBounds == null || rowBounds == RowBounds.DEFAULT){
            return invocation.proceed();
        }

        String originalSql = (String) metaObject.getValue("delegate.boundSql.sql");
        System.out.println("originalSql ==>> " + originalSql);
       // metaObject.setValue("delegate.boundSql.sql",  );















        return null;
    }

    @Override
    public Object plugin(Object target) {
        return null;
    }

    @Override
    public void setProperties(Properties properties) {

    }


}
