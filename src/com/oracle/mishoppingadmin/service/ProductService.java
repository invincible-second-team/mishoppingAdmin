package com.oracle.mishoppingadmin.service;

import com.oracle.mishoppingadmin.bean.Category;
import com.oracle.mishoppingadmin.bean.Products;

import java.sql.SQLException;
import java.util.List;

public interface ProductService {
    List<Category> categoryList() throws SQLException;

    boolean addProduct(Products products) throws SQLException;
}
