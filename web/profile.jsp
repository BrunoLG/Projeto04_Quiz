<%-- 
    Document   : profile
    Created on : 28/10/2018, 01:09:03
    Author     : BrunoLG <bruno_lg1998@hotmail.com>
--%>

<%@page import="br.com.fatecpg.quiz.User"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="br.com.fatecpg.quiz.Historic"%>
<%@page import="br.com.fatecpg.quiz.Db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>Profile Page</title>
    </head>
    <%  String user = (String) session.getAttribute("user");
        DecimalFormat decimalFormat = new DecimalFormat("#.#");
        decimalFormat.setMinimumFractionDigits(1);
        double result = 0;
        int ac = 0;
        int pos = 0;
        if (user == null) {
            response.sendRedirect("index.jsp");
        } else { %>
    <body class="bg-light">
        <nav class="navbar navbar-expand navbar-light bg-dark">
            <a class="navbar-brand font-weight-bold text-white" href="Index.jsp">Grupo 05</a>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="btn btn-light font-weight-bold mr-2" href="logout.jsp" role="button">Log Out</a>
                </li>
                <% if (User.searchUser(user) == true) { %>
                <li class="nav-item">
                    <a class="btn btn-primary font-weight-bold" href="quiz.jsp" role="button">Realizar Quiz</a>
                </li>
                <% } %>
            </ul>
        </nav>
        <div class="container">
            <div class="row">
                <%--  Ultimos Quizzes Realizados --%>
                <div class="col-lg-6 col-md-12 col-sm-12 my-3">
                    <p class="h3 py-3">Últimos Quizzes Realizados</p>      
                    <table class="table table-hover">   
                        <thead class="legenda">
                            <tr class="bg-primary">
                                <th>Nome</th>
                                <th>Nota</th>
                                <th>Data</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% DateFormat df = new SimpleDateFormat("dd/MM/yyyy - HH:mm");
                                if (User.searchUser(user) == true && user != "") {
                                    for (Historic h : Historic.sortArraybyDate(Db.getHistoric())) {
                                        if (h.getUser().equals(user)) {
                                            if (pos++ < 10) {%>
                                                <tr>
                                                    <td><%= h.getUser() %></td>
                                                    <td><%= decimalFormat.format(h.getResult()) %></td>
                                                    <td><%= df.format(h.getDate()) %></td>
                                                </tr>
                                            <% } %>
                                            <% result += h.getResult();
                                                ac++;
                                            %>
                                        <% } %>
                                    <% } %>
                                    <% if (ac == 0) { %>
                                        <tr><td>Sem históricos</td></tr>
                                    <% } %>
                                <% } else {
                                    for (Historic h : Historic.sortArraybyDate(Db.getHistoric())) {
                                        if (pos++ < 10) {%>
                                        <tr>
                                            <td><%= h.getUser() %></td>
                                            <td><%= decimalFormat.format(h.getResult()) %></td>
                                            <td><%= df.format(h.getDate()) %></td>
                                        </tr>
                                        <% } %>
                                    <% } %>
                                <% } %>
                        </tbody>                        
                    </table>
                </div>

                <%-- Ranking 10 Melhores --%>
                <div class="col-lg-6 col-md-12 col-sm-12 my-3">
                    <p class="h3 py-3">Ranking dos 10 Melhores</p> 
                    <table class="table table-hover">   
                        <thead class="legenda">
                            <tr class="bg-dark">
                                <th>#</th>
                                <th>Nome</th>
                                <th>Nota</th>
                            </tr>
                        </thead>
                        <tbody>   
                           <% for (Historic h : Historic.sortArraybyResult(Db.getHistoric())) { 
                                if (pos++ < 10) { %>
                                    <tr>    
                                        <td><%= Db.getHistoric().indexOf(h) + 1 %>º</td>
                                        <td><%= h.getUser() %></td>
                                        <td><%= decimalFormat.format(h.getResult()) %></td>
                                    </tr>
                                <% } %>  
                            <% } %>
                        </tbody>                        
                    </table>
                </div>
            </div>                      
            <% if (User.searchUser(user) == true) { %>                  
                <div class="text-center">
                <% if (ac == 0) { %>
                    <h2 class="display-3">0</h2>
                <% } else { %>
                    <h2 class="display-3"><%= decimalFormat.format(result / ac) %></h2>
                <% } %>
                <p class="h4">Média</p>
            </div>
            <% } %>
        </div>
        <% } %>
    </body>
</html>
