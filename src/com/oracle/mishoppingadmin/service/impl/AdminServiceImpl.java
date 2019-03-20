package com.oracle.mishoppingadmin.service.impl;

import com.oracle.mishoppingadmin.bean.Admin;
import com.oracle.mishoppingadmin.dao.AdminDao;
import com.oracle.mishoppingadmin.dao.impl.AdminDaoImpl;
import com.oracle.mishoppingadmin.service.AdminService;

import java.sql.SQLException;
import java.util.List;

public class AdminServiceImpl implements AdminService {
    private AdminDao adminDao = new AdminDaoImpl();

    @Override
    public Admin selectAdmin(Admin admin) throws SQLException {
        return adminDao.selectAdmin(admin);
    }

    @Override
    public List<Admin> AdminList() throws SQLException {
        return adminDao.adminList();
    }

    @Override
    public boolean updatePassword(Admin admin) throws SQLException {
        return adminDao.updatePassword(admin);
    }

    @Override
    public boolean addAdmin(Admin admin) throws SQLException {
        return adminDao.addAdmin(admin);
    }

    @Override
    public boolean deleteAdmin(Admin admin) throws SQLException {
        return adminDao.deleteAdmin(admin);
    }
}
