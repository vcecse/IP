package example.catalog;

import java.sql.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class catalog extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();
        pw.println("<html><body>");
        String title = req.getParameter("title");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/mydatabase", "root", "ajanthiru");
            Statement stmt = con.createStatement();
            String sqlstmt = "select * from book where title=\'" + title + "\'";
            ResultSet rs = stmt.executeQuery(sqlstmt);
            int flag = 0;
            while (rs.next()) {
                pw.println("<div align=\"center\">");
                pw.println("TITLE:" + rs.getString(1) + "<br>");
                pw.println("AUTHOR :" + rs.getString(2) + "<br>");
                pw.println("VERSION:" + rs.getString(3) + "<br>");
                pw.println("PUBLISHER :" + rs.getString(4) + "<br>");
                pw.println("COST:" + rs.getString(5) + "<br>");
                pw.println("</div>");
                flag = 1;
            }
            if (flag == 0) {
                pw.println("<br><br>SORRY INVALID TITLE TRY AGAIN<br><br>");
                pw.println("<a href=\"catalog.html\">Press here to retry.</a>");
            }
            pw.println("</body></html>");
        } catch (Exception e) {
            resp.sendError(500, e.toString());
        }
    }
}