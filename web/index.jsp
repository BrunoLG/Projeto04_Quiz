<%-- 
    Document   : index
    Created on : 28/10/2018, 00:47:37
    Author     : BrunoLG <bruno_lg1998@hotmail.com>
--%>

<%@page import="br.com.fatecpg.quiz.User"%>
<%@page import="java.util.Arrays"%>
<%@page import="br.com.fatecpg.quiz.Db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <title>Login Page</title>
    </head>
    <body class="bg-light">
        <% if (request.getParameter("login") != null || request.getParameter("cadastrar") != null) {
                String user = request.getParameter("user");

                if (request.getParameter("login") != null) {
                    if (Db.searchArrayList(user) || user.equals("")) {
                        session.setAttribute("user", user);
                        response.sendRedirect("profile.jsp");
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                } else {
                    Db.getUser().add(new User(user));
                    response.sendRedirect("index.jsp");
                }

            } else if (request.getParameter("cadastro") != null) { %>
        <div class="container py-4">
            <div class="row">
                <div class="col-md-6 col-sm-12 col-lg-4">
                    <p class="h3 mb-4">Cadastrar</p>
                    <form>
                        <div class="form-group mb-4">
                            <input type="text" class="form-control" name="user" placeholder="Digite seu usuário" value="" />
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-success mb-4" value="Cadastrar" name="cadastrar" />
                            <a class="btn btn-secondary mb-4" href="index.jsp" role="button">Voltar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <% } else {%>
        <div class="container py-4">
            <div class="row">
                <div class="col-md-6 col-sm-12 col-lg-4">
                    <p class="h3 mb-4">Login</p>
                    <form>
                        <div class="form-group mb-4">
                            <input type="text" class="form-control" name="user" placeholder="Digite seu usuário" value="" />
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-success mb-4" value="Login" name="login" />
                            <input type="submit" class="btn btn-primary mb-4" value="Cadastrar" name="cadastro" />
                        </div>
                    </form>
                </div>
            </div>
            <% }%>
        </div>
    </body>
</html>
