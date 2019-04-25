package com.oracle.mishoppingadmin.service.impl;

import com.oracle.mishoppingadmin.bean.Orders;
import com.oracle.mishoppingadmin.dao.OrderDao;
import com.oracle.mishoppingadmin.dao.impl.OrderDaoImpl;
import com.oracle.mishoppingadmin.pojo.ProductInfo;
import com.oracle.mishoppingadmin.service.OrderService;
import com.oracle.mishoppingadmin.pojo.OrdersInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrderServiceImpl implements OrderService {
    private OrderDao orderDao = new OrderDaoImpl();

    /**
     * 显示订单列表
     * @param request
     * @param response
     * @return
     * @throws SQLException
     */
    @Override
    public Map<String, Object> ordersList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        Long nosendostate = Long.valueOf(request.getParameter("state"));
        Long hassendostate = 1L;
        Long signsendostate = 2L;
        Long errorsendostate = 5L;

        Orders nosendorders = new Orders(nosendostate);
        Orders hassendorders = new Orders(hassendostate);
        Orders signsendorders = new Orders(signsendostate);
        Orders errorsendorders = new Orders(errorsendostate);

        Map<String, Object> map = new HashMap<>();
        /**
         * 未发货列表
         */
        List<OrdersInfo> nosendordersList = orderDao.ordersList(nosendorders);
        Long nosendcount = orderDao.count(nosendorders);
        Long hassendcount = orderDao.count(hassendorders);
        Long signsendcount = orderDao.count(signsendorders);
        Long errorsendcount = orderDao.count(errorsendorders);
        System.out.println(hassendcount);

        /**
         * 已发货列表
         */
        List<OrdersInfo> hassendorderList = orderDao.ordersList(hassendorders);

        /**
         * 已签收列表
         */
        List<OrdersInfo> signsendorderList = orderDao.ordersList(signsendorders);

        /**
         * 异常订单列表
         */
        List<OrdersInfo> errorsendorderList = orderDao.ordersList(errorsendorders);

        map.put("nosendList", nosendordersList);
        map.put("hassendList", hassendorderList);
        map.put("signrList", signsendorderList);
        map.put("errorList", errorsendorderList);
        map.put("nosendcount", nosendcount);
        map.put("hassendcount", hassendcount);
        map.put("signsendcount", signsendcount);
        map.put("errorsendcount", errorsendcount);

        return map;
    }

    /**
     * 修改发货状态
     *
     * @param request
     * @param response
     * @return
     * @throws SQLException
     */
    @Override
    public Boolean sendgoods(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        Long oid = Long.valueOf(request.getParameter("oid"));
        Long ostate = 1L;
        Orders orders = new Orders(oid, ostate);
        Boolean b = orderDao.goodsstate(orders);
        return b;
    }

    /**
     * 查看订单细节
     *
     * @param request
     * @param response
     * @return
     * @throws SQLException
     */
    @Override
    public List<ProductInfo> showdetails(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        Long oid = Long.valueOf(request.getParameter("oid"));
        Orders orders = new Orders();
        orders.setOid(oid);
        List<ProductInfo> details = orderDao.showdetails(orders);
        System.out.println("service" + details);
        return details;
    }

}
