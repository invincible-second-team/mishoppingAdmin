package com.oracle.mishoppingadmin.service.impl;

import com.oracle.mishoppingadmin.bean.Admin;
import com.oracle.mishoppingadmin.bean.Mlog;
import com.oracle.mishoppingadmin.bean.Products;
import com.oracle.mishoppingadmin.dao.MlogDao;
import com.oracle.mishoppingadmin.dao.ProductDao;
import com.oracle.mishoppingadmin.dao.impl.MlogDaoImpl;
import com.oracle.mishoppingadmin.dao.impl.ProductDaoImpl;
import com.oracle.mishoppingadmin.service.MlogService;
import com.oracle.mishoppingadmin.util.IPUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class MlogServiceImpl implements MlogService {
    private MlogDao mlogDao = new MlogDaoImpl();

    @Override
    public boolean insertAmdinMlog(String msg, int success, Admin admin) throws SQLException {
        Mlog mlog = new Mlog();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sdf.format(new Date());
        mlog.setMessage(msg);
        mlog.setAdminid(admin.getAdminid());
        mlog.setSuccess(success);
        mlog.setMdate(date);

        return mlogDao.insertMlog(mlog);
    }

    @Override
    public boolean insertAmdinMlog(HttpServletRequest request, int success, Admin admin) throws SQLException {
        String contextPath = request.getContextPath();
        String method = request.getParameter("method");

        Mlog mlog = new Mlog();
        String msg = null;
        if (contextPath.equals("/admin")) {
            String adminname = null;
            switch (method) {
                case "login":
                    msg = "管理员:" + admin.getAdminname() + "登录，登录IP：" + IPUtil.getIpAddr(request);
                    break;
                case "logout":
                    msg = "管理员:" + admin.getAdminname() + "登出";
                    break;
                case "addAdmin":
                    adminname = request.getParameter("adminname");
                    String adminpassword = request.getParameter("adminpassword");
                    msg = "管理员:" + admin.getAdminname() + "添加管理员：" + adminname + ", 密码为" + adminpassword;
                    break;
                case "reset":
                    adminname = request.getParameter("adminname");
                    msg = "管理员:" + admin.getAdminname() + "重置管理员：" + adminname + "密码";
                    break;
                case "delete":
                    adminname = request.getParameter("adminname");
                    msg = "管理员:" + admin.getAdminname() + "删除管理员：" + adminname;
                    break;
                case "updatePassword":
                    String newPassword = request.getParameter("newPassword");
                    msg = "管理员:" + admin.getAdminname() + "更新密码为：" + newPassword;
                    break;
                default:
                    return false;
            }
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sdf.format(new Date());
        mlog.setMessage(msg);
        mlog.setAdminid(admin.getAdminid());
        mlog.setSuccess(success);
        mlog.setMdate(date);

        return mlogDao.insertMlog(mlog);
    }

    @Override
    public boolean insertProductMlog(HttpServletRequest request, int success, Admin admin, Products product) throws SQLException {
        ProductDao productDao = new ProductDaoImpl();
        String contextPath = request.getContextPath();
        String method = request.getParameter("method");

        Mlog mlog = new Mlog();
        String msg = null;
        if (contextPath.equals("/admin")) {
            switch (method) {
                case "addProduct":
                    msg = "管理员:" + admin.getAdminname() + "添加商品" + product.getPname() + "信息为：" + product;
                    break;
                case "updateProduct":
                    msg = "管理员:" + admin.getAdminname() + "更新商品id" + product.getPid() + "信息为(null表示未修改)：" + product;
                    break;
                case "deleteProduct":
                    msg = "管理员:" + admin.getAdminname() + "删除商品id：" + product.getPid();
                    break;
                case "updateProductState":
                    msg = "管理员:" + admin.getAdminname() + "更新商品id:" + product.getPid() + "的状态为：" + (product.getPstate() == 1 ? "上架" : "下架");
                    break;
                case "updateProductImg":
                    msg = "管理员:" + admin.getAdminname() + "更新商品id:" + product.getPid() + "图片为：" + product.getPimg();
                    break;
                case "updateProductCategory":
                    msg = "管理员:" + admin.getAdminname() + "更新商品id:" + product.getPid() + "类别为：" + productDao.selectCategory(product.getCategoryid()).getCategoryname();
                    break;
            }
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sdf.format(new Date());

        mlog.setMessage(msg);
        mlog.setAdminid(admin.getAdminid());
        mlog.setSuccess(success);
        mlog.setMdate(date);

        return mlogDao.insertMlog(mlog);
    }


    @Override
    public boolean insertUserLog(HttpServletRequest request, int success, Admin admin) throws SQLException {
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


        return mlogDao.insertMlog(mlog);
    }

    @Override
    public List<Mlog> selectLogByTime(String startTime, String endTime) throws SQLException {
        return mlogDao.selectLogByTime(startTime, endTime);
    }

    @Override
    public List<Mlog> selectLog() throws SQLException {
        return mlogDao.selectLog();
    }

    @Override
    public void download(HttpServletRequest request, HttpServletResponse response, String fileName) throws IOException {
        File file = new File(fileName);

        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
        response.setContentLength((int) file.length());

        FileInputStream fis = null;
        try {
            fis = new FileInputStream(file);
            byte[] buffer = new byte[128];
            int count = 0;
            while ((count = fis.read(buffer)) > 0) {
                response.getOutputStream().write(buffer, 0, count);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            response.getOutputStream().flush();
            response.getOutputStream().close();
            fis.close();
        }
    }
}
