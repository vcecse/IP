<%@page contentType="text/html;charset=UTF-8"%>
<HTML>
<HEAD>
<TITLE>Inputs</TITLE>
</HEAD>
<BODY>
<H1><center><font color="Magenta" size="30">COIMBATORE SHOPPING SITE</font></center></H1>
<%
String method = request.getParameter("method"); 
int methodID = 0; 
if (method == null) methodID = -1;
boolean valid = true; 
if(methodID != -1) methodID =Integer.parseInt(method); 
switch (methodID){
case 2:
valid = false;
%>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<FORM METHOD="POST" ACTION="RESULT:.jsp" TARGET="RESULT:">
    <INPUT TYPE="HIDDEN" NAME="method"
    VALUE="<%=org.eclipse.jst.ws.util.JspUtils.markup(method)%>">
    <%
    break; 
    case5: 
    valid =false;
    %>
    <FORM METHOD="POST" ACTION="RESULT:.jsp" TARGET="RESULT:">
    <INPUT TYPE="HIDDEN" NAME="method"
    VALUE="<%=org.eclipse.jst.ws.util.JspUtils.markup(method)%>">
    <TABLE>
    <TR>
    <TD COLSPAN="1" ALIGN="LEFT">endpoint:</TD>
    <TD ALIGN="left"><INPUT TYPE="TEXT" NAME="endpoint8" SIZE=20></TD>
    </TR>
    </TABLE>
    <BR>
    <INPUT TYPE="SUBMIT" VALUE="Invoke">
    <INPUT TYPE="RESET" VALUE="Clear">
    </FORM>
    <%
    break;
    case 10:
    valid = false;
    %>
    <FORM METHOD="POST" ACTION="RESULT:.jsp" TARGET="RESULT:">
    <INPUT TYPE="HIDDEN" NAME="method"
    VALUE="<%=org.eclipse.jst.ws.util.JspUtils.markup(method)%>">
    <BR>
    <INPUT TYPE="SUBMIT" VALUE="Invoke">
    <INPUT TYPE="RESET" VALUE="Clear">
    </FORM>
    <FORM METHOD="POST" ACTION="RESULT:.jsp" TARGET="RESULT:">
    <INPUT TYPE="HIDDEN" NAME="method"
    VALUE="<%=org.eclipse.jst.ws.util.JspUtils.markup(method)%>">
    <%
    break;
    case 13:
    valid = false;
    %> 
    <TABLE>
        <TR>
        <TD COLSPAN="1" ALIGN="LEFT">Name:</TD>
        <TD ALIGN="left"><INPUT TYPE="TEXT" NAME="name16" SIZE=20></TD>
        </TR>
        </TABLE>
        <TABLE>
        <TR>
        <TD COLSPAN="1" ALIGN="LEFT">EmailID:</TD>
        <TD ALIGN="left"><INPUT TYPE="TEXT" NAME="emailID18" SIZE=20></TD>
        </TR>
        </TABLE>
        <TABLE>
        <TR>
        <TD COLSPAN="1" ALIGN="LEFT">City:</TD>
        <TD ALIGN="left"><INPUT TYPE="TEXT" NAME="city20" SIZE=20></TD>
        </TR>
        </TABLE>
        <TABLE>
        <TR>
        <TD COLSPAN="1" ALIGN="LEFT">MobileNo:</TD>
        <TD ALIGN="left"><INPUT TYPE="TEXT" NAME="mobileNo22" SIZE=20></TD>
        </TR>
        </TABLE>
        <TABLE>
        <TR>
        <TD COLSPAN="1" ALIGN="LEFT">Quantity:</TD>
        <TD ALIGN="left"><INPUT TYPE="TEXT" NAME="no_of_Items24" SIZE=20></TD>
        </TR>
        </TABLE>
        <BR>
        <INPUT TYPE="SUBMIT" VALUE="Purchase">
        <INPUT TYPE="RESET" VALUE="Clear">
        </FORM>
        <%
        break; 
        case 1111111111:
        valid = false;
        %>
        <TABLE>
        <TR>
            <TD COLSPAN="1" ALIGN="LEFT">URLString:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="url1111111111" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break; 
case 1111111112:
valid = false;
%>
<FORM METHOD="POST" ACTION="RESULT:.jsp" TARGET="RESULT:">
<INPUT TYPE="HIDDEN" NAME="method"
VALUE="<%=org.eclipse.jst.ws.util.JspUtils.markup(method)%>">
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break; }
if (valid) {
%>
Click purchase link to shop now!
<%
}
%>
</BODY>
</HTML>