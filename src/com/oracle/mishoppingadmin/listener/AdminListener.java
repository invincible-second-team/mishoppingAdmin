package com.oracle.mishoppingadmin.listener;

import com.oracle.mishoppingadmin.bean.Admin;
import com.oracle.mishoppingadmin.service.MlogService;
import com.oracle.mishoppingadmin.service.impl.MlogServiceImpl;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.sql.SQLException;

@WebListener()
public class AdminListener implements HttpSessionListener {
    private MlogService mlogService = new MlogServiceImpl();

    @Override
    public void sessionCreated(HttpSessionEvent httpSessionBindingEvent) {
    }


    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionBindingEvent) {
        Admin loginAdmin = (Admin) httpSessionBindingEvent.getSession().getAttribute("loginAdmin");
        String msg = loginAdmin.getAdminname() + "安全登出";
        try {
            mlogService.insertAmdinMlog(msg, 1, loginAdmin);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
