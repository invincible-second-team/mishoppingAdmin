package com.oracle.mishoppingadmin.test;

import com.oracle.mishoppingadmin.bean.Category;
import com.oracle.mishoppingadmin.bean.Products;
import com.oracle.mishoppingadmin.dao.ProductDao;
import com.oracle.mishoppingadmin.dao.impl.ProductDaoImpl;
import com.oracle.mishoppingadmin.util.ChineseUtils;
import com.oracle.mishoppingadmin.util.RandomValueUtil;
import org.junit.Test;

import java.sql.SQLException;
import java.util.List;

public class ProductDaoImplTest {
    private ProductDao productDao = new ProductDaoImpl();

    @Test
    public void categoryList() throws SQLException {
        List<Category> categories = productDao.categoryList();
        System.out.println(categories);
    }

    @Test
    public void addProduct() throws SQLException {
        for (int i = 0; i < 50; i++) {
            Products products = new Products();
            products.setPimg("computer" + RandomValueUtil.getNum(1, 13) + ".jpg");
            products.setPstock(RandomValueUtil.getNum(200, 300));

            double discount = RandomValueUtil.getDouble(0.2, 1);
            products.setPpricediscount(discount < 0.5 ? 1 : discount);
            products.setPprice(RandomValueUtil.getNum(4000, 8000));
            products.setPdes(ChineseUtils.getRandomLengthChiness(20, 50));
            products.setPstate(RandomValueUtil.getNum(0, 1));
            products.setCategoryid(3);
            products.setPname("小米电脑" + i);
            boolean b = productDao.addProduct(products);
            System.out.println(b);
        }
    }

    @Test
    public void productList() throws SQLException {
        List<Products> products = productDao.productList();
        System.out.println(products);
    }

    @Test
    public void selectCategory() throws SQLException {
        Category category = productDao.selectCategory(1);
        System.out.println(category);
    }

    @Test
    public void updateProduct() throws SQLException {
        Products products = new Products();
        products.setPname("123");
        products.setPid(19);
        products.setPprice(15);
        products.setPstock(231);
        products.setPdes("fdgdgdsgsdf");
        products.setPpricediscount(0.4);

        boolean b = productDao.updateProduct(products);
        System.out.println(b);
    }

    @Test
    public void updateProductState() throws SQLException {
        Products products = new Products();
        products.setPid(19);
        products.setPstate(0);

        boolean b = productDao.updateProductState(products);
        System.out.println(b);
    }
}
