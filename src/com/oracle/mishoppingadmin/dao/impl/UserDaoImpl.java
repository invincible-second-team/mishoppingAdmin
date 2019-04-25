package com.oracle.mishoppingadmin.dao.impl;

import com.oracle.mishoppingadmin.bean.Users;
import com.oracle.mishoppingadmin.dao.UserDao;
import com.oracle.mishoppingadmin.util.DBUtil;
import com.oracle.mishoppingadmin.util.EncodeUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class UserDaoImpl implements UserDao {
    private QueryRunner queryRunner = new QueryRunner(DBUtil.getDataSource());


    /**
     * 删除用户
     * @param users
     * @return
     * @throws SQLException
     */
    @Override
    public boolean deleteuser(Users users) throws SQLException {
        String sql = "delete from users where uid=?";
        int update = queryRunner.update(sql, users.getUid());
        return update != 0;
    }

    /**
     * 修改用户状态
     * @param users
     * @return
     * @throws SQLException
     */
    @Override
    public boolean unblock(Users users) throws SQLException {
        String sql="update users set ustate=? where uid=?";
        int update=queryRunner.update(sql,users.getUstate(),users.getUid());
        return update!=0;
    }

    /**
     *修改用户信息
     * @param users
     * @return
     * @throws SQLException
     */
    @Override
    public boolean modificition(Users users) throws SQLException {
        String sql="update users set nickname=?,upassword=?,uphone=? where uid=?";
        String password=EncodeUtil.encode(users.getUpassword(),users.getUname());
        int update=queryRunner.update(sql,users.getNickname(),password,users.getUphone(),users.getUid());
        return update!=0;
    }

    /**
     * 向数据库中添加新用户并加密
     * @param users
     * @return
     * @throws SQLException
     */
    @Override
    public boolean addUsers(Users users) throws SQLException {
        String sql="insert into users(uname,upassword,nickname,uphone,ustate) values(?,?,?,?,?)";
        String password=EncodeUtil.encode(users.getUpassword(),users.getUname());
        int update=queryRunner.update(sql,users.getUname(),password,users.getNickname(),users.getUphone(),1);
        return update!=0;
    }

    /**
     * 检查用户是否存在
     * @param users
     * @return
     * @throws SQLException
     */
    @Override
    public Users selectUser(Users users) throws SQLException {
        String sql="select * from users where uname= ?";
        return queryRunner.query(sql,new BeanHandler<Users>(Users.class),users.getUname());
    }

    /**
     * 显示用户列表
     * @return
     * @throws SQLException
     */
    @Override
    public List<Users> usersList() throws SQLException {
        String sql="select * from users";
        return queryRunner.query(sql,new BeanListHandler<Users>(Users.class));
    }
}
