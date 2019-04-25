package com.oracle.mishoppingadmin.service;

import com.oracle.mishoppingadmin.bean.Users;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;

public interface UserService {

    /**
     * 删除用户
     */
    public boolean deleteuser(HttpServletRequest request, HttpServletResponse response) throws SQLException;

    /**
     * 修改用户状态
     */
    public boolean unblock(HttpServletRequest request, HttpServletResponse response) throws SQLException;

    /**
     * 修改用户资料
     */
    public boolean modificition(HttpServletRequest request, HttpServletResponse response) throws SQLException;


    /**
     * 查询用户是否存在
     */
    public Users selectUser(HttpServletRequest request, HttpServletResponse response) throws SQLException;

    /**
     * 添加用户
     */
    public boolean addUsers(HttpServletRequest request, HttpServletResponse response) throws SQLException;

    /**
     * 显示用户列表
     */
    public List<Users> usersList(HttpServletRequest request, HttpServletResponse response) throws SQLException;

}
