package com.iyeeku.watch.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.util.Properties;

public class C3P0Utils {

    private static ComboPooledDataSource dataSource;

    private static ThreadLocal<Connection> tl = new ThreadLocal<>();

    static {
        try {
            dataSource = new ComboPooledDataSource();
            Properties properties = new Properties();

            String OSNAME = System.getProperty("os.name");

            InputStream inputStream = new FileInputStream("config/c3p0.properties");
            properties.load(inputStream);
            System.out.println(properties.getProperty("driverClass"));
            System.out.println(properties.getProperty("jdbcUrl"));
            System.out.println(properties.getProperty("user"));
            System.out.println(properties.getProperty("password"));

            //String key = System.getProperty("key");

            //System.out.println("key ===>> " + key);

            dataSource.setDriverClass(properties.getProperty("driverClass"));

            if (OSNAME.indexOf("Windows") != -1){
                dataSource.setJdbcUrl(properties.getProperty("LocJdbcUrl"));
                dataSource.setUser(properties.getProperty("LocUser"));
            }else {
                dataSource.setJdbcUrl(properties.getProperty("jdbcUrl"));
                dataSource.setUser(properties.getProperty("user"));
            }
            //dataSource.setJdbcUrl(properties.getProperty("jdbcUrl"));
            //dataSource.setUser(properties.getProperty("user"));
            dataSource.setPassword(SecurityUtil.decrypt(properties.getProperty("password") , System.getProperty("key")));
            dataSource.setAutoCommitOnClose(Boolean.parseBoolean(properties.getProperty("autoCommitOnClose")));
            dataSource.setInitialPoolSize(Integer.parseInt(properties.getProperty("initialPoolSize")));
            dataSource.setCheckoutTimeout(Integer.parseInt(properties.getProperty("checkoutTimeout")));
            dataSource.setMinPoolSize(Integer.parseInt(properties.getProperty("minPoolSize")));
            dataSource.setMaxPoolSize(Integer.parseInt(properties.getProperty("maxPoolSize")));
            dataSource.setMaxIdleTime(Integer.parseInt(properties.getProperty("maxIdleTime")));
            dataSource.setAcquireIncrement(Integer.parseInt(properties.getProperty("acquireIncrement")));
            dataSource.setMaxIdleTimeExcessConnections(Integer.parseInt(properties.getProperty("maxIdleTimeExcessConnections")));
        }catch (Exception ex){
            throw new RuntimeException(ex);
        }
    }

    public static DataSource getDataSource(){
        return dataSource;
    }

    public static Connection getConnection(){
        Connection conn = tl.get();
        try {
            if (conn == null){
                conn = dataSource.getConnection();
                tl.set(conn);
            }
            return conn;
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }


    public static void startTx(){
        Connection conn = tl.get();
        try {
            if (conn == null){
                conn = dataSource.getConnection();
                tl.set(conn);
            }
            conn.setAutoCommit(false);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }


    public static void commit(){
        Connection conn = tl.get();
        try {
            if (conn != null){
                conn.commit();
            }
        }catch (Exception e){
            throw new RuntimeException(e);
        }finally {
            tl.remove();
        }
    }

    public static void rollback(){
        Connection conn = tl.get();
        try {
            if (conn != null){
                conn.rollback();
            }
        }catch (Exception e){
            throw new RuntimeException(e);
        }finally {
            tl.remove();
        }
    }

    public static void close(){
        Connection conn = tl.get();
        try {
            if (conn != null){
                conn.close();
            }
        }catch (Exception e){
            throw new RuntimeException(e);
        }finally {
            tl.remove();
        }
    }

}
