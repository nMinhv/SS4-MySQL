package com.example.ss6jv05;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "discountCalculatorServlet", value = "/discountCalculatorServlet")
public class DiscountCalculatorServlet extends HttpServlet {
    @Override
    public void init() {

    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.getRequestDispatcher("discountCal.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            double p = Double.parseDouble(req.getParameter("price"));
            double pc =  Double.parseDouble(req.getParameter("discountPercent"));
            double da = p * pc * 0.01;
        System.out.println(da);
            req.setAttribute("discount",da);
            req.getRequestDispatcher("display-discount.jsp").forward(req,resp);

    }

    @Override
    public void destroy() {
    }
}