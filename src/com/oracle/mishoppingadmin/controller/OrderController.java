package com.oracle.mishoppingadmin.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.oracle.mishoppingadmin.bean.Admin;
import com.oracle.mishoppingadmin.pojo.ProductInfo;
import com.oracle.mishoppingadmin.service.MlogService;
import com.oracle.mishoppingadmin.service.OrderService;
import com.oracle.mishoppingadmin.service.impl.MlogServiceImpl;
import com.oracle.mishoppingadmin.service.impl.OrderServiceImpl;
import com.oracle.mishoppingadmin.util.WriterUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
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
            case "msales":
                msales(request,response);
                break;

        }
    }

    /**
     * 查询月销售量
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void msales(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductInfo> ml=null;
        try {
            ml=orderService.msales(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        JSONArray array= JSONArray.parseArray(JSON.toJSONString(ml));

        System.out.println(array.toString());
        PrintWriter writer = response.getWriter();
        writer.print(array.toString());
        writer.flush();
        writer.close();

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
            mlogService.insertUserLog(request,b?1:0,(Admin)request.getSession().getAttribute("loginAdmin"));
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

        System.out.println(ordersList);
        request.setAttribute("ordersList",ordersList);
        request.getRequestDispatcher("/html/ordermanage.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
