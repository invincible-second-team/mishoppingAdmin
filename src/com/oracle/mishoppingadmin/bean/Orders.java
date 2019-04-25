package com.oracle.mishoppingadmin.bean;

public class Orders {

    private long oid;
    private String onum;
    private long ostate;
    private String ocreatetime;
    private String oupdatetime;


    public Orders() {
    }

    public Orders(long ostate) {
        this.ostate = ostate;
    }

    public Orders(long oid, long ostate) {
        this.oid = oid;
        this.ostate = ostate;
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

    @Override
    public String toString() {
        return "Orders{" +
                "oid=" + oid +
                ", onum='" + onum + '\'' +
                ", ostate=" + ostate +
                ", ocreatetime='" + ocreatetime + '\'' +
                ", oupdatetime='" + oupdatetime + '\'' +
                '}';
    }
}
