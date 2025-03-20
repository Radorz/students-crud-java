<%@ page import="beans.Student" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Estudiante</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-4">
    <h2 class="text-center">Formulario de Estudiante</h2>

    <% 
        Student student = (Student) request.getAttribute("student");
        boolean isEdit = (student != null);
    %>

    <form action="StudentServlet" method="post" class="p-4 border rounded">
        <input type="hidden" name="id" value="<%= (isEdit ? student.getId() : "") %>">
        <input type="hidden" name="action" value="<%= (isEdit ? "update" : "add") %>">

        <div class="mb-3">
            <label class="form-label">Nombre:</label>
            <input type="text" name="name" class="form-control" value="<%= (isEdit ? student.getName() : "") %>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Dirección:</label>
            <input type="text" name="address" class="form-control" value="<%= (isEdit ? student.getAddress() : "") %>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Colegio:</label>
            <input type="text" name="school" class="form-control" value="<%= (isEdit ? student.getSchool() : "") %>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Estado:</label>
            <select name="status" class="form-control">
                <option value="Activo" <%= (isEdit && "Activo".equals(student.getStatus())) ? "selected" : "" %>>Activo</option>
                <option value="Inactivo" <%= (isEdit && "Inactivo".equals(student.getStatus())) ? "selected" : "" %>>Inactivo</option>
            </select>
        </div>

        <button type="submit" class="btn btn-success"><%= (isEdit ? "Actualizar" : "Agregar") %></button>
        <a href="StudentServlet" class="btn btn-secondary">Cancelar</a>
    </form>
</body>

</html>
