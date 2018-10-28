<%-- 
    Document   : index
    Created on : 28/10/2018, 00:47:37
    Author     : BrunoLG <bruno_lg1998@hotmail.com>
--%>

<%@page import="java.util.Arrays"%>
<%@page import="br.com.fatecpg.quiz.Db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>Login Page</title>
    </head>
    <body>
        <% if (request.getParameter("login") != null) { 
            String user = request.getParameter("user");
            
            if(Db.searchArrayList(user) || user.equals("")){
                session.setAttribute("user", user);
                response.sendRedirect("profile.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
        }%>
        <div class="row">
                <div class="col-md-6">
                    <h3>Login</h3>
                    <form method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" name="user" placeholder="Digite seu usuário" value="" />
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn" value="Login" name="login" />
                        </div>
                    </form>
                </div>
        </div>
    </body>
</html>
