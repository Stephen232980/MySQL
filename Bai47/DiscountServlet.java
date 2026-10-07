package com.example;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", value = "/display-discount")
public class DiscountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Thiết lập mã hóa tiếng Việt
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // 1. Nhận dữ liệu gửi từ form index.jsp
        String description = request.getParameter("description");
        double listPrice = Double.parseDouble(request.getParameter("price"));
        double discountPercent = Double.parseDouble(request.getParameter("discount"));

        // 2. Tính toán theo công thức
        // Discount Amount = List Price * Discount Percent * 0.01
        double discountAmount = listPrice * discountPercent * 0.01;
        // Discount Price = List Price - Discount Amount
        double discountPrice = listPrice - discountAmount;

        // 3. Xuất kết quả hiển thị ra giao diện HTML
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Discount Result</title>");
        out.println("<style>");
        out.println("body { font-family: Arial, sans-serif; margin: 50px; }");
        out.println(".result-card { width: 420px; padding: 20px; border: 1px solid #28a745; border-radius: 6px; }");
        out.println(".result-item { margin-bottom: 12px; font-size: 16px; }");
        out.println(".label { font-weight: bold; display: inline-block; width: 170px; }");
        out.println("a { display: inline-block; margin-top: 15px; text-decoration: none; color: #007bff; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");

        out.println("<div class='result-card'>");
        out.println("<h2>Discount Calculation Result</h2>");
        out.println("<div class='result-item'><span class='label'>Product Description:</span> " + description + "</div>");
        out.println("<div class='result-item'><span class='label'>List Price:</span> $" + String.format("%.2f", listPrice) + "</div>");
        out.println("<div class='result-item'><span class='label'>Discount Percent:</span> " + discountPercent + "%</div>");
        out.println("<div class='result-item'><span class='label'>Discount Amount:</span> $" + String.format("%.2f", discountAmount) + "</div>");
        out.println("<div class='result-item'><span class='label'>Discount Price:</span> $" + String.format("%.2f", discountPrice) + "</div>");
        out.println("<a href='index.jsp'>← Quay lại tính tiếp</a>");
        out.println("</div>");

        out.println("</body>");
        out.println("</html>");
    }
}