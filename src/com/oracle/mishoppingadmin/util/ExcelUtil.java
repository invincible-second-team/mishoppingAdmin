package com.oracle.mishoppingadmin.util;

import com.oracle.mishoppingadmin.service.MlogService;
import com.oracle.mishoppingadmin.service.impl.MlogServiceImpl;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ExcelUtil {

    public static void export(Class<?> clazz, String title, List list, String pathname) throws Exception {
        List<String> fields = new ArrayList<>();

        for (Field declaredField : clazz.getDeclaredFields()) {
            fields.add(declaredField.getName());
        }

        excel(title, list, fields, pathname);

    }

    public static void export(List<String> column, String title, List list, String pathname) throws Exception {
        excel(title, list, column, pathname);

    }


    private static void excel(String title, List list, List<String> fields, String pathname) throws Exception {
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet(title);

        HSSFRow row1 = sheet.createRow(0);
        for (int i = 0; i < fields.size(); i++) {
            row1.createCell(i).setCellValue(fields.get(i));
        }

        for (int i = 0; i < list.size(); i++) {
            HSSFRow row = sheet.createRow(i + 1);
            for (int j = 0; j < fields.size(); j++) {
                Class<?> aClass = list.get(i).getClass();
                String name = fields.get(j).substring(0, 1).toUpperCase() +
                        fields.get(j).substring(1);
                Method method = aClass.getMethod("get" + name);
                Object invoke = method.invoke(list.get(i));
                row.createCell(j).setCellValue(invoke.toString());
                sheet.setColumnWidth(j, 256*35);
            }
        }

        OutputStream output = new FileOutputStream(new File(pathname));
        workbook.write(output);
        output.close();
    }

}
