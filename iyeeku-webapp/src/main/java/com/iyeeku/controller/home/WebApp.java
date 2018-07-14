package com.iyeeku.controller.home;

import com.iyeeku.controller.home.webUtils.CheckUtil;
import com.iyeeku.controller.home.webUtils.MessageUtil;
import com.iyeeku.controller.home.webVO.Article;
import com.iyeeku.controller.home.webVO.NewsMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.iyeeku.controller.home.webVO.TextMessage;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class WebApp {

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public void testWebAppGet(HttpServletRequest request, HttpServletResponse response){
        System.out.println("do GET");

        // 接收微信服务器以Get请求发送的4个参数
        String signature = request.getParameter("signature");
        String timestamp = request.getParameter("timestamp");
        String nonce = request.getParameter("nonce");
        String echostr = request.getParameter("echostr");

        PrintWriter out = null;
        try {

            out = response.getWriter();
            if (CheckUtil.checkSignature(signature, timestamp, nonce)) {
                out.print(echostr);        // 校验通过，原样返回echostr参数内容
            }

        }catch (Exception e){
            e.printStackTrace();
            System.out.println("校验失败!!!");
        }finally {
            if( out != null)
                out.close();
        }

    }


    @RequestMapping(value = "/",method = RequestMethod.POST)
    public void testWebAppPost(HttpServletRequest request, HttpServletResponse response){
        System.out.println("do POST");

        PrintWriter out = null;
        try {
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/xml;charset=utf-8");
            out = response.getWriter();

            Map<String, String> map = MessageUtil.xmlToMap(request);
            String toUserName = map.get("ToUserName");
            String fromUserName = map.get("FromUserName");
            String msgType = map.get("MsgType");
            String content = map.get("Content");
            String event = map.get("Event");
            String eventKey = map.get("EventKey");

            String respXmlMsg = "";

            if("text".equals(msgType)){

                if("H".equals(content)){

                    TextMessage textMessage = new TextMessage();
                    textMessage.setToUserName(fromUserName);
                    textMessage.setFromUserName(toUserName);
                    textMessage.setCreateTime(new Date().getTime());
                    textMessage.setMsgType(MessageUtil.TEXT_MSGTYPE);
                    String Str = "测试菜单帮助:" +
                            "\n1 : 图片消息" +
                            "\n2 : 语音消息" +
                            "\n3 : 视频消息" +
                            "\n4 : 音乐消息" +
                            "\n5 : 图文消息" +
                            "\nH : 帮助菜单";
                    textMessage.setContent(Str);
                    respXmlMsg = MessageUtil.textMessageToXml(textMessage);


                }else if("5".equals(content)){  //测试图文消息

                    NewsMessage newsMessage = new NewsMessage();
                    newsMessage.setToUserName(fromUserName);
                    newsMessage.setFromUserName(toUserName);
                    newsMessage.setCreateTime(new Date().getTime());

                    Article article = new Article();
                    article.setDescription("这里是图文信息");
                    article.setPicUrl("http://iyeeku.com/images/testWEB1.jpg");
                    article.setTitle("图文消息1");
                    article.setUrl("http://www.iyeeku.com/web/jsp");

                    List<Article> list = new ArrayList<Article>();
                    list.add(article);

                    newsMessage.setArticleCount(list.size());
                    newsMessage.setArticles(list);
                    newsMessage.setMsgType(MessageUtil.NEWS_MSGTYPE);

                    respXmlMsg = MessageUtil.newsMessageToXml(newsMessage);

                }else {

                    TextMessage textMessage = new TextMessage();
                    textMessage.setToUserName(fromUserName);
                    textMessage.setFromUserName(toUserName);
                    textMessage.setCreateTime(new Date().getTime());
                    textMessage.setMsgType(msgType);
                    textMessage.setContent("测试服务器返回的信息:\n(你发送的消息是:\n " + content + ")");

                    respXmlMsg = MessageUtil.textMessageToXml(textMessage);

                }


            }else if ("event".equals(msgType)){

                if("subscribe".equals(event)){


                }else if("unsubscribe".equals(event)){

                }

            }
/*
            if("subscribe".equals(event)){ //订阅了,该公众号!
                content = "这里是杨旭东的测试微信公众号!";

                String str = "<xml>" +
                        "<ToUserName>< ![CDATA["+fromUserName+"] ]></ToUserName>" +
                        "<FromUserName>< ![CDATA["+toUserName+"] ]></FromUserName>" +
                        "<CreateTime>"+(new Date().getTime())+"</CreateTime>" +
                        "<MsgType>< ![CDATA["+msgType+"] ]></MsgType>" +
                        "<Event>< ![CDATA[subscribe] ]></Event>" +
                        "</xml>";

            }else if ("unsubscribe".equals(event)){
                content = "谢谢您的参与，您取消了杨旭东测试微信公众号的订阅";
            }

            String rtnXml = "<xml>" +
                    "\n<ToUserName>\n<![CDATA["+fromUserName+"]]>\n</ToUserName>" +
                    "\n<FromUserName>\n<![CDATA["+toUserName+"]]>\n</FromUserName>" +
                    "\n<CreateTime>\n"+(new Date().getTime())+"\n</CreateTime>" +
                    "\n<MsgType>\n<![CDATA["+msgType+"]]>\n</MsgType>" +
                    "\n<Content>\n<![CDATA["+"测试服务器返回的信息:\n(你发送的消息是: "+content+")\n骚p, 来干吧!]]>\n</Content>" +
                    "\n</xml>";*/

            System.out.println(respXmlMsg);

            out.print(respXmlMsg);
            out.flush();
            out.close();

        }catch (Exception e){
            e.printStackTrace();
        }

    }

    @RequestMapping(value = "/web/jsp",method = RequestMethod.GET)
    public ModelAndView testWebJsp(HttpServletRequest request, HttpServletResponse response){
        ModelAndView modelAndView = new ModelAndView("webapp");
        return  modelAndView;
    }


    @RequestMapping(value = "/web/xml",method = RequestMethod.GET)
    public void testWebAppPGET1234(HttpServletRequest request, HttpServletResponse response){
        System.out.println("do POST");

        PrintWriter out = null;
        try {
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/xml;charset=utf-8");
            out = response.getWriter();

            TextMessage textMessage = new TextMessage();
            textMessage.setToUserName("dsfdsf");
            textMessage.setFromUserName("sdsdsdsd");
            textMessage.setCreateTime(new Date().getTime());
            textMessage.setMsgType("text");
            textMessage.setContent("dsdsdsdsdsd");

            String rtnXml = MessageUtil.textMessageToXml(textMessage);


/*            String rtnXml = "<xml>" +
                    "\n<ToUserName>\n<![CDATA[yangquan]]>\n</ToUserName>" +
                    "\n<FromUserName>\n<![CDATA[wuhuifang]]>\n</FromUserName>" +
                    "\n<CreateTime>\n"+(new Date().getTime())+"\n</CreateTime>" +
                    "\n<MsgType>\n<![CDATA[text]]>\n</MsgType>" +
                    "\n<Content>\n<![CDATA["+"测试服务器返回的信息:\n(你发送的消息是: 我们结婚吧!)\n骚p, 来干吧!]]>\n</Content>" +
                    "\n</xml>";*/

            System.out.println(rtnXml);

            out.print(rtnXml);
            out.flush();
            out.close();

        }catch (Exception e){
            e.printStackTrace();
        }

    }

}
