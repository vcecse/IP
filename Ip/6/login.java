package example.login;

import java.sql.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class login extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();
        pw.println("<html><body>");
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
            if (flag == 0) {
                pw.println("<br><br>SORRY INVALID ID TRY AGAIN ID<br><br>");
                pw.println("<a href=\"login.html\">Press here to retry.</a>");
            } else {
                pw.println("<br><br>VALID LOGIN ID<br><br>");
                pw.println("<h3><ul>");
                pw.println("<li><a href=\"profile.html\"><fontcolor=\"black\">USERPROFILE</font> </a></li><br><br>");
                pw.println("<li><a href=\"catalog.html\"><fontcolor=\"black\">BOOKSCATALOG</font></a></li><br><br>");
                pw.println("<li><a href=\"order.html\"><fontcolor=\"black\">ORDERCONFIRMATION</font></a></li></ul><br><br>");
            }
            pw.println("</body></html>");
        } catch (Exception e) {
            resp.sendError(500, e.toString());
        }
    }
}