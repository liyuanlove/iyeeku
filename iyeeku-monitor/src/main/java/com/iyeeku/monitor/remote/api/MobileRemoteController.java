package com.iyeeku.monitor.remote.api;

import com.iyeeku.core.mq.sender.SendMessage;
import com.iyeeku.monitor.remote.service.IMobileRemoteService;
import com.iyeeku.monitor.remote.vo.ResponseMsg;
import com.iyeeku.monitor.util.MachineStatusQueue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/remoctr/")
public class MobileRemoteController {

    private Logger logger = LoggerFactory.getLogger(MobileRemoteController.class);

    @Autowired
    private IMobileRemoteService iMobileRemoteService;
    @Autowired
    private SendMessage sendMessage;

    @RequestMapping(value = "getMonitoredMachineList" , method = {RequestMethod.POST , RequestMethod.GET} , name = "获取被监控机器列表信息")
    @ResponseBody
    public ResponseMsg getMonitoredMachineList(@RequestBody(required = false) Map<String , Object> param){
        ResponseMsg respMsg = generateRespMsgAndCheckReqParam(param);
        if ("1".equals(respMsg.getCode())){ //参数不合法
            return respMsg;
        }else{
            String deviceId = String.valueOf(param.get("deviceId"));
            this.logger.info("查询参数：设备ID：{} ==>> " + deviceId);
            List<Map<String,Object>> list = this.iMobileRemoteService.findMonitoredMachineListByDeviceId(deviceId);
            respMsg.formatSuccMsg();
            Map<String,Object> rtnMap = new HashMap<>();
            rtnMap.put("list" , list);
            respMsg.setData(rtnMap);
            return respMsg;
        }
    }

    @RequestMapping(value = "getMonitoredMachineInfo" , method = {RequestMethod.POST , RequestMethod.GET} , name = "获取被监控的机器信息")
    @ResponseBody
    public ResponseMsg getMonitoredMachineInfo(@RequestBody(required = false) Map<String , Object> param){
        ResponseMsg respMsg = generateRespMsgAndCheckReqParam(param);
        if ("1".equals(respMsg.getCode())){ //参数不合法
            return respMsg;
        }else{
            String deviceId = String.valueOf(param.get("deviceId"));
            String zj = String.valueOf(param.get("zj"));

            Map<String,Object> dataMap = this.iMobileRemoteService.findMonitoredMachineInfoByZj(zj,deviceId);
            respMsg.formatSuccMsg();
            respMsg.setData(dataMap);

            return respMsg;
        }
    }

    @RequestMapping(value = "sendTaskToMachine" , method = {RequestMethod.POST , RequestMethod.GET} , name = "发送命令给机器")
    @ResponseBody
    public ResponseMsg sendTaskToMachine(@RequestBody(required = false) Map<String , Object> param){
        ResponseMsg respMsg = generateRespMsgAndCheckReqParam(param);
        if ("1".equals(respMsg.getCode())){ //参数合法
            return respMsg;
        }else{
            return respMsg;
        }
    }

    @RequestMapping(value = "sendStatusToMachine" , method = {RequestMethod.POST , RequestMethod.GET} , name = "修改电脑状态，用于调试")
    @ResponseBody
    public ResponseMsg sendStatusToMachine(@RequestBody(required = false) Map<String , Object> param){
        ResponseMsg respMsg = generateRespMsgAndCheckReqParam(param);
        if ("1".equals(respMsg.getCode())){ //参数不合法
            return respMsg;
        }else{
            String deviceId = String.valueOf(param.get("deviceId"));
            String zj = String.valueOf(param.get("zj"));
            String zt = String.valueOf(param.get("zt"));
            Map<String,Object> dataMap = this.iMobileRemoteService.findMonitoredMachineInfoByZj(zj,deviceId);
            if (dataMap == null || dataMap.size() == 0){
                respMsg.setCode("1");
                respMsg.setMsg("您没有权限修改!");
                return respMsg;
            }else{
                this.iMobileRemoteService.updateMachineStatus(zj,zt);
                //String text = JsonUtil.bean2Json(dataMap);
                this.sendMessage.sendTextMessage(zj);
                respMsg.formatSuccMsg();
                return respMsg;
            }
        }
    }





    @RequestMapping(value = "debugTakeMsgFromQueue",method = {RequestMethod.POST , RequestMethod.GET} , name = "修改电脑状态，用于调试")
    @ResponseBody
    public void debugTakeMsgFromQueue(@RequestParam int count){
        try {
            String info = "";
            for (int i = 0 ; i < count ; i++) {
                String value = MachineStatusQueue.queue.take();
                info += value + " , ";
            }
            System.out.println(info);
        }catch (InterruptedException ex){

        }

    }

    private ResponseMsg generateRespMsgAndCheckReqParam(Map<String,Object> param){
        ResponseMsg respMsg = new ResponseMsg();
        if (param == null || param.size() == 0){
            respMsg.setCode("1");
            respMsg.setMsg("参数错误，请求参数不能为空！");
        }else{
            if (param.get("deviceId") == null){
                respMsg.setCode("1");
                respMsg.setMsg("参数错误，设备ID不能为空！");
            }
        }
        return respMsg;
    }

}
