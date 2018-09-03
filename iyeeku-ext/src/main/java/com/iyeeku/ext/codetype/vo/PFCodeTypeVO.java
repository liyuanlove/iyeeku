package com.iyeeku.ext.codetype.vo;

import com.iyeeku.core.vo.BaseVO;

public class PFCodeTypeVO extends BaseVO {

    private static final long serialVersionUID = 1L;

    private String zj;

    private String sjlxbh;

    private String sjlxmc;

    private String sjlxms;

    private Integer pxh;

    private String jlzt;

    private String sfzccj;

    private String mblx;

    public String getZj() {
        return zj;
    }

    public void setZj(String zj) {
        this.zj = zj == null ? null : zj.trim();
    }

    public String getSjlxbh() {
        return sjlxbh;
    }

    public void setSjlxbh(String sjlxbh) {
        this.sjlxbh = sjlxbh == null ? null : sjlxbh.trim();
    }

    public String getSjlxmc() {
        return sjlxmc;
    }

    public void setSjlxmc(String sjlxmc) {
        this.sjlxmc = sjlxmc == null ? null : sjlxmc.trim();
    }

    public String getSjlxms() {
        return sjlxms;
    }

    public void setSjlxms(String sjlxms) {
        this.sjlxms = sjlxms == null ? null : sjlxms.trim();
    }

    public Integer getPxh() {
        return pxh;
    }

    public void setPxh(Integer pxh) {
        this.pxh = pxh;
    }

    public String getJlzt() {
        return jlzt;
    }

    public void setJlzt(String jlzt) {
        this.jlzt = jlzt == null ? null : jlzt.trim();
    }

    public String getSfzccj() {
        return sfzccj;
    }

    public void setSfzccj(String sfzccj) {
        this.sfzccj = sfzccj == null ? null : sfzccj.trim();
    }

    public String getMblx() {
        return mblx;
    }

    public void setMblx(String mblx) {
        this.mblx = mblx == null ? null : mblx.trim();
    }

}
