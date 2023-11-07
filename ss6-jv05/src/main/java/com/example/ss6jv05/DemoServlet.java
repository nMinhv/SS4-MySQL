package com.example.ss6jv05;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "demoServlet",value = "/demo-servlet")
public class DemoServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        System.out.println("khoi tao servlet");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.getRequestDispatcher("demo.jsp").forward(req,resp);
    }

    @Override
    public void destroy() {
        System.out.println("huy servlet");
    }
}
