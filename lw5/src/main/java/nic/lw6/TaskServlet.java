package nic.lw5;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class TaskServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<Task> tasks = (List<Task>) request.getSession().getAttribute("tasks");
        if (tasks == null) {
            tasks = new ArrayList<>();
            request.getSession().setAttribute("tasks", tasks);
        }
        request.getRequestDispatcher("/TaskList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String taskText = request.getParameter("task");

        if (taskText == null || taskText.trim().isEmpty()) {
            throw new IllegalArgumentException("Текст задачи не может быть пустым!");
        }

        LocalDateTime now = LocalDateTime.now();
        Task newTask = new Task(
                taskText.trim(),
                now.format(DateTimeFormatter.ofPattern("dd.MM.yyyy")),
                now.format(DateTimeFormatter.ofPattern("HH:mm:ss"))
        );

        List<Task> tasks = (List<Task>) request.getSession().getAttribute("tasks");
        if (tasks == null) {
            tasks = new ArrayList<>();
            request.getSession().setAttribute("tasks", tasks);
        }
        tasks.add(newTask);

        request.getRequestDispatcher("/TaskList.jsp").forward(request, response);
    }
}