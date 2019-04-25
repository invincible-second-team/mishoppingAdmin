package com.oracle.mishoppingadmin.dao;

import com.oracle.mishoppingadmin.bean.Orders;
import com.oracle.mishoppingadmin.pojo.OrdersInfo;
import com.oracle.mishoppingadmin.pojo.ProductInfo;

import java.sql.SQLException;
import java.util.List;

public interface OrderDao {


    /**
     * 显示发货订单列表
     */
    public List<OrdersInfo> ordersList(Orders orders) throws SQLException;

    /**
     * 显示各状态订单的数量
     */
    public Long count(Orders orders) throws SQLException;

    /**
     * 修改发货状态
     */
    public Boolean goodsstate(Orders orders) throws SQLException;

    /**
     * 显示订单详情
     */
    public List<ProductInfo>showdetails(Orders orders) throws SQLException;

}
