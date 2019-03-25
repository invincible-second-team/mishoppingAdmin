package com.oracle.mishoppingadmin.dao;

import com.oracle.mishoppingadmin.bean.Category;
import com.oracle.mishoppingadmin.bean.Products;

import java.sql.SQLException;
import java.util.List;

public interface ProductDao {

    /**
     * 分类列表
     */
    List<Category> categoryList() throws SQLException;

    /**
     * 添加商品
     */
    boolean addProduct(Products products) throws SQLException;

    /**
     * 商品列表
     */
    List<Products> productList() throws SQLException;

    /**
     * 查询分类
     */
    Category selectCategory(long categoryid) throws SQLException;

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
