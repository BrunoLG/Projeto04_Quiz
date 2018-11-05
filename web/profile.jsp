<%-- 
    Document   : profile
    Created on : 28/10/2018, 01:09:03
    Author     : BrunoLG <bruno_lg1998@hotmail.com>
--%>

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
    <% String user = (String) session.getAttribute("user");
        double result = 0;
        int i = 0;
        int pos = 1;
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
                <% if (Db.searchArrayList(user) == true) {
                        DecimalFormat dF = new DecimalFormat("#.#");
                %>
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
                            <% DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                                if (Db.searchArrayList(user) == true && user != "") {
                                    for (Historic h : Db.sortArraybyDate(Db.getHistoric())) {
                                        if (h.getUser().equals(user)) {%>
                            <tr>
                                <td><%= h.getUser()%></td>
                                <td><%= h.getResult()%></td>
                                <td><%= df.format(h.getDate())%></td>
                            </tr>
                            <% result += h.getResult();
                                i++;
                            %>
                            <% } %>
                            <% } %>
                            <% } else {
                                for (Historic h : Db.sortArraybyDate(Db.getHistoric())) {%>
                            <tr>
                                <td><%= h.getUser()%></td>
                                <td><%= h.getResult()%></td>
                                <td><%= df.format(h.getDate())%></td>
                            </tr>
                            <%}%>
                            <%}%>
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
                            <% for (Historic h : Db.sortArraybyResult(Db.getHistoric())) { %>
                            <% if (pos <= 10) {%>
                            <tr>    
                                <td><%= pos++%>º</td>
                                <td><%= h.getUser()%></td>
                                <td><%= h.getResult()%></td>
                            </tr>
                            <% } %>  
                            <%}%>
                        </tbody>                        
                    </table>
                </div>
            </div>                      
            <% if (Db.searchArrayList(user) == true) {
                    DecimalFormat dF = new DecimalFormat("#.#");%>
            <div class="text-center">
                <h2 class="display-3"><%= dF.format(result / i)%></h2>
                <p class="h4">Média</p>
            </div>
            <% } %>              

        </div>
        <% }%>
    </body>
</html>
