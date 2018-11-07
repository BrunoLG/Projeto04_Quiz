<%-- 
    Document   : quiz
    Created on : 28/10/2018, 00:47:52
    Author     : BrunoLG <bruno_lg1998@hotmail.com>
--%>
<%@page import="br.com.fatecpg.quiz.Historic"%>
<%@page import="java.util.Calendar"%>
<%@page import="br.com.fatecpg.quiz.Db"%>
<%@page import="br.com.fatecpg.quiz.Question"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/head.jspf" %>
        <title>Quiz Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand navbar-light bg-dark">
            <a class="navbar-brand font-weight-bold text-white" href="Index.jsp">Grupo 05</a>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="btn btn-primary font-weight-bold mr-2" href="profile.jsp" role="button">Voltar</a>
                </li>
            </ul>
        </nav>
        <%  String user = (String) session.getAttribute("user");
            if (user == null || user == "") {
                response.sendRedirect("index.jsp");
            } else { %>
        <div class="container py-4">
            <p class="h2">Quiz</p>
            <% if (request.getParameter("send") != null) {
                    double result = 0;

                    for (Question q : Db.getQuestions()) {
                        String userAnswer = request.getParameter(q.getQuestion());
                        if (userAnswer.equals(q.getAnswer())) {
                            result++;
                        }
                    }

                    Calendar calendar = Calendar.getInstance();
                    calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DATE),
                            calendar.get(Calendar.HOUR_OF_DAY), calendar.get(Calendar.MINUTE));

                    Db.getHistoric().add(new Historic(user, result, calendar.getTime()));
                    response.sendRedirect("profile.jsp");
            %>
            <div class="row">
                <div class="col-md-12">
                    <div class="text-center">
                        <h2 class="display-3"><%= (result)%></h2>
                        <p class="h4">Nota</p>
                    </div>
                    <% } %>
                    <form>
                        <% for (Question q : Db.getQuestions()) {%>
                        <div class="py-2">
                            <div class="bg-dark p-2 mb-4">
                                <p class="h3 text-white"><%= q.getQuestion()%></p>
                            </div>
                            <% for (int i = 0; i < q.getAlternatives().length; i++) {%>
                            <div class="form-group">
                                <input type="radio" class="radio-inline" name="<%= q.getQuestion()%>" value="<%= q.getAlternatives()[i]%>" required> <%=q.getAlternatives()[i]%>
                            </div>
                            <% } %>
                        </div>
                        <% } %>
                        <div class="form-group">
                            <input type="submit" class="btn btn-success mb-4" name="send" value="Enviar"/>
                        </div> 
                    </form>
                </div>
            </div>
            <% }%>
        </div>
    </body>
</html>
