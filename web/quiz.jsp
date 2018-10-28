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
        <title>JSP Page</title>
    </head>
    <body>
        <%  if (session.getAttribute("user") ==  null || session.getAttribute("user") == ""){
                response.sendRedirect("index.jsp");
            } else { %>
                <h1>Quiz</h1>
                <% if (request.getParameter("send") != null){ 
                    double result = 0;
                    for (Question q: Db.getQuestions()){
                        String userAnswer = request.getParameter(q.getQuestion());
                        if(userAnswer.equals(q.getAnswer())){
                            result++;
                        }
                    }
                    Calendar calendar = Calendar.getInstance();
                    String dateActual = calendar.get(Calendar.DATE) + "/" + 
                                        calendar.get(Calendar.MONTH) + "/" + 
                                        calendar.get(Calendar.YEAR) + " " +
                                        calendar.get(Calendar.HOUR) + " : " +
                                        calendar.get(Calendar.MINUTE);
                    Historic h = new Historic((String) session.getAttribute("user"), result, dateActual);
                    Db.getHistoric().add(h);
                %>
                <hr><hr>
                <h1 style="color:blue">
                    Nota: <u><%= 100*((result)/3.0) %></u>
                </h1>
                <% } %>
                <h2>Test</h2>
                <form>
                    <% for(Question q: Db.getQuestions()){ %>
                        <h3>Question: <%= q.getQuestion() %></h3>
                            <% for(int i=0; i<q.getAlternatives().length; i++){ %>
                            <input type="radio" name="<%= q.getQuestion() %>" value="<%= q.getAlternatives()[i] %>"><%=q.getAlternatives()[i] %>
                            <% } %>
                            <hr>
                    <% } %>
                    <input type="submit" name="send" value="Enviar"/>
                    <a href="profile.jsp" role="button">Voltar</a>
                </form>       
        <% } %>
    </body>
</html>
