package com.oracle.mishoppingadmin.dao.impl;

import com.oracle.mishoppingadmin.bean.Admin;
import com.oracle.mishoppingadmin.dao.AdminDao;
import com.oracle.mishoppingadmin.util.DBUtil;
import com.oracle.mishoppingadmin.util.EncodeUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class AdminDaoImpl implements AdminDao {
    private QueryRunner queryRunner = new QueryRunner(DBUtil.getDataSource());

    @Override
    public Admin selectAdmin(Admin admin) throws SQLException {
        if (admin.getAdminpassword() == null) {
            String sql = "select * from admin where adminname=?";
            return queryRunner.query(sql, new BeanHandler<>(Admin.class), admin.getAdminname());
        } else {
            String sql = "select * from admin where adminname=? and adminpassword=?";
            String password = EncodeUtil.encode(admin.getAdminpassword(), admin.getAdminname());
            return queryRunner.query(sql, new BeanHandler<>(Admin.class), admin.getAdminname(), password);
        }
    }

    @Override
    public List<Admin> adminList() throws SQLException {
        String sql = "select * from admin";
        return queryRunner.query(sql, new BeanListHandler<>(Admin.class));
    }

    @Override
    public boolean updatePassword(Admin admin) throws SQLException {
        String sql = "update admin set adminpassword=? where adminname=?";
        String password = EncodeUtil.encode(admin.getAdminpassword(), admin.getAdminname());
        int update = queryRunner.update(sql, password, admin.getAdminname());
        return update != 0;
    }

    @Override
    public boolean addAdmin(Admin admin) throws SQLException {
        String sql = "insert into admin(adminname, adminpassword) values(?,?)";
        String password = EncodeUtil.encode(admin.getAdminpassword(), admin.getAdminname());
        int update = queryRunner.update(sql, admin.getAdminname(), password);
        return update != 0;
    }

    @Override
    public boolean deleteAdmin(Admin admin) throws SQLException {
        String sql = "delete from admin where adminname=?";
        int update = queryRunner.update(sql, admin.getAdminname());
        return update != 0;
    }
}
