package com.iyeeku.ext.function.vo;

import java.util.ArrayList;
import java.util.List;

public class PFResMenuVO {

    private String cdbh;

    private String cdbm;

    private String cdmc;

    private String cdurl;

    private String sjcdbh;

    private Integer cdsxh;

    private String cdtp;

    private String sfxdlj;

    private String cddkckszwz;

    private String cdzxkjbh;

    private String cdsfky;

    private String cdsfkj;

    private String cddkfs;

    private String cdlx;

    /*========================  extends ====================*/

    private String sjcdmc;

    private List<PFResMenuVO> children = new ArrayList<>();

    public String getCdbh() {
        return cdbh;
    }

    public void setCdbh(String cdbh) {
        this.cdbh = cdbh == null ? null : cdbh.trim();
    }

    public String getCdbm() {
        return cdbm;
    }

    public void setCdbm(String cdbm) {
        this.cdbm = cdbm == null ? null : cdbm.trim();
    }

    public String getCdmc() {
        return cdmc;
    }

    public void setCdmc(String cdmc) {
        this.cdmc = cdmc == null ? null : cdmc.trim();
    }

    public String getCdurl() {
        return cdurl;
    }

    public void setCdurl(String cdurl) {
        this.cdurl = cdurl == null ? null : cdurl.trim();
    }

    public String getSjcdbh() {
        return sjcdbh;
    }

    public void setSjcdbh(String sjcdbh) {
        this.sjcdbh = sjcdbh == null ? null : sjcdbh.trim();
    }

    public Integer getCdsxh() {
        return cdsxh;
    }

    public void setCdsxh(Integer cdsxh) {
        this.cdsxh = cdsxh;
    }

    public String getCdtp() {
        return cdtp;
    }

    public void setCdtp(String cdtp) {
        this.cdtp = cdtp == null ? null : cdtp.trim();
    }

    public String getSfxdlj() {
        return sfxdlj;
    }

    public void setSfxdlj(String sfxdlj) {
        this.sfxdlj = sfxdlj == null ? null : sfxdlj.trim();
    }

    public String getCddkckszwz() {
        return cddkckszwz;
    }

    public void setCddkckszwz(String cddkckszwz) {
        this.cddkckszwz = cddkckszwz == null ? null : cddkckszwz.trim();
    }

    public String getCdzxkjbh() {
        return cdzxkjbh;
    }

    public void setCdzxkjbh(String cdzxkjbh) {
        this.cdzxkjbh = cdzxkjbh == null ? null : cdzxkjbh.trim();
    }

    public String getCdsfky() {
        return cdsfky;
    }

    public void setCdsfky(String cdsfky) {
        this.cdsfky = cdsfky == null ? null : cdsfky.trim();
    }

    public String getCdsfkj() {
        return cdsfkj;
    }

    public void setCdsfkj(String cdsfkj) {
        this.cdsfkj = cdsfkj == null ? null : cdsfkj.trim();
    }

    public String getCddkfs() {
        return cddkfs;
    }

    public void setCddkfs(String cddkfs) {
        this.cddkfs = cddkfs == null ? null : cddkfs.trim();
    }

    public String getCdlx() {
        return cdlx;
    }

    public void setCdlx(String cdlx) {
        this.cdlx = cdlx == null ? null : cdlx.trim();
    }

    public List<PFResMenuVO> getChildren() {
        return children;
    }

    public void setChildren(List<PFResMenuVO> children) {
        this.children = children;
    }

    public String getSjcdmc() {
        return sjcdmc;
    }

    public void setSjcdmc(String sjcdmc) {
        this.sjcdmc = sjcdmc;
    }

}
