<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, nic.lw5.Task" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Список задач</title>
    <style>
        table { border-collapse: collapse; margin-top: 15px; }
        th, td { border: 1px solid #333; padding: 6px 12px; text-align: left; }
        th { background-color: #eee; }
    </style>
</head>
<body>

    <h2>Добавление новой задачи</h2>
    
    <!-- Форма отправляет POST-запрос на Сервлет (url-pattern /tasks) -->
    <form method="POST" action="tasks" accept-charset="UTF-8">
        <label for="task">Описание задачи:</label>
        <input type="text" id="task" name="task" placeholder="Введите задачу...">
        <input type="submit" value="Добавить">
    </form>

    <hr>

    <% 
        // Получаем данные из сессии (которые туда положил Сервлет)
        List<Task> tasks = (List<Task>) session.getAttribute("tasks"); 
        if (tasks == null) { tasks = new java.util.ArrayList<>(); }
    %>

    <h3>Список задач (<%= tasks.size() %>)</h3>

    <% if (tasks.isEmpty()) { %>
        <p>Задач пока нет.</p>
    <% } else { %>
        <table>
            <tr>
                <th>№</th>
                <th>Задача</th>
                <th>Дата создания</th>
                <th>Время создания</th>
            </tr>
            <% for (int i = 0; i < tasks.size(); i++) {
                Task t = tasks.get(i); %>
            <tr>
                <td><%= i + 1 %></td>
                <td><%= t.getText() %></td>
                <td><%= t.getDate() %></td>
                <td><%= t.getTime() %></td>
            </tr>
            <% } %>
        </table>
    <% } %>

</body>
</html>