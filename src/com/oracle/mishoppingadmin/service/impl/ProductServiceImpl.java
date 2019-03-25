package com.oracle.mishoppingadmin.service.impl;

import com.oracle.mishoppingadmin.bean.Category;
import com.oracle.mishoppingadmin.bean.Products;
import com.oracle.mishoppingadmin.dao.ProductDao;
import com.oracle.mishoppingadmin.dao.impl.ProductDaoImpl;
import com.oracle.mishoppingadmin.service.ProductService;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public List<Map<String, Object>> productInfo() throws SQLException {
        List<Products> products = productDao.productList();

        List<Map<String, Object>> list = new ArrayList<>();
        for (Products product : products) {
            Map<String, Object> map = new HashMap<>();
            Long pid = product.getPid();
            String pname = product.getPname();
            double pprice = product.getPprice();
            long pstock = product.getPstock();
            String pdes = product.getPdes();
            String pimg = product.getPimg();
            long pstate = product.getPstate();
            long categoryid = product.getCategoryid();
            String categoryname = productDao.selectCategory(categoryid).getCategoryname();
            double ppricediscount = product.getPpricediscount();

            map.put("pid", pid);
            map.put("pname", pname);
            map.put("pprice", pprice);
            map.put("pstock", pstock);
            map.put("pdes", pdes);
            map.put("pimg", pimg);
            map.put("pstate", pstate);
            map.put("categoryid", categoryid);
            map.put("categoryname", categoryname);
            map.put("ppricediscount", ppricediscount);

            list.add(map);
        }
        return list;
    }

    @Override
    public boolean updateProduct(Products products) throws SQLException {
        return productDao.updateProduct(products);
    }

    @Override
    public boolean updateProductState(Products products) throws SQLException {
        return productDao.updateProductState(products);
    }

    @Override
    public boolean updateProductCategory(Products products) throws SQLException {
        return productDao.updateProductCategory(products);
    }

    @Override
    public boolean updateProductImg(Products products) throws SQLException {
        return productDao.updateProductImg(products);
    }

    @Override
    public boolean deleteProductById(Long pid) throws SQLException {
        return productDao.deleteProductById(pid);
    }
}
