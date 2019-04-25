package com.oracle.mishoppingadmin.util;

import com.oracle.mishoppingadmin.bean.Users;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class WriterUtil {
    public static void writer(Boolean b, HttpServletResponse response){
        PrintWriter writer = null;
        try {
            writer = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        writer.print(b);
        writer.flush();
        writer.close();
    }


}
