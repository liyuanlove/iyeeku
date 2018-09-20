package com.iyeeku.core.util;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;

public class JsonUtil {

    private static Logger logger = LoggerFactory.getLogger(JsonUtil.class);

    private static ObjectMapper mapper = new ObjectMapper();

    public static String bean2Json(Object obj) {
        StringWriter sw = new StringWriter();
        try {
            JsonGenerator gen  = new JsonFactory().createGenerator(sw);
            mapper.writeValue( gen , obj);
            gen.close();
        }catch (IOException e){
            logger.error(" bean2Json 转换错误 !!" , e);
            e.printStackTrace();
        }
        return sw.toString();
    }

    public static <T> T json2Bean(String jsonStr , Class<T> objClass) {
        try {
            return mapper.readValue( jsonStr , objClass);
        } catch (IOException e) {
            logger.error(" json2Bean 转换错误 !!" , e);
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args){
        JsonUtil.json2Bean("", HashMap.class);
    }

}
