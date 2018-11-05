package com.iyeeku.watch.main;

import com.iyeeku.watch.server.IyeekuWatchServer;
import com.iyeeku.watch.utils.DBUtil;

public class Main {

    public static void main(String[] args) {
        //DBUtil.getTestID();
        DBUtil db = new DBUtil();
        String key = System.getProperty("key");
        if (key == null || "".equals(key)){
            System.out.println("密钥不存在!");
            return;
        }

        try {

            IyeekuWatchServer.run();

        }catch (Exception ex){
            ex.printStackTrace();
        }

    }

}
