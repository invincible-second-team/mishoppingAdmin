package com.oracle.mishoppingadmin.dao.impl;

import com.oracle.mishoppingadmin.bean.Category;
import com.oracle.mishoppingadmin.bean.Products;
import com.oracle.mishoppingadmin.dao.ProductDao;
import com.oracle.mishoppingadmin.util.DBUtil;
import org.apache.commons.dbutils.QueryRunner;
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
}
