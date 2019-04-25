package com.oracle.mishoppingadmin.service;

import com.oracle.mishoppingadmin.pojo.OrdersInfo;
import com.oracle.mishoppingadmin.pojo.ProductInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface OrderService {
    /**
     * 显示所有订单列表和数量
     */
    public Map<String,Object>ordersList(HttpServletRequest request, HttpServletResponse response) throws SQLException;

    /**
     * 修改发货状态
     */
    public Boolean sendgoods(HttpServletRequest request, HttpServletResponse response) throws SQLException;

    /**
     * 查看订单详情
     */
    public List<ProductInfo> showdetails (HttpServletRequest request, HttpServletResponse response) throws SQLException;

}
