package com.oracle.mishoppingadmin.service;

import com.oracle.mishoppingadmin.bean.Category;
import com.oracle.mishoppingadmin.bean.Products;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ProductService {
    /**
     * 类别列表
     */
    List<Category> categoryList() throws SQLException;

    /**
     * 添加商品
     */
    boolean addProduct(Products products) throws SQLException;

    /**
     * 商品列表
     */
    List<Map<String, Object>> productInfo() throws SQLException;

    /**
     * 更新商品
     */
    boolean updateProduct(Products products) throws SQLException;

    /**
     * 更新商品状态
     */
    boolean updateProductState(Products products) throws SQLException;

    /**
     * 更新商品类别
     */
    boolean updateProductCategory(Products products) throws SQLException;

    /**
     * 更新商品图片
     */
    boolean updateProductImg(Products products) throws SQLException;


    /**
     * 通过id删除商品
     */
    boolean deleteProductById(Long pid) throws SQLException;
}
