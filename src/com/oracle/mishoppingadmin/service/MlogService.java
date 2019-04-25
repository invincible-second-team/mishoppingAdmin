package com.oracle.mishoppingadmin.service;

import com.oracle.mishoppingadmin.bean.Admin;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

public interface MlogService {
    public boolean insertUserLog(HttpServletRequest request, int  success, Admin admin) throws SQLException;
}
