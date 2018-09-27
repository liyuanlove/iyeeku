package com.iyeeku.ext.safeStrategy.vo;

import com.iyeeku.core.vo.BaseVO;

import java.util.Date;

public class PFArcSecurityStrategyVO extends BaseVO {

    private String aqclzj;

    private String aqclmc;

    private String aqclz;

    private String aqclms;

    private String cjr;

    private Date cjsj;

    private String zhgxr;

    private Date zhgxsj;

    private String ctjjcl;

    private String sfkkz;

    private String jlzt;

    public String getAqclzj() {
        return aqclzj;
    }

    public void setAqclzj(String aqclzj) {
        this.aqclzj = aqclzj == null ? null : aqclzj.trim();
    }

    public String getAqclmc() {
        return aqclmc;
    }

    public void setAqclmc(String aqclmc) {
        this.aqclmc = aqclmc == null ? null : aqclmc.trim();
    }

    public String getAqclz() {
        return aqclz;
    }

    public void setAqclz(String aqclz) {
        this.aqclz = aqclz == null ? null : aqclz.trim();
    }

    public String getAqclms() {
        return aqclms;
    }

    public void setAqclms(String aqclms) {
        this.aqclms = aqclms == null ? null : aqclms.trim();
    }

    public String getCjr() {
        return cjr;
    }

    public void setCjr(String cjr) {
        this.cjr = cjr == null ? null : cjr.trim();
    }

    public Date getCjsj() {
        return cjsj;
    }

    public void setCjsj(Date cjsj) {
        this.cjsj = cjsj;
    }

    public String getZhgxr() {
        return zhgxr;
    }

    public void setZhgxr(String zhgxr) {
        this.zhgxr = zhgxr == null ? null : zhgxr.trim();
    }

    public Date getZhgxsj() {
        return zhgxsj;
    }

    public void setZhgxsj(Date zhgxsj) {
        this.zhgxsj = zhgxsj;
    }

    public String getCtjjcl() {
        return ctjjcl;
    }

    public void setCtjjcl(String ctjjcl) {
        this.ctjjcl = ctjjcl == null ? null : ctjjcl.trim();
    }

    public String getSfkkz() {
        return sfkkz;
    }

    public void setSfkkz(String sfkkz) {
        this.sfkkz = sfkkz == null ? null : sfkkz.trim();
    }

    public String getJlzt() {
        return jlzt;
    }

    public void setJlzt(String jlzt) {
        this.jlzt = jlzt == null ? null : jlzt.trim();
    }


}
