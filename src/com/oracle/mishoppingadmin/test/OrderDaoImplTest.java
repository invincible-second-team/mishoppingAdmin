package com.oracle.mishoppingadmin.test;

import com.oracle.mishoppingadmin.bean.Orders;
import com.oracle.mishoppingadmin.dao.OrderDao;
import com.oracle.mishoppingadmin.dao.impl.OrderDaoImpl;
import com.oracle.mishoppingadmin.pojo.OrdersInfo;
import com.oracle.mishoppingadmin.pojo.ProductInfo;
import org.junit.Test;

import java.sql.SQLException;
import java.util.List;

public class OrderDaoImplTest {
    private OrderDao orderDao=new OrderDaoImpl();
    /**
     * 显示未发货订单列表
     * @throws SQLException
     */
    @Test
    public void ordersList() throws SQLException{
        Orders orders=new Orders();
        orders.setOstate(0);
        List<OrdersInfo> l=orderDao.ordersList(orders);
        System.out.println(l);
    }

    /**
     * 显示未发货数量
     */
    @Test
    public void count()throws SQLException{
        Orders orders=new Orders();
        orders.setOstate(0);
        Long l=orderDao.count(orders);
        System.out.println(l);
    }
    /**
     * 修改货物状态
     */
    @Test
    public void goodsstate()throws SQLException{
        Orders orders=new Orders();
        orders.setOstate(1);
        orders.setOid(1);
        boolean b=orderDao.goodsstate(orders);
        System.out.println(b);
    }

    /**
     * 查看订单细节
     */
    @Test
    public void details()throws SQLException{
        Orders orders=new Orders();
        orders.setOid(1);
        List<ProductInfo> l=orderDao.showdetails(orders);
        System.out.println(l);
    }
    /**
     * 统计销售数量
     */
    @Test
    public void msales()throws SQLException{
        List<ProductInfo> l=orderDao.msales();
        System.out.println(l);
    }
}
