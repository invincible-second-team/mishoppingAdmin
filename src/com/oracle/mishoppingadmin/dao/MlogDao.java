package com.oracle.mishoppingadmin.dao;

import com.oracle.mishoppingadmin.bean.Mlog;

import java.sql.SQLException;
import java.util.List;

public interface MlogDao {
    List<Mlog> selectLogByTime(String startTime, String endTime) throws SQLException;

    List<Mlog> selectLog() throws SQLException;

    boolean insertMlog(Mlog mlog) throws SQLException;
}
