package example.profile;

import java.sql.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class profile extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();
        pw.println("<html><body>");
        String id = req.getParameter("id");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/mydatabase", "root", "ajanthiru");
            Statement stmt = con.createStatement();
            String sqlstmt = "select * from login where id = \'" + id + "\'" ;
            ResultSet rs = stmt.executeQuery(sqlstmt);
            int flag = 0;
            pw.println("<br><br><br>");
            while (rs.next()) {
                pw.println("<div align=\"center\">");
                pw.println("NAME :" + rs.getString(1) + "<br>");
                pw.println("ADDRESS :" + rs.getString(2) + "<br>");
                pw.println("PHONE NO :" + rs.getString(3) + "<br>");
                pw.println("</div>");
                flag = 1;
            }
            if (flag == 0) {
                pw.println("<br><br>SORRY INVALID ID TRY AGAIN ID<br><br>");
                pw.println("<a href=\"profile.html\">Press here to retry.</a>");
            }
            pw.println("</body></html>");
        } catch (Exception e) {
            resp.sendError(500, e.toString());
        }
    }
}
