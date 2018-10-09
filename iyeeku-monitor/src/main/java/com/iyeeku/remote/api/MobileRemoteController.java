package com.iyeeku.remote.api;

import com.iyeeku.remote.vo.ResponseMsg;
import com.iyeeku.remote.vo.TestVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/iyeeku/api")
public class MobileRemoteController {

    private ResponseMsg getTestResponseMsg(){
        ResponseMsg respMsg = new ResponseMsg();
        respMsg.setCode("0");
        respMsg.setMsg("请求成功");
        Map<String,Object> rtnMap = new HashMap<>();
        List<TestVO> list = new ArrayList<>();
        TestVO testVO1 = new TestVO();
        testVO1.setName("02栋01单元");
        testVO1.setDoorId("A2D1C3B5A9FE65764613808999F1F86C");
        TestVO testVO2 = new TestVO();
        testVO2.setName("01栋01单元");
        testVO2.setDoorId("A2D934D6A9FE6576461380891347E7C7");
        list.add(testVO1);
        list.add(testVO2);
        rtnMap.put("list" , list);
        respMsg.setData(rtnMap);
        return respMsg;
    }

    @RequestMapping(value = "demo0" , method = { RequestMethod.POST , RequestMethod.GET } , name = "手机远程链接测试接口0")
    @ResponseBody
    public ResponseMsg demo1(String value){

        System.out.println("\n================= demo0 =====================");
        System.out.println("userId ==>> " + value);
        System.out.println();

        return getTestResponseMsg();
    }

    @RequestMapping(value = "demo1" , method = { RequestMethod.POST , RequestMethod.GET } , name = "手机远程链接测试接口1")
    @ResponseBody
    public ResponseMsg demo1(String userId , String sign , String communityId , String propertyCardId){

        System.out.println("\n================= demo1 =====================");
        System.out.println("userId ==>> " + userId);
        System.out.println("sign ==>> " + sign);
        System.out.println("communityId ==>> " + communityId);
        System.out.println("propertyCardId ==>> " + propertyCardId);
        System.out.println();

        return getTestResponseMsg();
    }

    @RequestMapping(value = "demo2" , method = { RequestMethod.POST , RequestMethod.GET } , name = "手机远程链接测试接口2")
    @ResponseBody
    public ResponseMsg demo2(@RequestParam(value = "userId" , required = false) String userId , @RequestParam(value = "sign" , required = false) String sign ,
                             @RequestParam(value = "communityId" , required = false)  String communityId , @RequestParam(value = "propertyCardId" , required = false) String propertyCardId){

        System.out.println("\n================= demo2 =====================");
        System.out.println("userId ==>> " + userId);
        System.out.println("sign ==>> " + sign);
        System.out.println("communityId ==>> " + communityId);
        System.out.println("propertyCardId ==>> " + propertyCardId);
        System.out.println();

        return getTestResponseMsg();
    }


    @RequestMapping(value = "demo3" , method = { RequestMethod.POST , RequestMethod.GET } , name = "手机远程链接测试接口3")
    @ResponseBody
    public ResponseMsg demo3(@RequestBody(required = false) Map<String , Object> map){

        if (map!=null) {
            String userId = map.get("userId") == null ? "" : map.get("userId").toString();
            String sign = map.get("sign") == null ? "" : map.get("sign").toString();
            String communityId = map.get("communityId") == null ? "" : map.get("communityId").toString();
            String propertyCardId = map.get("propertyCardId") == null ? "" : map.get("propertyCardId").toString();

            System.out.println("\n================= demo3 =====================");
            System.out.println("userId ==>> " + userId);
            System.out.println("sign ==>> " + sign);
            System.out.println("communityId ==>> " + communityId);
            System.out.println("propertyCardId ==>> " + propertyCardId);
            System.out.println();
        }else {

            System.out.println("\nMap对象为NULL\n");
        }

        return getTestResponseMsg();

    }

    public ResponseMsg demo4(){
        return getTestResponseMsg();
    }
    
}
