package com.iyeeku.ext.online.vo;

import com.iyeeku.core.vo.BaseVO;

import java.util.Date;

public class PFOnlineVO extends BaseVO {

    private String yhjlzj;

    private String yhbh;

    private String yhzxzt;

    private String yhhhbh;

    private Date yhdlsj;

    private String zzjglj;

    private String yhdljqdz;

    private String hhsfgq;

    public String getYhjlzj() {
        return yhjlzj;
    }

    public void setYhjlzj(String yhjlzj) {
        this.yhjlzj = yhjlzj == null ? null : yhjlzj.trim();
    }

    public String getYhbh() {
        return yhbh;
    }

    public void setYhbh(String yhbh) {
        this.yhbh = yhbh == null ? null : yhbh.trim();
    }

    public String getYhzxzt() {
        return yhzxzt;
    }

    public void setYhzxzt(String yhzxzt) {
        this.yhzxzt = yhzxzt == null ? null : yhzxzt.trim();
    }

    public String getYhhhbh() {
        return yhhhbh;
    }

    public void setYhhhbh(String yhhhbh) {
        this.yhhhbh = yhhhbh == null ? null : yhhhbh.trim();
    }

    public Date getYhdlsj() {
        return yhdlsj;
    }

    public void setYhdlsj(Date yhdlsj) {
        this.yhdlsj = yhdlsj;
    }

    public String getZzjglj() {
        return zzjglj;
    }

    public void setZzjglj(String zzjglj) {
        this.zzjglj = zzjglj == null ? null : zzjglj.trim();
    }

    public String getYhdljqdz() {
        return yhdljqdz;
    }

    public void setYhdljqdz(String yhdljqdz) {
        this.yhdljqdz = yhdljqdz == null ? null : yhdljqdz.trim();
    }

    public String getHhsfgq() {
        return hhsfgq;
    }

    public void setHhsfgq(String hhsfgq) {
        this.hhsfgq = hhsfgq == null ? null : hhsfgq.trim();
    }

}
