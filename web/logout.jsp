<%-- 
    Document   : logout
    Created on : 28/10/2018, 11:52:20
    Author     : BrunoLG <bruno_lg1998@hotmail.com>
--%>

<%  
    session.invalidate();
    response.sendRedirect("index.jsp"); 
%>
