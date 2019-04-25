package com.oracle.mishoppingadmin.service.impl;

import com.oracle.mishoppingadmin.bean.Admin;
import com.oracle.mishoppingadmin.bean.Mlog;
import com.oracle.mishoppingadmin.dao.MlogDao;
import com.oracle.mishoppingadmin.dao.impl.MlogDaoImpl;
import com.oracle.mishoppingadmin.service.MlogService;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MlogServiceImpl implements MlogService {
    private MlogDao mlogDao=new MlogDaoImpl();


    @Override
    public boolean insertAddUserlog(HttpServletRequest request, int success, Admin admin) throws SQLException {
        String contextPath =request.getContextPath();
        String method=request.getParameter("method");

        Mlog mlog=new Mlog();
        String msg=null;
        if(contextPath.equals("/admin")){
            String username=null;
            switch (method){
                case "addUsers":
                    username=request.getParameter("uname");
                    String userpassword=request.getParameter("upassword");
                    msg="管理员"+admin.getAdminname()+"添加用户："+username+",密码为："+userpassword;
                    break;
                case "modificition":
                    String muid=request.getParameter("uid");
                    msg="管理员"+admin.getAdminname()+"修改了用户id为："+muid+"的用户资料 ";
                    break;
                case "unblock":
                    String unuid=request.getParameter("uid");
                    String unustate=request.getParameter("ustate");
                    msg="管理员"+admin.getAdminname()+"修改了用户id为："+unuid+"的状态为："+unustate;
                    break;
                case "deleteuser":
                    String duid=request.getParameter("uid");
                    msg="管理员"+admin.getAdminname()+"删除了用户id为："+duid+"的用户";
                    break;
                case "sendgood":
                    String soid=request.getParameter("oid");
                    msg="管理员"+admin.getAdminname()+"改变了订单id为："+soid+"的发货状态";
                    break;


            }
        }
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date=sdf.format(new Date());
        mlog.setMessage(msg);
        mlog.setAdminid(admin.getAdminid());
        mlog.setSuccess(success);
        mlog.setMdate(date);

        boolean b= mlogDao.insertMlog(mlog);
        return  b;
    }
}
