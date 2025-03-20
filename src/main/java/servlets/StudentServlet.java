package servlets;

import beans.Student;
import dao.StudentDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
    private Connection connection;
    String url = "jdbc:mysql://localhost:3306/school?useSSL=false&serverTimezone=UTC";
    String user = "";  // Cambia por tu usuario
    String password = "";  // Cambia por tu contraseña

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        StudentDAO dao = new StudentDAO(connection);

        try {
            if ("add".equals(action)) {
                Student student = new Student(
                    0, 
                    request.getParameter("name"), 
                    request.getParameter("address"), 
                    request.getParameter("school"), 
                    request.getParameter("status")
                );
                dao.addStudent(student);
            } else if ("update".equals(action)) {
                Student student = new Student(
                    Integer.parseInt(request.getParameter("id")), 
                    request.getParameter("name"), 
                    request.getParameter("address"), 
                    request.getParameter("school"), 
                    request.getParameter("status")
                );
                dao.updateStudent(student);
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.deleteStudent(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
        response.sendRedirect("StudentServlet"); // Redirige a la lista actualizada
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        StudentDAO dao = new StudentDAO(connection);

        try {
            if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.deleteStudent(id);
                System.out.println("🗑️ Estudiante eliminado con ID: " + id);
                response.sendRedirect("StudentServlet"); // Redirigir a la lista actualizada
                return;
            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Student student = dao.getStudentById(id);
                request.setAttribute("student", student);
                request.getRequestDispatcher("studentForm.jsp").forward(request, response);
                return;
            }

            List<Student> students = dao.getAllStudents();
            request.setAttribute("students", students);
            request.getRequestDispatcher("studentList.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }


}
