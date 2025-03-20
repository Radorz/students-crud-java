<%@ page import="java.util.List" %>
<%@ page import="beans.Student" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Estudiantes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-4">
    <h2 class="text-center">Lista de Estudiantes</h2>
    <a href="studentForm.jsp" class="btn btn-primary mb-3">Agregar Estudiante</a>

    <% 
        List<Student> students = (List<Student>) request.getAttribute("students");
    %>
      

    <table class="table table-striped table-bordered">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Dirección</th>
                <th>Colegio</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        <% if (students != null) {
            for (Student student : students) { %>
        <tr>
            <td><%= student.getId() %></td>
            <td><%= student.getName() %></td>
            <td><%= student.getAddress() %></td>
            <td><%= student.getSchool() %></td>
            <td><%= student.getStatus() %></td>
            <td>
   				<a href="StudentServlet?action=edit&id=<%= student.getId() %>" class="btn btn-warning btn-sm">Editar</a>
                <a href="StudentServlet?action=delete&id=<%= student.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('¿Seguro que quieres eliminar este estudiante?')">Eliminar</a>
            </td>
        </tr>
        <% } } %>
        </tbody>
    </table>
</body>
</html>
