package example;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class first_servlet extends HttpServlet  {
    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("text/html");
        try {

            PrintWriter out = response.getWriter();
            String n = request.getParameter("userName");
            out.print("Welcome " + n);

            // creating form that have invisible textfield
            out.print("<form action='./second_servlet'>");
            out.print("<input type='hidden' name='uname' value='" + n + "'>");
            out.print("<input type='submit' value='go'>");
            out.print("</form>");
            out.close();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
        public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            processRequest(req, resp);
        }

    @Override
        public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            processRequest(req, resp);
        }
}
