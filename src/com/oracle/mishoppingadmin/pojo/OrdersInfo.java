package com.oracle.mishoppingadmin.pojo;

public class OrdersInfo {
    private long oid;
    private String onum;
    private long ostate;
    private String ocreatetime;
    private String oupdatetime;
    private String addr;
    private String aphone;
    private String nickname;

    public OrdersInfo() {
    }

    public OrdersInfo(long oid, String onum, long ostate, String ocreatetime, String oupdatetime, String addr, String aphone, String nickname) {
        this.oid = oid;
        this.onum = onum;
        this.ostate = ostate;
        this.ocreatetime = ocreatetime;
        this.oupdatetime = oupdatetime;
        this.addr = addr;
        this.aphone = aphone;
        this.nickname = nickname;
    }

    @Override
    public String toString() {
        return "OrdersInfo{" +
                "oid=" + oid +
                ", onum='" + onum + '\'' +
                ", ostate=" + ostate +
                ", ocreatetime='" + ocreatetime + '\'' +
                ", oupdatetime='" + oupdatetime + '\'' +
                ", addr='" + addr + '\'' +
                ", aphone='" + aphone + '\'' +
                ", nickname='" + nickname + '\'' +
                '}';
    }

    public long getOid() {
        return oid;
    }

    public void setOid(long oid) {
        this.oid = oid;
    }

    public String getOnum() {
        return onum;
    }

    public void setOnum(String onum) {
        this.onum = onum;
    }

    public long getOstate() {
        return ostate;
    }

    public void setOstate(long ostate) {
        this.ostate = ostate;
    }

    public String getOcreatetime() {
        return ocreatetime;
    }

    public void setOcreatetime(String ocreatetime) {
        this.ocreatetime = ocreatetime;
    }

    public String getOupdatetime() {
        return oupdatetime;
    }

    public void setOupdatetime(String oupdatetime) {
        this.oupdatetime = oupdatetime;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getAphone() {
        return aphone;
    }

    public void setAphone(String aphone) {
        this.aphone = aphone;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
}
