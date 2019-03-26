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
import java.util.Map;

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
            case "productManage":
                productManage(request, response);
                break;
            case "updateProduct":
                updateProduct(request, response);
                break;
            case "deleteProduct":
                deleteProduct(request, response);
                break;
            case "updateProductState":
                updateProductState(request, response);
                break;
            case "updateProductImg":
                updateProductImg(request, response);
                break;
            case "updateProductCategory":
                updateProductCategory(request, response);
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

    private Products productsInfo(Map<String, String> map) {
        Products products = new Products();
        products.setPname(map.get("pname"));
        products.setPdes(map.get("pdesc"));
        products.setPprice(Double.parseDouble(map.get("pprice")));
        products.setPstate(Long.parseLong(map.get("pstate")));
        products.setPpricediscount(Double.parseDouble(map.get("pdiscount")));
        products.setPstock(Long.parseLong(map.get("pstock")));
        products.setCategoryid(Long.parseLong(map.get("ptype")));
        products.setPimg(map.get("filename"));

        return products;
    }

    protected void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> upload = UploadUtil.upload(request);
        Products products = null;
        if (upload != null) {
            products = productsInfo(upload);
        }

        boolean b = false;
        try {
            b = productService.addProduct(products);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        String notice = b ? "商品添加成功" : "商品添加失败";
        request.setAttribute("notice", notice);
        request.getRequestDispatcher("/html/success.jsp").forward(request, response);
    }

    protected void productManage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, Object>> productInfo = null;
        try {
            productInfo = productService.productInfo();
        } catch (SQLException ignored) {
        }

        request.setAttribute("productInfo", productInfo);
        request.getRequestDispatcher("/html/productmanage.jsp").forward(request, response);
    }

    protected void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");
        String pname = request.getParameter("pname");
        String pprice = request.getParameter("pprice");
        String pstock = request.getParameter("pstock");
        String pdesc = request.getParameter("pdesc");
        String pdiscount = request.getParameter("pdiscount");

        Products products = new Products();
        products.setPname(pname);
        products.setPid(Long.parseLong(pid));
        products.setPprice(Double.parseDouble(pprice));
        products.setPstock(Long.parseLong(pstock));
        products.setPpricediscount(Double.parseDouble(pdiscount));
        products.setPdes(pdesc);

        boolean b = false;
        try {
            b = productService.updateProduct(products);
        } catch (SQLException ignored) {
        }

        PrintWriter writer = response.getWriter();
        writer.print(b);
        writer.flush();
        writer.close();
    }

    protected void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");

        boolean b = false;
        try {
            b = productService.deleteProductById(Long.valueOf(pid));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        PrintWriter writer = response.getWriter();
        writer.print(b);
        writer.flush();
        writer.close();
    }

    protected void updateProductState(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");
        String pstate = request.getParameter("pstate");

        Products products = new Products();
        products.setPid(Long.parseLong(pid));
        products.setPstate(Long.parseLong(pstate));

        boolean b = false;
        try {
            b = productService.updateProductState(products);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        PrintWriter writer = response.getWriter();
        writer.print(b);
        writer.flush();
        writer.close();
    }

    protected void updateProductImg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> upload = UploadUtil.upload(request);

        Products products = new Products();
        products.setPid(Long.parseLong(upload.get("pid")));
        products.setPimg(upload.get("filename"));

        boolean b = false;
        try {
            b = productService.updateProductImg(products);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println(upload.get("filename"));
        if (b) {
            PrintWriter writer = response.getWriter();
            writer.print(upload.get("filename"));
            writer.flush();
            writer.close();
        }
    }

    protected void updateProductCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");
        String ptype = request.getParameter("ptype");

        Products products = new Products();
        products.setPid(Long.parseLong(pid));
        products.setCategoryid(Long.parseLong(ptype));

        boolean b = false;
        try {
            b = productService.updateProductCategory(products);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        PrintWriter writer = response.getWriter();
        writer.print(b);
        writer.flush();
        writer.close();
    }
}
