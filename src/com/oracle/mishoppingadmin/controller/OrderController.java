package com.oracle.mishoppingadmin.controller;

import com.oracle.mishoppingadmin.bean.Admin;
import com.oracle.mishoppingadmin.dao.MlogDao;
import com.oracle.mishoppingadmin.pojo.ProductInfo;
import com.oracle.mishoppingadmin.service.MlogService;
import com.oracle.mishoppingadmin.service.OrderService;
import com.oracle.mishoppingadmin.service.impl.MlogServiceImpl;
import com.oracle.mishoppingadmin.service.impl.OrderServiceImpl;
import com.oracle.mishoppingadmin.util.WriterUtil;
import com.oracle.mishoppingadmin.pojo.OrdersInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;


@WebServlet(name = "OrderController",urlPatterns = "/Order")
public class OrderController extends HttpServlet {
    private OrderService orderService=new OrderServiceImpl();
    private MlogService mlogService=new MlogServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method=request.getParameter("method");
        switch (method){
            case "ordersList":
                ordersList(request,response);
                break;
            case "sendgood":
                sendgood(request,response);
                break;
            case "showdetails":
                showdetails(request,response);
                break;

        }
    }

    /**
     * 查看订单细节
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void showdetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductInfo> details =null;
        try {
            details=orderService.showdetails(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(details);

        request.setAttribute("details",details);
        request.getRequestDispatcher("/html/orderdetails.jsp").forward(request, response);

    }
    /**
     * 修改发货状态
     */
    protected void sendgood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Boolean b=false;
        try {
            b=orderService.sendgoods(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            mlogService.insertAddUserlog(request,b?1:0,(Admin)request.getSession().getAttribute("loginAdmin"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        WriterUtil.writer(b,response);
    }

    /**
     * 查询所有订单和数量
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void ordersList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       Map<String,Object> ordersList=null;
        try {
            ordersList=orderService.ordersList(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("ordersList",ordersList);
        request.getRequestDispatcher("/html/ordermanage.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
