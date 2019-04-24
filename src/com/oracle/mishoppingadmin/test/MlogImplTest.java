package com.oracle.mishoppingadmin.test;

import com.oracle.mishoppingadmin.bean.Mlog;
import com.oracle.mishoppingadmin.dao.MlogDao;
import com.oracle.mishoppingadmin.dao.impl.MlogDaoImpl;
import org.junit.Test;

import java.sql.SQLException;
import java.util.List;

public class MlogImplTest {
    private MlogDao mlogDao = new MlogDaoImpl();

    @Test
    public void selectLogByTime() throws SQLException {
        List<Mlog> mlogs = mlogDao.selectLogByTime("2019-04-21", "2019-04-23");
        for (Mlog mlog : mlogs) {
            System.out.println(mlog);
        }
    }
}
