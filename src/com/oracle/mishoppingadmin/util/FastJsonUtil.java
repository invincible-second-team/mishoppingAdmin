package com.oracle.mishoppingadmin.util;

import com.alibaba.fastjson.JSONArray;

import java.util.List;

public class FastJsonUtil {
    public static String BeanList2Json(List<?> list){
        return JSONArray.toJSONString(list);
    }
}
