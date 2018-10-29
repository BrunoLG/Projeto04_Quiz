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
        <%  String user = (String) session.getAttribute("user");
            if (user == null || user == ""){
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
                    calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DATE),
                                             calendar.get(Calendar.HOUR_OF_DAY), calendar.get(Calendar.MINUTE));

                    Db.getHistoric().add(new Historic(user, result, calendar.getTime()));
                %>
                <h1>Nota: <%= (result) %></h1>
                <% } %>
                <div class="row">
                    <div class="col-md-6">
                        <form>
                            <% for(Question q: Db.getQuestions()){ %>
                                <h3>Question: <%= q.getQuestion() %></h3>
                                <% for(int i=0; i<q.getAlternatives().length; i++){ %>
                                    <div class="form-group">
                                        <input type="radio" class="radio-inline" name="<%= q.getQuestion() %>" value="<%= q.getAlternatives()[i] %>" required><%=q.getAlternatives()[i] %>
                                    </div>
                                <% } %>
                            <% } %>
                            <div class="form-group">
                                <input type="submit" class="btn btn-primary mb-4" name="send" value="Enviar"/>
                                <a class="btn btn-secondary mb-4" href="profile.jsp" role="button">Voltar</a>  
                            </div> 
                        </form>
                    </div>
                </div>
        <% } %>
    </body>
</html>
