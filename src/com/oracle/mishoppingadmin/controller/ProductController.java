package com.oracle.mishoppingadmin.controller;

import com.oracle.mishoppingadmin.bean.Category;
import com.oracle.mishoppingadmin.bean.Products;
import com.oracle.mishoppingadmin.service.ProductService;
import com.oracle.mishoppingadmin.service.impl.ProductServiceImpl;
import com.oracle.mishoppingadmin.util.FastJsonUtil;
import com.oracle.mishoppingadmin.util.UploadUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductController", urlPatterns = "/product")
public class ProductController extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        switch (method) {
            case "loadType":
                loadType(request, response);
                break;
            case "addProduct":
                addProduct(request, response);
                break;

        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private void loadType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String catagoriesJson = null;
        try {
            List<Category> catagories = productService.categoryList();
            catagoriesJson = FastJsonUtil.BeanList2Json(catagories);
        } catch (SQLException ignored) {
        }

        PrintWriter writer = response.getWriter();
        writer.print(catagoriesJson);
        writer.flush();
        writer.close();
    }

    protected void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String upload = UploadUtil.upload(request);

        String pimg = request.getParameter("pimg");

        Products products = new Products();
        products.setPname(request.getParameter("pname"));
        products.setPdes(request.getParameter("pdes"));
        products.setPprice(Double.parseDouble(request.getParameter("pprice")));
        products.setPstate(Long.parseLong(request.getParameter("pstate")));
        products.setPpricediscount(Double.parseDouble(request.getParameter("pdiscount")));
        products.setPstock(Long.parseLong(request.getParameter("pstock")));
        products.setCategoryid(Long.parseLong(request.getParameter("ptype")));
        products.setPimg(upload);

        boolean b = false;
        try {
            b = productService.addProduct(products);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        PrintWriter writer = response.getWriter();
        writer.print(b);
        writer.flush();
        writer.close();
    }
}
