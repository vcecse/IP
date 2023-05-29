<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<% out.println("<html><body>");
String id=request.getParameter("id");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/mydatabase", "root", "ajanthiru"); 
Statement stmt=con.createStatement();
String sqlstmt = "select * from login where id = \'" + id + "\'" ;
ResultSet rs=stmt.executeQuery(sqlstmt); 

int flag=0;
out.println("<br><br><br>");
while(rs.next())
{
out.println("<div align=\"center\">");
out.println("NAME :"+rs.getString(1)+"<br>");
out.println("ADDRESS :"+rs.getString(2)+"<br>");
out.println("PHONE NO:"+rs.getString(3)+"<br>"); 
out.println("</div>");
flag=1; }
if(flag==0)
{
out.println("<br><br>SORRY INVALID ID TRY AGAIN ID<br><br>");
out.println("<a href=\"Profile.html\">Press here to retry.</a>");
}
out.println("</body></html>"); 
con.close(); 
%>