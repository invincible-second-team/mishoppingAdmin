package com.oracle.mishoppingadmin.dao;

import com.oracle.mishoppingadmin.bean.Users;

import java.sql.SQLException;
import java.util.List;

public interface UserDao {

    /**
     * 删除用户
     */
    public boolean deleteuser(Users users) throws SQLException;


    /**
     * 修改用户状态
     */
    public boolean unblock(Users users) throws SQLException;

    /**
     * 修改用户信息
     */
    public boolean modificition(Users users) throws SQLException;

    /**
     * 添加用户
     */
    public boolean addUsers(Users users) throws SQLException;

    /**
     *账号验证
     */
    public Users selectUser(Users users) throws SQLException;

    /**
     * 显示用户列表
     */
    public List<Users> usersList() throws SQLException;
}
