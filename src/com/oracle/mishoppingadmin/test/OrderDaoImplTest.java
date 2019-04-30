package com.oracle.mishoppingadmin.test;

import com.oracle.mishoppingadmin.bean.Orders;
import com.oracle.mishoppingadmin.dao.OrderDao;
import com.oracle.mishoppingadmin.dao.impl.OrderDaoImpl;
import com.oracle.mishoppingadmin.pojo.OrdersInfo;
import com.oracle.mishoppingadmin.pojo.ProductInfo;
import com.oracle.mishoppingadmin.util.DBUtil;
import com.oracle.mishoppingadmin.util.OrderUtil;
import com.oracle.mishoppingadmin.util.RandomValueUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.junit.Test;

import java.sql.SQLException;
import java.util.List;

public class OrderDaoImplTest {
    private OrderDao orderDao = new OrderDaoImpl();

    /**
     * 显示未发货订单列表
     *
     * @throws SQLException
     */
    @Test
    public void ordersList() throws SQLException {
        Orders orders = new Orders();
        orders.setOstate(1);
        List<OrdersInfo> l = orderDao.ordersList(orders);
        System.out.println(l.size());
        System.out.println(l);
    }

    /**
     * 显示未发货数量
     */
    @Test
    public void count() throws SQLException {
        Orders orders = new Orders();
        orders.setOstate(2);
        Long l = orderDao.count(orders);
        System.out.println(l);
    }

    /**
     * 修改货物状态
     */
    @Test
    public void goodsstate() throws SQLException {
        Orders orders = new Orders();
        orders.setOstate(1);
        orders.setOid(1);
        boolean b = orderDao.goodsstate(orders);
        System.out.println(b);
    }

    /**
     * 查看订单细节
     */
    @Test
    public void details() throws SQLException {
        Orders orders = new Orders();
        orders.setOid(1);
        List<ProductInfo> l = orderDao.showdetails(orders);
        System.out.println(l);
    }

    /**
     * 统计销售数量
     */
    @Test
    public void msales() throws SQLException {
        List<ProductInfo> l = orderDao.msales();
        System.out.println(l);
    }

    @Test
    public void addOrders() throws SQLException {

        for (int i = 0; i < 500; i++) {
            QueryRunner qr = new QueryRunner(DBUtil.getDataSource());

            String sql = "insert into orders (onum, ostate, ocreatetime, oupdatetime,aid) values (?,?,?,?,?);";
            int update = qr.update(sql, OrderUtil.getOrderIdByTime(), RandomValueUtil.getNum(0, 3), OrderUtil.getNowTime(), OrderUtil.getNowTime(), RandomValueUtil.getNum(1, 50));
            System.out.println(update);
        }
    }


    @Test
    public void productorder() throws SQLException {

        for (int i = 0; i < 500; i++) {
            QueryRunner qr = new QueryRunner(DBUtil.getDataSource());

            String sql = "insert into productsorder ( pid,oid,pnum) values (?,?,?);";
            int update = qr.update(sql, RandomValueUtil.getNum(200, 350), RandomValueUtil.getNum(1, 500), RandomValueUtil.getNum(0, 15));
            System.out.println(update);
        }
    }


}
