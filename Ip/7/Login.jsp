<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<% out.println("<html><body>");
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/mydatabase", "root", "ajanthiru"); 
Statement stmt=con.createStatement();
String sqlstmt="select id,pwd from login";
ResultSet rs=stmt.executeQuery(sqlstmt);
int flag=0; 
while(rs.next())
{
if(id.equals(rs.getString(1))&&pwd.equals(rs.getString(2)))
{ flag=1;
} 
}
if(flag==0)
{
out.println("<br><br>SORRY INVALID ID TRY AGAIN ID<br><br>");
out.println("<a href=\"Login.html\">Press here to retry.</a>");
}
else
{
out.println("<br><br>VALID LOGIN ID<br><br>"); 
out.println("<h3><ul>");
out.println("<li><a href=\"Profile.html\"><fontcolor=\"black\">USER PROFILE</font></a></li><br><br>");
out.println("<li><a href=\"Catalog.html\"><fontcolor=\"black\">BOOKS CATALOG</font></a></li><br><br>");
out.println("<li><a href=\"Order.html\"><fontcolor=\"black\">ORDER CONFIRMATION</font></a></li></ul><br><br>");
}
out.println("</body></html>");
con.close();
%> 