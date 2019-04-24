package com.oracle.mishoppingadmin.service;

import com.oracle.mishoppingadmin.bean.Admin;
import com.oracle.mishoppingadmin.bean.Mlog;
import com.oracle.mishoppingadmin.bean.Products;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public interface MlogService {

    boolean insertAmdinMlog(HttpServletRequest request, int success, Admin admin) throws SQLException;

    boolean insertProductMlog(HttpServletRequest request, int success, Admin admin, Products product) throws SQLException;

    List<Mlog> selectLogByTime(String startTime, String endTime) throws SQLException;

    List<Mlog> selectLog() throws SQLException;

    void download(HttpServletRequest request, HttpServletResponse response, String fileName) throws IOException;
}
