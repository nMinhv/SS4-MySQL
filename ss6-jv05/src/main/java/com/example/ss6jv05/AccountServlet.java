package com.example.ss6jv05;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "accountServlet", value = "/account")
public class AccountServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("account.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        req.setAttribute("userName", userName);
        req.setAttribute("password", pass);
        req.setAttribute("email", email);
        req.getRequestDispatcher("accountRst.jsp").forward(req,resp);

    }

    @Override
    public void destroy() {

    }
}
