<%-- 
    Document   : profile
    Created on : 28/10/2018, 01:09:03
    Author     : BrunoLG <bruno_lg1998@hotmail.com>
--%>

<%@page import="br.com.fatecpg.quiz.Historic"%>
<%@page import="br.com.fatecpg.quiz.Db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <%@include file="WEB-INF/jspf/head.jspf" %>
    </head>
    <body class="bg-light">
        <%  String user = (String) session.getAttribute("user");
            if (user ==  null || user == ""){
                response.sendRedirect("index.jsp");
            } else { %>
        <div class="container">
            <div class="row">
                <div class="col-6 text-center my-3">
                    <h1 class="display-3">Últimos Quizzes Realizados</h1>           
                </div>
                <div class="col-6 text-center my-3">
                    <h1 class="display-3">Ranking dos 10 Melhores</h1>           
                </div>
            </div>
            <div class="row">
                <div class="col-6 my-3">
                    <table class="table table-hover">   
                        <thead class="legenda">
                            <tr>
                                <th>Nome</th>
                                <th>Nota</th>
                                <th>Data</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if(Db.searchArrayList(user) != true && user != "") {
                                for(Historic h: Db.getHistoric()){ 
                                    if (h.getUser().equals(user)) { %>
                                        <tr>
                                            <td><%= h.getUser() %></td>
                                            <td><%= h.getResult() %></td>
                                            <td><%= h.getDate() %></td>
                                        </tr>
                                    <% } %>
                                <% } %>
                            <% } else {
                                for(Historic h: Db.getHistoric()){ %>
                                    <tr>
                                        <td><%= h.getUser() %></td>
                                        <td><%= h.getResult() %></td>
                                        <td><%= h.getDate() %></td>
                                    </tr>
                                <%}%>
                            <%}%>
                        </tbody>                        
                        </table>
                </div>
                <div class="col-6 my-3">
                    <table class="table table-hover">   
                        <thead class="legenda">
                            <tr>
                                <th>#</th>
                                <th>Nome</th>
                                <th>Nota</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(Historic h: Db.getHistoric()){ %>
                            <tr>    
                                    <td><%= 1 %>º</td>
                                    <td><%= h.getUser() %></td>
                                    <td><%= h.getResult() %></td>
                            </tr>
                            <%}%>
                        </tbody>                        
                        </table>
                </div>
            </div>                      
            <center> 
                <a class="btn btn-primary mb-4" href="quiz.jsp" role="button">Realizar Quiz</a>
                <a class="btn btn-secondary mb-4" href="logout.jsp" role="button">Log Out</a>
            </center>            
        </div>
        <% } %>
    </body>
</html>
