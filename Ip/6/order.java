package example.order;

import java.sql.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class order extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int count;
        PrintWriter pw = resp.getWriter();
        pw.println("<html><body>");
        String id = req.getParameter("id");
        String pwd = req.getParameter("pwd");
        String title = req.getParameter("title");
        String count1 = req.getParameter("no");
        String date = req.getParameter("date");
        String cno = req.getParameter("cno");
        try {
            count = Integer.parseInt(count1);
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/mydatabase", "root", "ajanthiru");
            Statement stmt = con.createStatement();
            String sqlstmt = "select id,pwd from login";
            ResultSet rs = stmt.executeQuery(sqlstmt);
            int flag = 0, amount, x;
            while (rs.next()) {
                if (id.equals(rs.getString(1)) && pwd.equals(rs.getString(2))) {
                    flag = 1;
                }
            }
            if (flag == 0) {
                pw.println("<br><br>SORRY INVALID ID TRY AGAINID<br><br>");
                pw.println("<a href= \" order.html \" >Press here to retry.</a>");
            } else {
                Statement stmt2 = con.createStatement();
                String s = "select cost from book where title=\'" + title + "\'";
                ResultSet rs1 = stmt2.executeQuery(s);
                int flag1 = 0;
                while (rs1.next()) {
                    flag1 = 1;
                    x = Integer.parseInt(rs1.getString(1));
                    amount = count * x;
                    pw.println("<br><br>AMOUNT :" + amount + "<br><br><br><br>");
                    Statement stmt1 = con.createStatement();
                    stmt1.executeUpdate(
                            "insert into details values('" + id + "','" + title + "'," + amount + ",'" + cno + "','" + date + "');");
                    pw.println("<br>YOUR ORDER has taken<br>");
                }
                if (flag1 == 0) {
                    pw.println("<br><br><br>SORRY INVALID ID TRY AGAIN ID<br><br>");
                    pw.println("<a href=\"order.html\">Press here to retry.</a>");
                }
            }
            pw.println("</body></html>");
            con.close();
        } catch (Exception e) {
            resp.sendError(500, e.toString());
        }
    }
}
