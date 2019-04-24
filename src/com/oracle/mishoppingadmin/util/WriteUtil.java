package com.oracle.mishoppingadmin.util;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class WriteUtil {
    public static void write(HttpServletResponse response, boolean b) throws IOException {
        PrintWriter writer = response.getWriter();
        writer.print(b);
        writer.flush();
        writer.close();
    }

    public static void write(HttpServletResponse response, String s) throws IOException {
        PrintWriter writer = response.getWriter();
        writer.print(s);
        writer.flush();
        writer.close();
    }
}
