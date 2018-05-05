package com.iyeeku.user.vo;

import com.iyeeku.core.vo.BaseVO;

public class BlogInfoVO extends BaseVO {

    private String blogid;
    private String userid;
    private String title;
    private String digest;
    private String content;
    private String curl;
    private String attachid;
    private String btype;
    private String visibleflag;
    private String commentflag;
    private String topflag;
    private Integer readnum;
    private Integer collectnum;
    private Integer thumbsnum;
    private String publishtime;
    private String delflag;
    private String ext1;

    public String getBlogid() {
        return blogid;
    }

    public void setBlogid(String blogid) {
        this.blogid = blogid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDigest() {
        return digest;
    }

    public void setDigest(String digest) {
        this.digest = digest;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCurl() {
        return curl;
    }

    public void setCurl(String curl) {
        this.curl = curl;
    }

    public String getAttachid() {
        return attachid;
    }

    public void setAttachid(String attachid) {
        this.attachid = attachid;
    }

    public String getBtype() {
        return btype;
    }

    public void setBtype(String btype) {
        this.btype = btype;
    }

    public String getVisibleflag() {
        return visibleflag;
    }

    public void setVisibleflag(String visibleflag) {
        this.visibleflag = visibleflag;
    }

    public String getCommentflag() {
        return commentflag;
    }

    public void setCommentflag(String commentflag) {
        this.commentflag = commentflag;
    }

    public String getTopflag() {
        return topflag;
    }

    public void setTopflag(String topflag) {
        this.topflag = topflag;
    }

    public Integer getReadnum() {
        return readnum;
    }

    public void setReadnum(Integer readnum) {
        this.readnum = readnum;
    }

    public Integer getCollectnum() {
        return collectnum;
    }

    public void setCollectnum(Integer collectnum) {
        this.collectnum = collectnum;
    }

    public Integer getThumbsnum() {
        return thumbsnum;
    }

    public void setThumbsnum(Integer thumbsnum) {
        this.thumbsnum = thumbsnum;
    }

    public String getPublishtime() {
        return publishtime;
    }

    public void setPublishtime(String publishtime) {
        this.publishtime = publishtime;
    }

    public String getDelflag() {
        return delflag;
    }

    public void setDelflag(String delflag) {
        this.delflag = delflag;
    }

    public String getExt1() {
        return ext1;
    }

    public void setExt1(String ext1) {
        this.ext1 = ext1;
    }
}
