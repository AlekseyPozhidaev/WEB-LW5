<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ошибка приложения</title>
</head>
<body>
    <h2 style="color: red;">Произошла ошибка при обработке запроса!</h2>
    
    <p><strong>Причина:</strong> <%= exception.getMessage() %></p>
    
    <br>
    <a href="TaskList.jsp">Вернуться к списку задач</a>
</body>
</html>