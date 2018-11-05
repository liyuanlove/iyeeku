package com.iyeeku.watch.utils;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

public class DBUtil {

    private static Logger logger = Logger.getLogger("");

    /**
     *
     * @param sql
     * @param params
     * @return
     */
    public static List<Map<String,Object>> queryList(String sql,String[] params){
        //logger.info(String.format("============查询数据=================="));
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        List<Map<String,Object>> mapList = new ArrayList<>();
        try{
            conn = C3P0Utils.getConnection();
            pst = conn.prepareStatement(sql);
            if (params!=null){
                for (int i = 0 ; i < params.length ; i++){
                    pst.setObject(i + 1 , params[i]);
                }
            }
            rs = pst.executeQuery();
            Map<String,Object> map = null;
            ResultSetMetaData resultSetMetaData = rs.getMetaData();
            while (rs.next()){
                map = new HashMap<>();
                for (int i = 0 , l = resultSetMetaData.getColumnCount() ; i <  l ; i ++){
                    String column = resultSetMetaData.getColumnLabel(i + 1);
                    Object value = rs.getObject(column);
                    map.put(column , value);
                }
                mapList.add(map);
            }
        }catch (Exception e){
            logger.info("===========数据查询异常================");
            e.printStackTrace();
        }finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                C3P0Utils.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        //logger.info("=============查询结束=================");
        return mapList;
    }


    public static void update(String sql,String[] params){
        Connection conn = null;
        PreparedStatement pst = null;
        int len = 0;
        try{
            C3P0Utils.startTx();
            conn = C3P0Utils.getConnection();
            pst = conn.prepareStatement(sql);
            for (int i = 0 , l = params.length ; i < l ; i++){
                if (params[i] != null){
                    pst.setObject(i+1 ,params[i]);
                }
            }
            len = pst.executeUpdate();
            C3P0Utils.commit();
        }catch (Exception e){
            C3P0Utils.rollback();
            logger.info("***************数据更新异常*************");
            e.printStackTrace();
        }finally {
            try {
                if (pst!=null) pst.close();
                if (conn!=null)
                    conn.close();
                C3P0Utils.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }

    }



    /**
     * 插入数据 （如果需要插入时间需要单独处理）
     * @param sql
     * @param params
     * @throws SQLException
     */
    public static void insert(String sql ,String[] params) throws SQLException{
        logger.info("=============插入================");
        Connection conn = null;
        PreparedStatement pst = null;
        C3P0Utils.startTx();
        conn = C3P0Utils.getConnection();
        pst = conn.prepareStatement(sql);
        for (int i = 0 ; i < params.length ; i++){
            pst.setObject(i+1 , params[i]);
        }
        pst.executeUpdate();
        C3P0Utils.commit();
        if (pst!=null){
            pst.close();
        }
        C3P0Utils.close();
        //logger.info(String.format("==============插入成功!==============="));
    }

    public static String getTestID(){
        String sql = "select GET_TEST_ID() as ID from dual";
        List<Map<String,Object>> list = DBUtil.queryList(sql,null);
        String id = list.get(0).get("ID").toString();
        return id;
    }

}
