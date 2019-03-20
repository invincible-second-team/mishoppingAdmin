package com.oracle.mishoppingadmin.dao;

import com.oracle.mishoppingadmin.bean.Admin;

import java.sql.SQLException;
import java.util.List;

public interface AdminDao {
    /**
     * 登录验证
     */
    Admin selectAdmin(Admin admin) throws SQLException;

    /**
     * 管理员列表
     */
    List<Admin> adminList() throws SQLException;

    /**
     * 修改密码
     */
    boolean updatePassword(Admin admin) throws SQLException;

    /**
     * 添加管理员
     */
    boolean addAdmin(Admin admin) throws SQLException;

    /**
     * 删除管理员
     */
    boolean deleteAdmin(Admin admin) throws SQLException;
}
