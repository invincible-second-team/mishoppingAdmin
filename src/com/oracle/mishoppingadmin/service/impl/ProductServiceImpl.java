package com.oracle.mishoppingadmin.service.impl;

import com.oracle.mishoppingadmin.bean.Category;
import com.oracle.mishoppingadmin.bean.Products;
import com.oracle.mishoppingadmin.dao.ProductDao;
import com.oracle.mishoppingadmin.dao.impl.ProductDaoImpl;
import com.oracle.mishoppingadmin.service.ProductService;

import java.sql.SQLException;
import java.util.List;

public class ProductServiceImpl implements ProductService {
    private ProductDao productDao = new ProductDaoImpl();

    @Override
    public List<Category> categoryList() throws SQLException {
        return productDao.categoryList();
    }

    @Override
    public boolean addProduct(Products products) throws SQLException {
        return productDao.addProduct(products);
    }
}
