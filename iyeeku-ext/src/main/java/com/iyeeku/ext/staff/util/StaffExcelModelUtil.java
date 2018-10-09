package com.iyeeku.ext.staff.util;

import java.util.ArrayList;
import java.util.List;

public class StaffExcelModelUtil {

    private static List<String[]> STAFF_MODEL = new ArrayList<>();

    static {
        STAFF_MODEL.add(new String[]{"人员编号","RYBH","9"});
        STAFF_MODEL.add(new String[]{"用户登陆名","YHDLM","11"});
        STAFF_MODEL.add(new String[]{"NotesID","NOTESID","9"});
        STAFF_MODEL.add(new String[]{"柜员号","GYH","9"});
        STAFF_MODEL.add(new String[]{"用户名称","YHMC","10"});
        STAFF_MODEL.add(new String[]{"姓名全拼","XMQP","10"});
        STAFF_MODEL.add(new String[]{"所属机构编号","SSJG","12"});
        STAFF_MODEL.add(new String[]{"所属机构单元","SSJGDY","12"});
        STAFF_MODEL.add(new String[]{"性别","XB","9"});
        STAFF_MODEL.add(new String[]{"用户类型","YHLX","9"});
        STAFF_MODEL.add(new String[]{"入职日期","RZRQ","12"});
        STAFF_MODEL.add(new String[]{"个人证件类型","GRZJLX","15"});
        STAFF_MODEL.add(new String[]{"身份证号","SFZH","20"});
        STAFF_MODEL.add(new String[]{"出生日期","SR","12"});
        STAFF_MODEL.add(new String[]{"电话号码","DHHM","12"});
        STAFF_MODEL.add(new String[]{"电子邮箱地址","YJ","18"});
        STAFF_MODEL.add(new String[]{"员工状态","YGZT","9"});
        STAFF_MODEL.add(new String[]{"职务","ZW","9"});
        STAFF_MODEL.add(new String[]{"详细地址","DZ","30"});
    }

    public static List<String[]> getStaffModel() {
        return STAFF_MODEL;
    }

}
