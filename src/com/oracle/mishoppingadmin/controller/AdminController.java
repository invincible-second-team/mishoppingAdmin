package com.oracle.mishoppingadmin.controller;

import com.oracle.mishoppingadmin.bean.Admin;
import com.oracle.mishoppingadmin.service.AdminService;
import com.oracle.mishoppingadmin.service.impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "AdminController", urlPatterns = "/admin")
public class AdminController extends HttpServlet {
    private AdminService adminService = new AdminServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        switch (method){
            case "login":
                login(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminname = request.getParameter("adminname");
        String adminpassword = request.getParameter("adminpassword");

        Admin admin = new Admin(adminname, adminpassword);
        Admin loginAdmin = null;
        try {
            loginAdmin = adminService.selectAdmin(admin);
        } catch (SQLException ignored) {
        }

        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        if (loginAdmin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loginAdmin", loginAdmin);
            writer.print(true);
        }else {
            writer.print(false);
        }
    }

    protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        response.sendRedirect("/login.jsp");
    }
}
