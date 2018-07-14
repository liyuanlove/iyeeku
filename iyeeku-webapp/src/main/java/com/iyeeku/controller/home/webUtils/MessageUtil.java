package com.iyeeku.controller.home.webUtils;

import com.iyeeku.controller.home.webVO.Article;
import com.iyeeku.controller.home.webVO.NewsMessage;
import com.iyeeku.controller.home.webVO.TextMessage;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XppDriver;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MessageUtil {

    /**
     * 文本消息
     */
    public static final String TEXT_MSGTYPE = "text";

    /**
     * 图片消息
     */
    public static final String IMAGE_MSGTYPE = "image";

    /**
     * 语音消息
     */
    public static final String VOICE_MSGTYPE = "voice";

    /**
     * 视频消息
     */
    public static final String VIDEO_MSGTYPE = "video";

    /**
     * 音乐消息
     */
    public static final String MUSIC_MSGTYPE = "music";

    /**
     * 图文消息
     */
    public static final String NEWS_MSGTYPE = "news";


    /**
     * 将XML转换成Map集合
     */
    public static Map<String, String>xmlToMap(HttpServletRequest request) throws IOException, DocumentException {

        Map<String, String> map = new HashMap<String, String>();
        SAXReader reader = new SAXReader();            // 使用dom4j解析xml
        InputStream ins = request.getInputStream(); // 从request中获取输入流
        System.out.println("接受的信息:");
        System.out.println(ins);

        Document doc = reader.read(ins);

        Element root = doc.getRootElement();         // 获取根元素
        List<Element> list = root.elements();        // 获取所有节点

        for (Element e : list) {
            map.put(e.getName(), e.getText());
            System.out.println(e.getName() + "--->" + e.getText());
        }
        ins.close();
        return map;
    }

    /**
     * 文本消息对象转换成xml
     * @param textMessage 文本消息对象
     * @return xml
     */
    public static String textMessageToXml(TextMessage textMessage) {
        xstream.alias("xml", textMessage.getClass());
        return xstream.toXML(textMessage);
    }


    public static String newsMessageToXml(NewsMessage newsMessage){
        xstream.alias("xml", newsMessage.getClass());
        xstream.alias("item", new Article().getClass());
        return xstream.toXML(newsMessage);
    }

    /**
     * 扩展xstream，使其支持CDATA块
     * xstream 还依赖xmlpull_1_0_5.jar许引入
     */
    private static XStream xstream = new XStream(new XppDriver() {
        public HierarchicalStreamWriter createWriter(Writer out) {
            return new PrettyPrintWriter(out) {
                // 对所有xml节点的转换都增加CDATA标记
                boolean cdata = true;
                protected void writeText(QuickWriter writer, String text) {
                    if (cdata) {
                        writer.write("<![CDATA[");
                        writer.write(text);
                        writer.write("]]>");
                    } else {
                        writer.write(text);
                    }
                }
            };
        }
    });


}
