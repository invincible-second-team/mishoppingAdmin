package com.oracle.mishoppingadmin.controller;

import com.oracle.mishoppingadmin.bean.Admin;
import com.oracle.mishoppingadmin.service.AdminService;
import com.oracle.mishoppingadmin.service.MlogService;
import com.oracle.mishoppingadmin.service.impl.AdminServiceImpl;
import com.oracle.mishoppingadmin.service.impl.MlogServiceImpl;
import com.oracle.mishoppingadmin.sms.RestUtil;
import com.oracle.mishoppingadmin.util.IPUtil;
import com.oracle.mishoppingadmin.util.RandomValueUtil;
import com.oracle.mishoppingadmin.util.WriteUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginController", urlPatterns = "/login")
public class LoginController extends HttpServlet {
    private MlogService mlogService = new MlogServiceImpl();
    private AdminService adminService = new AdminServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        switch (method) {
            case "login":
                login(request, response);
                break;
            case "validation":
                validation(request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int returnValue = 0;
        String adminname = request.getParameter("adminname");
        String adminpassword = request.getParameter("adminpassword");
        String verificationcode = request.getParameter("verificationcode");
        String code = (String) request.getSession().getAttribute("code");

        Admin admin = new Admin(adminname, adminpassword);
        Admin loginAdmin = null;
        try {
            loginAdmin = adminService.selectAdmin(admin);
        } catch (SQLException ignored) {
        }

        if (loginAdmin != null) {
            returnValue = 1;
            HttpSession session = request.getSession();
            session.setAttribute("loginAdmin", loginAdmin);
        }else {
            WriteUtil.write(response, returnValue);
        }

        if (returnValue == 1 && verificationcode != null && verificationcode.equals(code)) {
            returnValue = 2;
        }

        try {
            String msg = "管理员:" + admin.getAdminname() + "登录，登录IP：" + IPUtil.getIpAddr(request);
            mlogService.insertAmdinMlog(msg, loginAdmin != null ? 1 : 0, loginAdmin);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println(loginAdmin);
        WriteUtil.write(response, returnValue);
    }

    private void validation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phone = request.getParameter("phone");
        String code = RandomValueUtil.verification(6);

        RestUtil.sendSms(code, phone);
        request.getSession().setAttribute("code", code);
    }
}
