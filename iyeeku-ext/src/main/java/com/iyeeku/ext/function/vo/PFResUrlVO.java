package com.iyeeku.ext.function.vo;

import com.iyeeku.core.vo.BaseVO;

public class PFResUrlVO extends BaseVO {

    private String urlbh;

    private String urlbm;

    private String urllj;

    private String urlms;

    private String urllx;

    public String getUrlbh() {
        return urlbh;
    }

    public void setUrlbh(String urlbh) {
        this.urlbh = urlbh == null ? null : urlbh.trim();
    }

    public String getUrlbm() {
        return urlbm;
    }

    public void setUrlbm(String urlbm) {
        this.urlbm = urlbm == null ? null : urlbm.trim();
    }

    public String getUrllj() {
        return urllj;
    }

    public void setUrllj(String urllj) {
        this.urllj = urllj == null ? null : urllj.trim();
    }

    public String getUrlms() {
        return urlms;
    }

    public void setUrlms(String urlms) {
        this.urlms = urlms == null ? null : urlms.trim();
    }

    public String getUrllx() {
        return urllx;
    }

    public void setUrllx(String urllx) {
        this.urllx = urllx == null ? null : urllx.trim();
    }

}
