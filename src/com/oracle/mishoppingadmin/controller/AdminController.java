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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminController", urlPatterns = "/admin")
public class AdminController extends HttpServlet {
    private AdminService adminService = new AdminServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        switch (method) {
            case "login":
                login(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            case "checkAdminName":
                checkAdminName(request, response);
                break;
            case "addAdmin":
                addAdmin(request, response);
                break;
            case "adminList":
                adminList(request, response);
                break;
            case "reset":
                reset(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "checkPassword":
                checkPassword(request, response);
                break;
            case "updatePassword":
                updatePassword(request, response);
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
        } else {
            writer.print(false);
        }
        writer.flush();
        writer.close();
    }

    protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        response.sendRedirect("/login.jsp");
    }

    protected void checkAdminName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminname = request.getParameter("adminname");

        Admin admin = new Admin(adminname);
        Admin selectAdmin = null;
        try {
            selectAdmin = adminService.selectAdmin(admin);
        } catch (SQLException ignored) {
        }

        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        writer.print(selectAdmin == null);
        writer.flush();
        writer.close();
    }

    protected void addAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminname = request.getParameter("adminname");
        String adminpassword = request.getParameter("adminpassword");

        boolean b = false;
        if (adminname != null && adminpassword.length() > 5 && adminpassword.length() < 19) {
            Admin admin = new Admin(adminname, adminpassword);

            try {
                b = adminService.addAdmin(admin);
            } catch (SQLException ignored) {
            }
        }

        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        writer.print(b);
    }

    protected void adminList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("loginAdmin") == null){
            request.setAttribute("msg", "请登录！");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }

        List<Admin> admins = null;
        try {
            admins = adminService.AdminList();
        } catch (SQLException ignored) {
        }

        request.setAttribute("admins", admins);
        request.getRequestDispatcher("/html/adminmanage.jsp").forward(request, response);
    }

    /**
     * 重置密码
     */
    protected void reset(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminname = request.getParameter("adminname");

        String password = "666666";
        Admin admin = new Admin(adminname, password);
        boolean b = false;
        try {
            b = adminService.updatePassword(admin);
        } catch (SQLException ignored) {
        }

        PrintWriter writer = response.getWriter();
        writer.print(b);
        writer.flush();
        writer.close();
    }

    /**
     * 删除管理员
     */
    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminname = request.getParameter("adminname");

        Admin admin = new Admin(adminname);
        boolean b = false;
        try {
            b = adminService.deleteAdmin(admin);
        } catch (SQLException ignored) {
        }

        PrintWriter writer = response.getWriter();
        writer.print(b);
        writer.flush();
        writer.close();
    }

    /**
     * 检查密码
     */
    protected void checkPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminname = ((Admin)request.getSession().getAttribute("loginAdmin")).getAdminname();
        String password = request.getParameter("password");

        Admin admin = new Admin(adminname, password);
        Admin selectAdmin = null;
        try {
            selectAdmin = adminService.selectAdmin(admin);
        } catch (SQLException ignored) {
        }

        PrintWriter writer = response.getWriter();
        writer.print(selectAdmin != null);
        writer.flush();
        writer.close();
    }

    /**
     * 更新管理员密码
     */
    protected void updatePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminname = ((Admin)request.getSession().getAttribute("loginAdmin")).getAdminname();
        String newPassword = request.getParameter("newPassword");

        Admin admin = new Admin(adminname, newPassword);
        boolean b = false;
        try {
            b = adminService.updatePassword(admin);
        } catch (SQLException ignored) {
        }

        PrintWriter writer = response.getWriter();
        writer.print(b);
        writer.flush();
        writer.close();
    }
}
