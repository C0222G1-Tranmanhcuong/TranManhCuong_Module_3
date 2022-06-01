package controller;

import model.Product;
import service.ProductService;
import service.impl.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet",urlPatterns = "/product")
public class ProductController extends HttpServlet {
    //Controller gọi service
    private ProductService productService = new ProductServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action = request.getParameter("action");
    if (action == null){
        action = "";
    }
    switch (action){
        case "add":
        break;
        default:

    }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action");

    }
    private void showProduct(HttpServletRequest request, HttpServletResponse response){
    List<Product> productList = productService.findAll();
    request.setAttribute("productList", productList);
        
    }
}
