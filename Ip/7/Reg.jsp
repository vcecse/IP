<%@page import="java.sql.*"%>
<%@page import="java.io.*"%> <%
response.setContentType("text/html");
out.println("<html><body>");
String name=request.getParameter("name");
String addr=request.getParameter("addr");
String phno=request.getParameter("phno");
String id1=request.getParameter("id");
String pwd1=request.getParameter("pwd");
int no=Integer.parseInt(phno); 

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/mydatabase", "root", "ajanthiru"); 
Statement stmt=con.createStatement();
String sqlstmt="select id,pwd from login";
ResultSet rs=stmt.executeQuery(sqlstmt);

int flag=0; 
while(rs.next())
{ if(id1.equals(rs.getString(1))&&pwd1.equals(rs.getString(2)))
{ flag=1;
} }
if(flag==1
)
{ out.println("<br><br>SORRY INVALID ID ALREADY EXITS TRY AGAIN WITH NEW ID<br><br>");
out.println("<a href=\"Reg.html\">Press here to retry.</a>");
}
else
{ 
Statement stmt1=con.createStatement();
stmt1.executeUpdate("insert into login values('"+name+"','"+addr+"',"+no+",'"+id1+"','"+pwd1+"');"); 
out.println("<br><br>YOUR DETAILS ARE ENTERED<br><br>");
out.println("<a href=\"Login.html\">Press here to login.</a>");
}
out.println("</body></html>");
con.close();
%> 