<%@ page contentType="text/html" language="java" import="java.sql.*" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.io.*" %>

<html>
    <head>
        <title>Online exam</title>
        <style type="text/css">
        body{
        background-color:white;font-family:courier;color:green
        }
        </style>
    </head>
    <body>
        <div align="center">
            <h2>ONLINE EXAM</h2>
            <%
                try
                    {
                    String str1 = request.getParameter("ans1");
                    String str2 = request.getParameter("ans2");
                    String str3 = request.getParameter("ans3"); 
                    int mark=0;

                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/mydatabase", "root", "ajanthiru");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("select * From tb_online");

                    while(rs.next())
                    {
                        String dbans1 = rs.getString("ans1");
                            if(str1.equals(dbans1))
                            {
                                mark = mark+5;
                            } 
                        String dbans2 = rs.getString("ans2");
                            if(str2.equals(dbans2))
                            {
                                mark = mark+5;
                            } 
                        String dbans3=rs.getString("ans3");
                            if(str3.equals(dbans3))
                            {
                                mark = mark+5;
                            } 
                    }
                    if(mark>=10)
                    {
                        out.println("<h1>Your Mark is: " + mark+" <h1>");
                        out.println("<h1> congratulations u are eligible for next round<h1>");
                    }
                    else
                    {
                        out.println("<h1> your mark is: "+mark+" </h1>");
                        out.println("<h2> sorry not eligible.</h2>");
                        out.println("<a href= \"online.html\" >Press here to retry.</a>");
                    }
                }
                catch(Exception e)
                {
                    out.println(e);
                } 
            %>
        </div>
    </body>
</html>