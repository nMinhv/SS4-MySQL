package com.example.ss6jv05;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "studentsServlet",value = "/students")
public class StudentsServlet extends HttpServlet {
    private final List<Student> studentList = new ArrayList<>();
    @Override
    public void init() throws ServletException {
        studentList.add(new Student("B01","Cong Phuong", 18,true));
        studentList.add(new Student("B02","Tien Linh", 18,false));
        studentList.add(new Student("B03","Cong Cong", 18,true));
        studentList.add(new Student("B04","Cong Nhan", 18,true));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("students",studentList);
        req.getRequestDispatcher("/student.jsp").forward(req,resp);
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
