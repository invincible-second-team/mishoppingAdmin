package com.oracle.mishoppingadmin.bean;


public class Mlog {

    private long mid;
    private String message;
    private int success;
    private String mdate;
    private long adminid;


    public long getMid() {
        return mid;
    }

    public void setMid(long mid) {
        this.mid = mid;
    }


    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }


    public int getSuccess() {
        return success;
    }

    public void setSuccess(int success) {
        this.success = success;
    }


    public String getMdate() {
        return mdate;
    }

    public void setMdate(String mdate) {
        this.mdate = mdate;
    }


    public long getAdminid() {
        return adminid;
    }

    public void setAdminid(long adminid) {
        this.adminid = adminid;
    }

    @Override
    public String toString() {
        return "Mlog{" +
                "mid=" + mid +
                ", message='" + message + '\'' +
                ", success=" + success +
                ", mdate='" + mdate + '\'' +
                ", adminid=" + adminid +
                '}';
    }
}
