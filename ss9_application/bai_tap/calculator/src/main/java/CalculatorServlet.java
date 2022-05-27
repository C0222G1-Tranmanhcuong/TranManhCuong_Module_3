import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet",urlPatterns = "/calculator")
public class CalculatorServlet extends javax.servlet.http. HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String description = request.getParameter("description");
            float price = Float.parseFloat(request.getParameter("price"));
            int discount = Integer.parseInt(request.getParameter("discount"));
            float amount = (float) ( price *discount *0.01);
            float discountPrice = price-amount;

            PrintWriter writer = response.getWriter();
            writer.println("<html>");
            writer.println("<head>");
            writer.println(" <meta charset=\"UTF-8\">");
            writer.println("</head>");
            writer.println("<h1>Lượng chiết khấu: " + amount +"</h1>");
            writer.println("<h1>Giá sau khi chiết khấu: " + discountPrice +"</h1>");

            writer.println("</html>");

        }catch (NumberFormatException e){
            request.getRequestDispatcher("error.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
