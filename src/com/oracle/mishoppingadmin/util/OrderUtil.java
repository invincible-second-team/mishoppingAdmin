package com.oracle.mishoppingadmin.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * 生成随机订单号
 */
public class OrderUtil {
    /**
     * 生成随机订单编号
     *
     * @return
     */
    public static String getOrderIdByTime() {
        return "" + 1000 + System.currentTimeMillis() + RandomValueUtil.getNum(1000, 9999);
    }

    /**
     * 生成时间
     *
     * @return
     */
    public static String getNowTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        String time = sdf.format(new Date());
        return String.valueOf(time);
    }
}
