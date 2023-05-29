<%@page import="java.sql.*"%> 
<%@page import="java.io.*"%>
<% int count;
out.println("<html><body>"); 

String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
String title=request.getParameter("title");
String count1=request.getParameter("no");
String date=request.getParameter("date");
String cno=request.getParameter("cno"); 
count = Integer.parseInt(count1);

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/mydatabase", "root", "ajanthiru"); 
Statement stmt=con.createStatement();
String sqlstmt="select id,pwd from login";
ResultSet rs=stmt.executeQuery(sqlstmt);

int flag=0,amount,x; 
while(rs.next())
{
if(id.equals(rs.getString(1))&&pwd.equals(rs.getString(2)))
{ flag=1;
} 
}
if(flag==0)
{
out.println("<br><br>SORRY INVALID ID TRY AGAIN ID<br><br>");
out.println("<a href= \"Order.html \" >Press here to retry.</a>");
}
else
{
Statement stmt2=con.createStatement();
String s="select cost from book where title=\'"+title+"\';"; 
ResultSet rs1=stmt2.executeQuery(s);

int flag1=0; 
while(rs1.next())
{ flag1=1;
x=Integer.parseInt(rs1.getString(1));
amount=count*x;
out.println("<br><br>AMOUNT:"+amount+"<br><br><br><br>");
Statement stmt1=con.createStatement();
stmt1.executeUpdate("insert into details values('"+id+"','"+title+"',"+amount+",'"+cno+"','"+date+"');"); 
out.println("<br>YOUR ORDER has taken<br>");
}
if(flag1==0)
{
out.println("<br><br><br>SORRY INVALID ID TRY AGAIN ID<br><br>");
out.println("<a href=\"Order.html\">Press here to retry.</a>");
} }
out.println("</body></html>");
con.close();
%> 