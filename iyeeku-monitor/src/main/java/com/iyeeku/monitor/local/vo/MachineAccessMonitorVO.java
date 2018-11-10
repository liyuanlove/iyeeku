package com.iyeeku.monitor.local.vo;

import com.iyeeku.core.vo.BaseVO;

import java.util.Date;

public class MachineAccessMonitorVO extends BaseVO {

    private String zj;

    private String sbbh;

    private String sqjqbh;

    private String sfyxjk;

    private String fwlx;

    private Date fwsj;

    public String getZj() {
        return zj;
    }

    public void setZj(String zj) {
        this.zj = zj == null ? null : zj.trim();
    }

    public String getSbbh() {
        return sbbh;
    }

    public void setSbbh(String sbbh) {
        this.sbbh = sbbh == null ? null : sbbh.trim();
    }

    public String getSqjqbh() {
        return sqjqbh;
    }

    public void setSqjqbh(String sqjqbh) {
        this.sqjqbh = sqjqbh == null ? null : sqjqbh.trim();
    }

    public String getSfyxjk() {
        return sfyxjk;
    }

    public void setSfyxjk(String sfyxjk) {
        this.sfyxjk = sfyxjk == null ? null : sfyxjk.trim();
    }

    public String getFwlx() {
        return fwlx;
    }

    public void setFwlx(String fwlx) {
        this.fwlx = fwlx == null ? null : fwlx.trim();
    }

    public Date getFwsj() {
        return fwsj;
    }

    public void setFwsj(Date fwsj) {
        this.fwsj = fwsj;
    }

}
