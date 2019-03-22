package com.oracle.mishoppingadmin.test;

import com.oracle.mishoppingadmin.bean.Category;
import com.oracle.mishoppingadmin.bean.Products;
import com.oracle.mishoppingadmin.dao.ProductDao;
import com.oracle.mishoppingadmin.dao.impl.ProductDaoImpl;
import org.junit.Test;

import java.sql.SQLException;
import java.util.List;

public class ProductDaoImplTest {
    ProductDao productDao = new ProductDaoImpl();

    @Test
    public void categoryList() throws SQLException {
        List<Category> categories = productDao.categoryList();
        System.out.println(categories);
    }

    @Test
    public void addProduct() throws SQLException {
        Products products = new Products();
        products.setPimg("123");
        products.setPstock(12);
        products.setPpricediscount(0.75);
        products.setPprice(30);
        products.setPdes("4564");
        products.setPstate(1);
        products.setCategoryid(2);
        products.setPname("小米6");
        boolean b = productDao.addProduct(products);
        System.out.println(b);
    }
}
