package com.iyeeku.controller.home.webUtils;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.StringWriter;

@XmlRootElement
public class WeixinMessageXmlUtil {

    private String ToUserName;  //接收方帐号（收到的OpenID）
    private String FromUserName; //开发者微信号
    private long CreateTime;     //创建时间
    private String MsgType;       //消息类型
    private String Content;             //内容


    public WeixinMessageXmlUtil(){

    }
    public WeixinMessageXmlUtil(String ToUserName,String FromUserName,long CreateTime,String MsgType,String Content){
        this.ToUserName=ToUserName;
        this.FromUserName=FromUserName;
        this.CreateTime=CreateTime;
        this.MsgType=MsgType;
        this.Content=Content;
    }

    /**
     * 对象转为xml格式
     * @param tx
     * @return
     * @throws Exception
     */
    public static String objectToXml(WeixinMessageXmlUtil tx) throws Exception{
        StringWriter sw = new StringWriter();
        JAXBContext jbc=JAXBContext.newInstance(tx.getClass());   //传入要转换成xml的对象类型
        Marshaller marshaller = jbc.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_ENCODING, "UTF-8");// //编码格式
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);// 是否格式化生成的xml串
        marshaller.setProperty(Marshaller.JAXB_FRAGMENT, true);// 是否省略xm头声明信息
        marshaller.marshal(tx, sw);
        String msg=sw.toString();
        msg= msg.replace("content", "Content");
        msg= msg.replace("createTime", "CreateTime");
        msg= msg.replace("fromUserName", "FromUserName");
        msg= msg.replace("msgType", "MsgType");
        msg= msg.replace("toUserName", "ToUserName");
        return msg;
    }


    public String getToUserName() {
        return ToUserName;
    }

    public void setToUserName(String toUserName) {
        ToUserName = toUserName;
    }

    public String getFromUserName() {
        return FromUserName;
    }

    public void setFromUserName(String fromUserName) {
        FromUserName = fromUserName;
    }

    public long getCreateTime() {
        return CreateTime;
    }

    public void setCreateTime(long createTime) {
        CreateTime = createTime;
    }


    public String getMsgType() {
        return MsgType;
    }
    public void setMsgType(String msgType) {
        MsgType = msgType;
    }
    public String getContent() {
        return Content;
    }
    public void setContent(String content) {
        Content = content;
    }
    public static void main(String[] args){
        WeixinMessageXmlUtil tx =new WeixinMessageXmlUtil("111111", "2222222", 21312321, "test","呵呵");
        String xmlMsg="";
        try {
            xmlMsg = tx.objectToXml(tx);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        System.out.println(xmlMsg);
    }
}
