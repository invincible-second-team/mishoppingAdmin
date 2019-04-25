package com.oracle.mishoppingadmin.test;

import com.oracle.mishoppingadmin.bean.Users;
import com.oracle.mishoppingadmin.dao.UserDao;
import com.oracle.mishoppingadmin.dao.impl.UserDaoImpl;
import org.junit.Test;

import java.sql.SQLException;
import java.util.List;

public class UserDaoImplTest {
    private UserDao userDao = new UserDaoImpl();

    /**
     * 测试用户名是否存在
     *
     * @throws SQLException
     */
    @Test
    public void selectUser() throws SQLException {
        Users users = new Users();
        users.setUname("zhh123");
        Users u = userDao.selectUser(users);
        System.out.println(u);
    }

    /**
     * 添加用户
     * @throws SQLException
     */
    @Test
    public void addUsers() throws SQLException {
        Users users = new Users();
        users.setUname("zhh1234");
        users.setUpassword("123");
        users.setNickname("小可爱");
        users.setUphone("18871013456");
        boolean b=userDao.addUsers(users);
        System.out.println(b);
    }

    /**
     * 显示用户列表
     * @throws SQLException
     */
    @Test
    public void usersList() throws SQLException{
        List<Users> l=userDao.usersList();
        System.out.println(l);
    }

    /**
     * 修改用户资料
     * @throws SQLException
     */
    @Test
    public void modificition() throws SQLException{
        Users users = new Users();
        users.setUid(2);
        users.setUname("zhh12345");
        users.setUpassword("123456");
        users.setNickname("无敌可爱");
        users.setUphone("18871013456");
        boolean b=userDao.modificition(users);
        System.out.println(b);
    }

}
