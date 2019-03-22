package com.oracle.mishoppingadmin.dao;

import com.oracle.mishoppingadmin.bean.Category;
import com.oracle.mishoppingadmin.bean.Products;

import java.sql.SQLException;
import java.util.List;

public interface ProductDao {

    List<Category> categoryList() throws SQLException;

    boolean addProduct(Products products) throws SQLException;
}
