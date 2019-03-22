package com.oracle.mishoppingadmin.bean;


public class Category {

    private long categoryid;
    private String categoryname;

    public Category() {
    }

    public Category(String categoryname) {
        this.categoryname = categoryname;
    }

    public long getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(long categoryid) {
        this.categoryid = categoryid;
    }


    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname;
    }

    @Override
    public String toString() {
        return "Category{" +
                "categoryid=" + categoryid +
                ", categoryname='" + categoryname + '\'' +
                '}';
    }
}
