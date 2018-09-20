package com.iyeeku.core.util;

public class StringUtil {

    private static int DB_LEFT_LIKE = -1;
    private static int DB_VALUE_LIKE = 0;
    private static int DB_RIGHT_LIKE = 1;


    public static boolean isEmpty(Object str){
        return (str == null || "".equals(str));
    }


    public static String getSSMK(String str){
        if ((str == null) || ("".equals(str.trim()))){
            return str;
        }
        String startFlag = "";
        int startIndex = str.indexOf("/");
        int endIndex = 0;
        if (startIndex != 0){
            endIndex = startIndex;
            startIndex = 0;
            startFlag = "/";
        }else{
            endIndex = str.indexOf("/",1);
        }
        str = str.substring(startIndex , endIndex + 1);
        return startFlag + str;
    }

    public static String formatDbNoEscapeLikeValue(String value){
        return formatNoEscapeLikeValue(value , DB_VALUE_LIKE);
    }

    public static String formatDbNoEscapeLeftLikeValue(String value){
        return formatNoEscapeLikeValue(value , DB_LEFT_LIKE);
    }

    public static String formatDbNoEscapeRightLikeValue(String value){
        return formatNoEscapeLikeValue(value , DB_RIGHT_LIKE);
    }

    private static String formatNoEscapeLikeValue(String value,int likePosition){
        String rtnValue = null;
        if (value == null){
            rtnValue = null;
        }else if ("".equals(value.trim())){
            rtnValue = null;
        }else {
            rtnValue = value.trim();
            switch (likePosition){
                case 1 : rtnValue = "%" + rtnValue; break;
                case -1 : rtnValue = rtnValue + "%"; break;
                default:
                    rtnValue = "%" + rtnValue + "%";
            }
        }
        return rtnValue;
    }


}
