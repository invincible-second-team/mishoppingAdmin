package com.oracle.mishoppingadmin.dao.impl;

import com.oracle.mishoppingadmin.bean.Orders;
import com.oracle.mishoppingadmin.dao.OrderDao;
import com.oracle.mishoppingadmin.pojo.ProductInfo;
import com.oracle.mishoppingadmin.util.DBUtil;
import com.oracle.mishoppingadmin.pojo.OrdersInfo;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class OrderDaoImpl implements OrderDao {
    private QueryRunner queryRunner = new QueryRunner(DBUtil.getDataSource());
    /**
     * 显示发货订单列表
     * @return
     * @throws SQLException
     */
    @Override
    public List<OrdersInfo> ordersList(Orders orders) throws SQLException {
        String sql="select orders.*,addr,aphone,nickname from orders,address,users where orders.aid = address.aid and address.uid = users.uid and ostate= ?";
        return queryRunner.query(sql,new BeanListHandler<OrdersInfo>(OrdersInfo.class),orders.getOstate());
    }

    /**
     * 显示各种类型订单的数量
     */
    public Long count(Orders orders) throws SQLException {
        String sql="select count(*) from orders where ostate= ?";
        return queryRunner.query(sql,new ScalarHandler<>(),orders.getOstate());
    }

    /**
     * 修改货物状态
     * @param orders
     * @return
     * @throws SQLException
     */
    @Override
    public Boolean goodsstate(Orders orders) throws SQLException {
        String sql="update orders set ostate=? where oid=?";
        int update=queryRunner.update(sql,orders.getOstate(),orders.getOid());
        return update!=0;
    }

    @Override
    public List<ProductInfo> showdetails(Orders orders) throws SQLException {
        String sql="select products.pid,pname,pprice,ppricediscount,pnum from products,productsorder,orders where productsorder.oid = orders.oid and products.pid = productsorder.pid and orders.oid = ?";
        return queryRunner.query(sql,new BeanListHandler<ProductInfo>(ProductInfo.class),orders.getOid());
    }


}
