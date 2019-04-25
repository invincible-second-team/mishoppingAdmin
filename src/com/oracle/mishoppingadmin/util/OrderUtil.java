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
     * @return
     */
    public static String getOrderIdByTime() {
        int machineId = 1;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String newDate = sdf.format(new Date());
        String result = "";
        Random random = new Random();
        for (int i = 0; i < 3; i++) {
            result += random.nextInt(10);
        }
       return  1000+result+newDate ;
    }

    /**
     * 生成时间
     * @return
     */
    public static String getcreatetime(){
        SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        String  time = sdf.format(new Date());
        return String.valueOf(time);
    }
}
