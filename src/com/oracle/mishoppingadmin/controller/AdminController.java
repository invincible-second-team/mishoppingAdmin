package com.oracle.mishoppingadmin.controller;

import com.oracle.mishoppingadmin.bean.Admin;
import com.oracle.mishoppingadmin.bean.Mlog;
import com.oracle.mishoppingadmin.service.AdminService;
import com.oracle.mishoppingadmin.service.MlogService;
import com.oracle.mishoppingadmin.service.impl.AdminServiceImpl;
import com.oracle.mishoppingadmin.service.impl.MlogServiceImpl;
import com.oracle.mishoppingadmin.util.ExcelUtil;
import com.oracle.mishoppingadmin.util.WriteUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "AdminController", urlPatterns = "/admin")
public class AdminController extends HttpServlet {
    private AdminService adminService = new AdminServiceImpl();
    private MlogService mlogService = new MlogServiceImpl();

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
                break;
            case "logList":
                logList(request, response);
                break;
            case "exportFile":
                exportFile(request, response);
                break;
            case "download":
                download(request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private void exportFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        String pathname = "backlog" + System.currentTimeMillis() + ".xls";

        System.out.println(startTime + "----------" + endTime);
        List<Mlog> mlogs = null;
        try {
            if (!"".equals(startTime) && !"".equals(endTime)) {
                mlogs = mlogService.selectLogByTime(startTime, endTime);
            } else {
                mlogs = mlogService.selectLog();
            }
        } catch (SQLException ignored) {
        }

        if (mlogs != null) {
            try {
                ExcelUtil.export(Arrays.asList("mdate", "message"), "后台日志", mlogs, pathname);
                WriteUtil.write(response, pathname);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private void download(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathname = request.getParameter("filename");
        mlogService.download(request, response, pathname);
        new File(pathname).delete();
    }

    private void logList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Mlog> mlogs = null;
        try {
            mlogs = mlogService.selectLog();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("mlogs", mlogs);
        request.getRequestDispatcher("html/logmanage.jsp").forward(request, response);
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

        if (loginAdmin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loginAdmin", loginAdmin);
        }

        try {
            mlogService.insertAmdinMlog(request, loginAdmin != null ? 1 : 0, loginAdmin);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        WriteUtil.write(response, loginAdmin != null);
    }

    protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            mlogService.insertAmdinMlog(request, 1, (Admin) request.getSession().getAttribute("loginAdmin"));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

    protected void checkAdminName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminname = request.getParameter("adminname");

        Admin admin = new Admin(adminname);
        Admin selectAdmin = null;
        try {
            selectAdmin = adminService.selectAdmin(admin);
        } catch (SQLException ignored) {
        }

        WriteUtil.write(response, selectAdmin == null);
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

        try {
            mlogService.insertAmdinMlog(request, b ? 1 : 0, (Admin) request.getSession().getAttribute("loginAdmin"));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        WriteUtil.write(response, b);
    }

    protected void adminList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("loginAdmin") == null) {
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

        try {
            mlogService.insertAmdinMlog(request, b ? 1 : 0, (Admin) request.getSession().getAttribute("loginAdmin"));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        WriteUtil.write(response, b);
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

        try {
            mlogService.insertAmdinMlog(request, b ? 1 : 0, (Admin) request.getSession().getAttribute("loginAdmin"));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        WriteUtil.write(response, b);
    }

    /**
     * 检查密码
     */
    protected void checkPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminname = ((Admin) request.getSession().getAttribute("loginAdmin")).getAdminname();
        String password = request.getParameter("password");

        Admin admin = new Admin(adminname, password);
        Admin selectAdmin = null;
        try {
            selectAdmin = adminService.selectAdmin(admin);
        } catch (SQLException ignored) {
        }

        WriteUtil.write(response, selectAdmin != null);
    }

    /**
     * 更新管理员密码
     */
    protected void updatePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminname = ((Admin) request.getSession().getAttribute("loginAdmin")).getAdminname();
        String newPassword = request.getParameter("newPassword");

        Admin admin = new Admin(adminname, newPassword);
        boolean b = false;
        try {
            b = adminService.updatePassword(admin);
        } catch (SQLException ignored) {
        }

        try {
            mlogService.insertAmdinMlog(request, b ? 1 : 0, (Admin) request.getSession().getAttribute("loginAdmin"));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        WriteUtil.write(response, b);
    }


}
