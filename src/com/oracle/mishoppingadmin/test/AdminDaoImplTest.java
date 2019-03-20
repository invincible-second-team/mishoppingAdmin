package com.oracle.mishoppingadmin.test;

import com.oracle.mishoppingadmin.bean.Admin;
import com.oracle.mishoppingadmin.dao.AdminDao;
import com.oracle.mishoppingadmin.dao.impl.AdminDaoImpl;
import org.junit.Test;

import java.sql.SQLException;
import java.util.List;

public class AdminDaoImplTest {
    private AdminDao adminDao = new AdminDaoImpl();

    @Test
    public void selectAdmin() throws SQLException {
        Admin admin = new Admin();
        admin.setAdminname("rzhsky");
        admin.setAdminpassword("123456");
        Admin a = adminDao.selectAdmin(admin);
        System.out.println(a);
    }

    @Test
    public void adminList() throws SQLException {
        List<Admin> admins = adminDao.adminList();
        System.out.println(admins);
    }

    @Test
    public void updatePassword() throws SQLException {
        Admin admin = new Admin();
        admin.setAdminname("admin");
        admin.setAdminpassword("123");
        boolean b = adminDao.updatePassword(admin);
        System.out.println(b);
    }

    @Test
    public void addAdmin() throws SQLException {
        Admin admin = new Admin();
        admin.setAdminname("admin");
        admin.setAdminpassword("123");
        boolean b = adminDao.addAdmin(admin);
        System.out.println(b);
    }

    @Test
    public void deleteAdmin() throws SQLException {
        Admin admin = new Admin();
        admin.setAdminname("admin1");
        boolean b = adminDao.deleteAdmin(admin);
        System.out.println(b);
    }
}