package com.oracle.mishoppingadmin.test;

import com.oracle.mishoppingadmin.bean.Address;
import com.oracle.mishoppingadmin.bean.Users;
import com.oracle.mishoppingadmin.dao.UserDao;
import com.oracle.mishoppingadmin.dao.impl.UserDaoImpl;
import com.oracle.mishoppingadmin.util.DBUtil;
import com.oracle.mishoppingadmin.util.RandomValueUtil;
import org.apache.commons.dbutils.QueryRunner;
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

        for (int i = 0; i < 50; i++) {
            Users users = new Users();
            users.setUname(RandomValueUtil.getChineseName());
            users.setUpassword("123456");
            users.setNickname("小可爱" + i);
            users.setUphone(RandomValueUtil.getTelephone());
            boolean b=userDao.addUsers(users);
            System.out.println(b);
        }
    }

    @Test
    public void addAddress() throws SQLException {

        for (int i = 0; i < 500; i++) {
            QueryRunner qr = new QueryRunner(DBUtil.getDataSource());
            Address address = new Address();
            address.setAddr(RandomValueUtil.getRoad());
            address.setUid(RandomValueUtil.getNum(0, 49));
            address.setAphone(RandomValueUtil.getTelephone());

            String sql = "insert into address(uid, addr, aphone) values (?,?,?)";
            int update = qr.update(sql, RandomValueUtil.getNum(0, 49), RandomValueUtil.getRoad(), RandomValueUtil.getTelephone());
            System.out.println(update);
        }
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
