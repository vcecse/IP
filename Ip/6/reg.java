package example.reg;

import java.sql.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class reg extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();
        pw.println("<html><body>");
        String name = req.getParameter("name");
        String addr = req.getParameter("addr");
        String phno = req.getParameter("phno");
        String id = req.getParameter("id");
        String pwd = req.getParameter("pwd");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/mydatabase", "root", "ajanthiru");
            Statement stmt = con.createStatement();
            String sqlstmt = "select id,pwd from login";
            ResultSet rs = stmt.executeQuery(sqlstmt);
            int flag = 0;
            while (rs.next()) {
                if (id.equals(rs.getString(1)) && pwd.equals(rs.getString(2))) {
                    flag = 1;
                }
            }
            if (flag == 1) {
                pw.println("<br><br>SORRY ALREADY ID EXIST USE DIFFERENT ID.<br><br>");
                pw.println("<a href=\"reg.html\">Press here to retry.</a>");
            } else {
                Statement stmt1 = con.createStatement();
                String sqlstmt2 ="insert into details values('" + name  + "','" + addr + "'," + phno + ",'" + id + "','" + pwd + "');";
                stmt1.executeUpdate(sqlstmt2);
                pw.println("<br><br>YOUR DETAILS ARE ENTERED<br><br>");
                pw.println("<a href=\"login.html\">Press here to login.</a>");
            }
            pw.println("</body></html>");
        } catch (Exception e) {
            resp.sendError(500, e.toString());
        }
    }
}
