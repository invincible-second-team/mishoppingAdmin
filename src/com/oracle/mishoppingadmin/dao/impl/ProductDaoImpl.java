package com.oracle.mishoppingadmin.dao.impl;

import com.oracle.mishoppingadmin.bean.Category;
import com.oracle.mishoppingadmin.bean.Products;
import com.oracle.mishoppingadmin.dao.ProductDao;
import com.oracle.mishoppingadmin.util.DBUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class ProductDaoImpl implements ProductDao {
    private QueryRunner queryRunner = new QueryRunner(DBUtil.getDataSource());

    @Override
    public List<Category> categoryList() throws SQLException {
        String sql = "select * from category";
        return queryRunner.query(sql, new BeanListHandler<>(Category.class));
    }

    @Override
    public boolean addProduct(Products products) throws SQLException {
        String sql = "insert into products(pname, pprice, pstock, pdes, pimg, pstate, categoryid, ppricediscount)" +
                "values(?,?,?,?,?,?,?,?)";
        int update = queryRunner.update(sql, products.getPname(), products.getPprice(), products.getPstock(),
                products.getPdes(), products.getPimg(), products.getPstate(), products.getCategoryid(),
                products.getPpricediscount());
        return update != 0;
    }

    @Override
    public List<Products> productList() throws SQLException {
        String sql = "select * from products";
        return queryRunner.query(sql, new BeanListHandler<>(Products.class));
    }

    @Override
    public Category selectCategory(long categoryid) throws SQLException {
        String sql = "select * from category where categoryid=?";
        return queryRunner.query(sql, new BeanHandler<>(Category.class), categoryid);
    }

    @Override
    public boolean updateProduct(Products products) throws SQLException {
        String sql = "update products set pname=?,pprice=?,ppricediscount=?,pstock=?,pdes=? where pid=?";

        int update = queryRunner.update(sql, products.getPname(), products.getPprice(), products.getPpricediscount(),
                products.getPstock(), products.getPdes(), products.getPid());
        return update != 0;
    }

    @Override
    public boolean updateProductState(Products products) throws SQLException {
        String sql = "update products set pstate=? where pid=?";

        int update = queryRunner.update(sql, products.getPstate(), products.getPid());
        return update != 0;
    }

    @Override
    public boolean updateProductCategory(Products products) throws SQLException {
        String sql = "update products set categoryid=? where pid=?";

        int update = queryRunner.update(sql, products.getCategoryid(), products.getPid());
        return update != 0;
    }

    @Override
    public boolean updateProductImg(Products products) throws SQLException {
        String sql = "update products set pimg=? where pid=?";

        int update = queryRunner.update(sql, products.getPimg(), products.getPid());
        return update != 0;
    }

    @Override
    public boolean deleteProductById(Long pid) throws SQLException {
        String sql = "delete from products where pid=?";
        int update = queryRunner.update(sql, pid);
        return update != 0;
    }
}
