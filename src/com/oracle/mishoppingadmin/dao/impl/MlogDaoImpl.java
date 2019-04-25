package com.oracle.mishoppingadmin.dao.impl;

import com.oracle.mishoppingadmin.bean.Mlog;
import com.oracle.mishoppingadmin.dao.MlogDao;
import com.oracle.mishoppingadmin.util.DBUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class MlogDaoImpl implements MlogDao {
    private QueryRunner qr = new QueryRunner(DBUtil.getDataSource());

    @Override
    public List<Mlog> selectLogByTime(String startTime, String endTime) throws SQLException {
        String sql = "select * from mlog where mdate > ? and mdate < ?";
        return qr.query(sql, new BeanListHandler<>(Mlog.class), startTime, endTime);
    }

    @Override
    public List<Mlog> selectLog() throws SQLException {
        String sql = "select * from mlog";
        return qr.query(sql, new BeanListHandler<>(Mlog.class));
    }

    @Override
    public boolean insertMlog(Mlog mlog) throws SQLException {
        String sql = "insert into mlog(message, success, mdate, adminid) values(?, ?, ?, ?)";
        int update = qr.update(sql, mlog.getMessage(), mlog.getSuccess(), mlog.getMdate(), mlog.getAdminid());
        return update != 0;
    }
}
