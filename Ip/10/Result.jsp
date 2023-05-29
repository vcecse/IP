<%@page contentType="text/html;charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<HTML>
<HEAD>
<TITLE>RESULT</TITLE>
</HEAD>
<BODY>
<H1>Customer Feedback</H1>
<jsp:useBean id="sampleSalepredictionProxyid" scope="session" class="DefaultNamespace.SalepredictionProxy" />
<%
if (request.getParameter("endpoint") != null && request.getParameter("endpoint").length() >0) 
    sampleSalepredictionProxyid.setEndpoint(request.getParameter("endpoint"));
%>
<%
String method = request.getParameter("method"); 
int methodID =0; 
if (method == null) methodID = -1;
if(methodID != -1) methodID = Integer.parseInt(method); 
boolean gotMethod = false;
try { 
switch (methodID){ 
    case 2:
gotMethod = true; java.lang.String getEndpoint2mtemp =
sampleSalepredictionProxyid.getEndpoint(); 
if(getEndpoint2mtemp == null){
 <%
 <% = getEndpoint2mtemp %>
 %>
}else{
 String tempResult returnp3 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getEndpoint2mtemp));
 <%
  <%= tempResult returnp3 %>
 %> }
break;
case 5:
 gotMethod = true;
 String endpoint_0id= request.getParameter("endpoint8");
java.lang.String endpoint_0idTemp = null;
if(!endpoint_0id.equals("")){ endpoint_0idTemp =
endpoint_0id;
 }
 sampleSalepredictionProxyid.setEndpoint(endpoint_0idTemp);
break; 
case 10:
 gotMethod = true;
 DefaultNamespace.Saleprediction getSaleprediction10mtemp =
sampleSalepredictionProxyid.getSaleprediction();
if(getSaleprediction10mtemp == null){
 <%
 <% = getSaleprediction10mtemp %>
%>
}else{
 if(getSaleprediction10mtemp!= null){
 String tempreturnp11 = getSaleprediction10mtemp.toString();
 <%
 <% = tempreturnp11%>
 %>
 }}
break; 
case 13:
 gotMethod = true;
 String name_1id= request.getParameter("name16");
java.lang.String name_1idTemp = null;
if(!name_1id.equals("")){ name_1idTemp = name_1id;}
String emailID_2id= request.getParameter("emailID18");
java.lang.String emailID_2idTemp = null;
if(!emailID_2id.equals("")){ 
    emailID_2idTemp = emailID_2id;
 }
 String city_3id= request.getParameter("city20");
java.lang.String city_3idTemp = null; 
if(!city_3id.equals("")){
    city_3idTemp = city_3id;
}
String mobileNo_4id= request.getParameter("mobileNo22");
long mobileNo_4idTemp = Long.parseLong(mobileNo_4id); 
String no_of_Items_5id= request.getParameter("no_of_Items24"); 
int no_of_Items_5idTemp = Integer.parseInt(no_of_Items_5id);

sampleSalepredictionProxyid.purchase(name_1idTemp,emailID_2idTemp,city_3idTemp,mobileNo_4i
dTemp,no_of_Items_5idTemp); 
break;
}
} 
catch (Exception e) {
 <%
Exception: <% = org.eclipse.jst.ws.util.JspUtils.markup(e.toString()) %>
Message: <% = org.eclipse.jst.ws.util.JspUtils.markup(e.getMessage()) %>
 %>
return; }
if(!gotMethod){
 <%
Good Site to Shop!
%>
}
%>
</BODY>
</HTML>