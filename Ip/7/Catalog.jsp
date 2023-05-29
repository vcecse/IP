<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<% out.println("<html><body>");
String title=request.getParameter("title");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/mydatabase", "root", "ajanthiru"); 
Statement stmt=con.createStatement();
String sqlstmt="select * from book where title=\'"+title+"\';"; 
ResultSet rs=stmt.executeQuery(sqlstmt);
int flag=0; 
while(rs.next())
{
out.println("<div align=\"center\">");
out.println("TITLE:"+rs.getString(1)+"<br>");
out.println("AUTHOR :"+rs.getString(2)+"<br>"); 
out.println("VERSION:"+rs.getString(3)+"<br>");
out.println("PUBLISHER :"+rs.getString(4)+"<br>"); 
out.println("COST:"+rs.getString(5)+"<br>"); 
out.println("</div>");
flag=1; } 
if(flag==0)
{
out.println("<br><br>SORRY INVALID TITLE TRY AGAIN <br><br>");
out.println("<a href=\"Catalog.html\">Press here to retry.</a>");
}
out.println("</body></html>");
con.close();
%>