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
    <body>
        <body class="bg-light">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center my-5">
                    <h1 class="display-3">Últimos Quizzes Realizados</h1>           
                </div>
            </div>
            <div class="row">
                <div class="col-12 my-3">
                    <table class="table table-hover">   
                        <thead class="legenda">
                            <tr>
                                <th>#</th>
                                <th>Nome</th>
                                <th>Nota</th>
                                <th>Data</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(Historic h: Db.getHistoric()){ %>
                            <tr>
                                    <% int i = Db.getHistoric().indexOf(h); %>
                                    <td><%= i %></td>
                                    <td><%= h.getUser() %></td>
                                    <td><%= h.getResult() %></td>
                                    <td><%= h.getDate() %></td>
                            </tr>
                            <%}%>
                        </tbody>                        
                        </table>
                </div>
            </div>
            <center> 
                <a class="btn btn-primary mb-4" href="quiz.jsp" role="button">Realizar Quiz</a>
                <a class="btn btn-secondary mb-4" href="index.jsp" role="button">Log Out</a>
            </center>            
        </div>
    </body>
</html>
