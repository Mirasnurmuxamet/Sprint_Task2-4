package kz.bitlab.techorda.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.techorda.db.DBManager;
import kz.bitlab.techorda.db.Tasks;

import java.io.IOException;

@WebServlet(value = "/details")
public class Task_Details_Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = -1L;
        try{
            id = Long.parseLong(request.getParameter("task_id"));
        }catch (Exception e){
        }
        Tasks task = DBManager.getTask(id);
        request.setAttribute("zadacha",task);
        request.getRequestDispatcher("Task_details.jsp").forward(request,response);
    }
}
