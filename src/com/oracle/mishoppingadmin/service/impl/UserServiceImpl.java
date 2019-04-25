package com.oracle.mishoppingadmin.service.impl;

import com.oracle.mishoppingadmin.bean.Users;
import com.oracle.mishoppingadmin.dao.UserDao;
import com.oracle.mishoppingadmin.dao.impl.UserDaoImpl;
import com.oracle.mishoppingadmin.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDao userDao = new UserDaoImpl();

    /**
     * 删除用户
     *
     * @param request
     * @param response
     * @return
     * @throws SQLException
     */
    @Override
    public boolean deleteuser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        long uid = Long.parseLong(request.getParameter("uid"));

        Users users = new Users(uid);
        Boolean b = userDao.deleteuser(users);
        return b;
    }

    /**
     * 修改用户状态
     *
     * @param request
     * @param response
     * @return
     * @throws SQLException
     */
    @Override
    public boolean unblock(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        long uid = Long.parseLong(request.getParameter("uid"));
        long ustate = Long.parseLong(request.getParameter("ustate"));

        Users users = new Users(uid, ustate);
        Boolean b = userDao.unblock(users);
        return b;

    }

    /**
     * 修改用户资料
     *
     * @param request
     * @param response
     * @return
     * @throws SQLException
     */
    @Override
    public boolean modificition(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        long uid = Long.parseLong(request.getParameter("uid"));
        String uname = request.getParameter("uname");
        String upassword = request.getParameter("upassword");
        String nickname = request.getParameter("nickname");
        String uphone = request.getParameter("uphone");

        Users users = new Users(uid, uname, upassword, nickname, uphone);
        Boolean b = userDao.modificition(users);
        return b;
    }

    /**
     * 查询用户是否存在
     *
     * @param request
     * @param response
     * @return
     * @throws SQLException
     */
    @Override
    public Users selectUser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String userName = request.getParameter("username");

        Users user = new Users(userName);
        Users selectUsers = userDao.selectUser(user);

        return selectUsers;
    }

    /**
     * 添加用户
     *
     * @param request
     * @param response
     * @return
     * @throws SQLException
     */
    @Override
    public boolean addUsers(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String uanme = request.getParameter("uname");
        String upassword = request.getParameter("upassword");
        String nickname = request.getParameter("nickname");
        String uphone = request.getParameter("uphone");

        Users users = new Users(uanme, upassword, nickname, uphone);
        boolean b = userDao.addUsers(users);
        return b;
    }

    /**
     * 显示用户列表
     *
     * @param request
     * @param response
     * @return
     * @throws SQLException
     */
    @Override
    public List<Users> usersList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        List<Users> userslist = null;
        userslist = userDao.usersList();
        return userslist;
    }


}
