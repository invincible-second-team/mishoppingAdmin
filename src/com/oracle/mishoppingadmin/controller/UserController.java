package com.oracle.mishoppingadmin.controller;

import com.oracle.mishoppingadmin.bean.Users;
import com.oracle.mishoppingadmin.dao.UserDao;
import com.oracle.mishoppingadmin.service.UserService;
import com.oracle.mishoppingadmin.service.impl.UserServiceImpl;
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

@WebServlet(name = "UserController", urlPatterns = "/User")
public class UserController extends HttpServlet {
    private UserService userService = new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        switch (method) {
            case "checkUserName":
                checkUserName(request, response);
                break;
            case "addUsers":
                addUsers(request, response);
                break;
            case "usersList":
                usersList(request, response);
                break;
            case "modificition":
                modificition(request, response);
                break;
            case  "unblock":
                unblock(request, response);
                break;
            case "deleteuser":
                deleteuser(request, response);
                break;
        }
    }


    /**
     * 删除用户
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void deleteuser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean b=false;
        try {
            b=userService.deleteuser(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        WriterUtil.writer(b,response);
    }

    /**
     * 修改用户状态
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void unblock(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean b=false;
        try {
            b=userService.unblock(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        WriterUtil.writer(b,response);

    }

    /**
     * 修改用户资料
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void modificition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean b=false;
        try {
            b=userService.modificition(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        WriterUtil.writer(b,response);

    }
    /**
     * 显示用户列表
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void usersList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Users> users=null;
        try {
            users=userService.usersList(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("users",users);
        request.getRequestDispatcher("/html/usermanage.jsp").forward(request, response);
    }

    /**
     * 添加用户
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void addUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        boolean b = false;
        try {
            b = userService.addUsers(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        WriterUtil.writer(b, response);
    }

    /**
     * 检查用户名是否存在
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void checkUserName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Users selectUsers = new Users();
        try {
            selectUsers = userService.selectUser(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        WriterUtil.writer(selectUsers == null, response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
