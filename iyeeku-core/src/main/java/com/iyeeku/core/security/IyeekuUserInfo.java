package com.iyeeku.core.security;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.*;

public class IyeekuUserInfo extends User {

    private String userId = null;
    private Object otherInfo = null;
    private String userCode = null;
    private String userNotesID = null;
    private String userUnit = null;
    private String unitPath = null;
    private String unitName = null;
    private String userIP = null;
    private String mmyz = null;
    private Map<String,String> mapInfo = new HashMap<>();

    public IyeekuUserInfo(String userId , String userCode , String userName , String userNotesID , String userUnit , String unitPath , String unitName , String password , String mmyz , boolean enabled ,
                          boolean accountNonExpired , boolean credentialsNonExpired , boolean accountNonLocked , Collection<? extends GrantedAuthority> authorities)
    {
        super(userName,password,enabled,accountNonExpired,credentialsNonExpired,accountNonLocked,authorities);
        this.userId = userId;
        this.userCode = userCode;
        this.userUnit = userUnit;
        this.userNotesID = userNotesID;
        this.unitPath = unitPath;
        this.unitName = unitName;
        this.mmyz = mmyz;
    }

    /**
     * 获取角色列表信息
     * @return 角色列表信息
     */
    public List<String> getRoleList(){
        Collection<? extends GrantedAuthority> authorityList = getAuthorities();
        List<String> roleList = null;
        if (authorityList != null && authorityList.size() > 0){
            roleList = new ArrayList<>();
            for (GrantedAuthority authority : authorityList){
                roleList.add(authority.getAuthority());
            }
        }
        return roleList;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Object getOtherInfo() {
        return otherInfo;
    }

    public void setOtherInfo(Object otherInfo) {
        this.otherInfo = otherInfo;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public String getUserNotesID() {
        return userNotesID;
    }

    public void setUserNotesID(String userNotesID) {
        this.userNotesID = userNotesID;
    }

    public String getUserUnit() {
        return userUnit;
    }

    public void setUserUnit(String userUnit) {
        this.userUnit = userUnit;
    }

    public String getUserPath() {
        return unitPath;
    }

    public void setUserPath(String userPath) {
        this.unitPath = userPath;
    }

    public String getUserName() {
        return unitName;
    }

    public void setUserName(String userName) {
        this.unitName = userName;
    }

    public String getUserIP() {
        return userIP;
    }

    public void setUserIP(String userIP) {
        this.userIP = userIP;
    }

    public String getMmyz() {
        return mmyz;
    }

    public void setMmyz(String mmyz) {
        this.mmyz = mmyz;
    }

    public Map<String, String> getMapInfo() {
        return mapInfo;
    }

    public void setMapInfo(Map<String, String> mapInfo) {
        this.mapInfo = mapInfo;
    }
}
