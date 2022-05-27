package controllers;

import model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "CustomerControllers", urlPatterns = "/customer")
public class CustomerControllers  extends HttpServlet {
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    Customer[]customers = new Customer[5];
    customers[0] = new Customer("Trần Mạnh Cường", "28-01-1997","Quảng Bình","image/img.jpg");
    customers[1] = new Customer("Nguyễn Duy Trung", "20-11-2003","Quảng Nam","image/img2.jpg");
    customers[2] = new Customer("Nguyễn Thảo Uyên", "14-5-1999","Quảng Ngãi","image/img3.jpg");
    customers[3] = new Customer("Nguyễn Hoàng Hảo", "09-06-2000","Đà Nẵng","image/img4.jpg");
    customers[4] = new Customer("Lưu Hoà", "14-08-1995","Quảng Nam","image/img5.jpg");
    request.setAttribute("ListCustomer", customers);
    request.getRequestDispatcher("list_customer.jsp").forward(request,response);
}
}
