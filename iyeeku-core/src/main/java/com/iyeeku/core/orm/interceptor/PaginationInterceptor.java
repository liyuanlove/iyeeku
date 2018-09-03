/*
package com.iyeeku.core.orm.interceptor;

import java.sql.Connection;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.collections.MapUtils;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.factory.DefaultObjectFactory;
import org.apache.ibatis.reflection.factory.ObjectFactory;
import org.apache.ibatis.reflection.wrapper.DefaultObjectWrapperFactory;
import org.apache.ibatis.reflection.wrapper.ObjectWrapperFactory;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.RowBounds;

@Intercepts({ @Signature(type = StatementHandler.class , method = "prepare" , args = { Connection.class }) })
public class PaginationInterceptor implements Interceptor {

    private static final ObjectFactory DEFAULT_OBJECT_FACTORY = new DefaultObjectFactory();
    private static final ObjectWrapperFactory DEFAULT_OBJECT_WRAPPER_FACTORY = new DefaultObjectWrapperFactory();

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        StatementHandler statementHandler = (StatementHandler)invocation.getTarget();
        MetaObject metaStatementHandler = MetaObject.forObject(statementHandler, DEFAULT_OBJECT_FACTORY, DEFAULT_OBJECT_WRAPPER_FACTORY);
        //MetaObject metaStatementHandler = MetaObject.forObject(statementHandler, DEFAULT_OBJECT_FACTORY, DEFAULT_OBJECT_WRAPPER_FACTORY);
        //MetaObject.forObject(statementHandler ,)

        RowBounds rowBounds = (RowBounds) metaStatementHandler.getValue("delegate.rowBounds");
        if(rowBounds == null || rowBounds == RowBounds.DEFAULT){
            return invocation.proceed();
        }

        while( metaStatementHandler.hasGetter("h") ){
            Object object = metaStatementHandler.getValue("h");
            metaStatementHandler = MetaObject.forObject(object, DEFAULT_OBJECT_FACTORY, DEFAULT_OBJECT_WRAPPER_FACTORY);
        }

        while (metaStatementHandler.hasGetter("target")) {
            Object object = metaStatementHandler.getValue("target");
            metaStatementHandler = MetaObject.forObject(object, DEFAULT_OBJECT_FACTORY, DEFAULT_OBJECT_WRAPPER_FACTORY);
        }

        BoundSql boundSql = (BoundSql) metaStatementHandler.getValue("delegate.boundSql");
        Object params = boundSql.getParameterObject();
        if( params instanceof Map ){
            @SuppressWarnings("unchecked")
            Map<String, Object> paramsMap = (Map<String, Object>)params;
            MapUtils.safeAddToMap(paramsMap, "STARTROW", String.valueOf(rowBounds.getOffset()));
            MapUtils.safeAddToMap(paramsMap, "ENDROW", String.valueOf(rowBounds.getLimit()));
        }

        String sql = boundSql.getSql();
        StringBuffer sbSql = new StringBuffer();

        // 重写sql
        Configuration configuration = (Configuration)metaStatementHandler.getValue("delegate.configuration");
        // DBUtil dbUtil = new DBUtil(configuration);
        String dbType = configuration.getVariables().getProperty("dbtype");
        System.out.println(dbType);
        if( dbType.equals("MySQL") ){
            sbSql.append(sql).append(" LIMIT ").append(rowBounds.getOffset()-1).append(",").append(rowBounds.getLimit()-1);
            metaStatementHandler.setValue("delegate.boundSql.sql", sbSql.toString());

            // 采用物理分页后，就不需要mybatis的内存分页了，所以重置下面的两个参数
            metaStatementHandler.setValue("delegate.rowBounds.offset", RowBounds.NO_ROW_OFFSET);
            metaStatementHandler.setValue("delegate.rowBounds.limit", RowBounds.NO_ROW_LIMIT);

        }else if(dbType.equals("oracle")){

*/
/*	    	sbSql.append("SELECT * ");
	    	sbSql.append("FROM (SELECT ROWNUM RN,NOPAGESQL.* ");
	    	sbSql.append("FROM (").append(sql).append(") NOPAGESQL ");
	    	sbSql.append("WHERE ROWNUM <= ").append(rowBounds.getLimit()).append(") ");
	    	sbSql.append("WHERE RN >= ").append(rowBounds.getOffset());*//*


            sbSql.append("select * from ( select temp.*, rownum row_id from (");
            sbSql.append(sql);
            sbSql.append(") temp where rownum <= ").append(rowBounds.getLimit());
            sbSql.append(") where row_id > ").append(rowBounds.getOffset());

            metaStatementHandler.setValue("delegate.boundSql.sql", sbSql.toString());

            // 采用物理分页后，就不需要mybatis的内存分页了，所以重置下面的两个参数
            metaStatementHandler.setValue("delegate.rowBounds.offset", RowBounds.NO_ROW_OFFSET);
            metaStatementHandler.setValue("delegate.rowBounds.limit", RowBounds.NO_ROW_LIMIT);

        }else{


        }
        System.out.println("********************************************************************");
        System.out.println(sbSql);
        System.out.println("********************************************************************");

        // 将执行权交给下一个拦截器
        return invocation;
    }


    @Override
    public Object plugin(Object target) {

        if( target instanceof StatementHandler ){
            return Plugin.wrap(target, this);
        }else{
            return target;
        }

    }

    @Override
    public void setProperties(Properties arg0) {

    }



}
*/
