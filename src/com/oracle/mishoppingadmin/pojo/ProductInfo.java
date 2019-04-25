package com.oracle.mishoppingadmin.pojo;

public class ProductInfo {
    private long pid;
    private long pnum;
    private String pname;
    private double pprice;
    private double ppricediscount;

    public ProductInfo() {
    }

    public ProductInfo(long pid, long pnum, String pname, double pprice, double ppricediscount) {
        this.pid = pid;
        this.pnum = pnum;
        this.pname = pname;
        this.pprice = pprice;
        this.ppricediscount = ppricediscount;
    }

    public long getPid() {
        return pid;
    }

    public void setPid(long pid) {
        this.pid = pid;
    }

    public long getPnum() {
        return pnum;
    }

    public void setPnum(long pnum) {
        this.pnum = pnum;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public double getPprice() {
        return pprice;
    }

    public void setPprice(double pprice) {
        this.pprice = pprice;
    }

    public double getPpricediscount() {
        return ppricediscount;
    }

    public void setPpricediscount(double ppricediscount) {
        this.ppricediscount = ppricediscount;
    }

    @Override
    public String toString() {
        return "ProductInfo{" +
                "pid=" + pid +
                ", pnum=" + pnum +
                ", pname='" + pname + '\'' +
                ", pprice=" + pprice +
                ", ppricediscount=" + ppricediscount +
                '}';
    }
}
