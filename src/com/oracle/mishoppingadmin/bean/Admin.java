package com.oracle.mishoppingadmin.bean;


public class Admin {

    private long adminid;
    private String adminname;
    private String adminpassword;

    public Admin() {
    }

    public Admin(String adminname) {
        this.adminname = adminname;
    }

    public Admin(String adminname, String adminpassword) {
        this.adminname = adminname;
        this.adminpassword = adminpassword;
    }

    public long getAdminid() {
        return adminid;
    }

    public void setAdminid(long adminid) {
        this.adminid = adminid;
    }


    public String getAdminname() {
        return adminname;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname;
    }


    public String getAdminpassword() {
        return adminpassword;
    }

    public void setAdminpassword(String adminpassword) {
        this.adminpassword = adminpassword;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminid=" + adminid +
                ", adminname='" + adminname + '\'' +
                ", adminpassword='" + adminpassword + '\'' +
                '}';
    }
}
