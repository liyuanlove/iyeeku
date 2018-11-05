package com.iyeeku.watch.server;

import com.iyeeku.watch.utils.DBUtil;
import com.iyeeku.watch.utils.UUIDGenerator;

import java.io.*;
import java.net.Socket;
import java.util.List;
import java.util.Map;

public class IyeekuWatchThread extends Thread {

    Socket socket;
    int count = 0;

    public IyeekuWatchThread(Socket socket , int count){
        this.socket = socket;
        this.count = count;
    }

    public void run() {

        //测试连接
        System.out.println("connect count : " + count + " , ID ==>> " + DBUtil.getTestID());

        System.out.println("交易总笔数：" + count );
        try{

            String rtnValue = "";

            InputStream is = socket.getInputStream();
            InputStreamReader isRead = new InputStreamReader(is);
            BufferedReader br = new BufferedReader(isRead);

            String value = "";
            String info = null;

            while ((info = br.readLine())!=null){
                value += info;
            }

            System.out.println( "交易参数：" + value);

            if (value!=null){
                String[] params = value.split("\\|");
                String macDz = params[3];

                // System.out.println(params[0] + "  ,  " + params[1]+ "  ,  " + params[2]+ "  ,  " + params[3]+ "  ,  " + params[4]);

                if (null != macDz && !"".equals(macDz)){
                    // 格式:  接口编号 | 电脑名称 | 操作系统 | mac地址 | 在线状态
                    String computername = params[1];
                    String osname = params[2];
                    String zxzt = params[4];

                    try {
                        String sql = "select * from PC_MONITOR where macdz = ?";
                        String[] map = new String[]{macDz};
                        List<Map<String, Object>> rtnList = DBUtil.queryList(sql, map);
                        if (rtnList != null && rtnList.size() > 0) { //修改记录状态
                            StringBuffer updateSqlBuf = new StringBuffer("update PC_MONITOR SET JQZXZT = ? where macdz = ?");
                            String[] updateParams = new String[]{zxzt, macDz};
                            DBUtil.update(updateSqlBuf.toString(), updateParams);

                        } else { // 新增加已条记录
                            String zj = UUIDGenerator.generate("");
                            StringBuffer addSqlBuf = new StringBuffer("insert into PC_MONITOR (ZJ,JQBH,MACDZ,DNMC,CZXT,JQJKZT,JQZXZT) VALUES (?,TO_CHAR(SEQ_IYEEKU_TEST_ID.NEXTVAL),?,?,?,?,?)");
                            String[] addParams = new String[]{zj, macDz, computername, osname, "1", zxzt};
                            DBUtil.insert(addSqlBuf.toString(), addParams);
                        }

                        rtnValue = "0|正常";
                    }catch (Exception ex){
                        rtnValue = "3|服务器端出现异常";
                    }

                }else {
                    rtnValue = "2|mac地址不能为空";
                }

            }else{

                rtnValue = "1|输入参数错误";

            }

            socket.shutdownInput(); //关闭输入流
            //4.获取输入流，响应客服端的请求
            OutputStream out = socket.getOutputStream();
            PrintWriter pw = new PrintWriter(out);
            pw.write(rtnValue);
            pw.flush();

            //5.关闭资源
            pw.close();
            out.close();
            br.close();
            isRead.close();
            is.close();
            socket.close();

        }catch (Exception ex){
            ex.printStackTrace();
        }


    }

}
