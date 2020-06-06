package Controller;

import DAO.CourseDAO;
import DAO.UserDAO;
import Model.Course;
import Model.User;
import Util.HashPassword;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = getUser(request.getParameter("email"));

        if (user != null) {

            try {
                if (user.getPassword().equals(HashPassword.hashPassword(request.getParameter("password")))) {
                    session.setAttribute("user", user);
                    session.setAttribute("cursos", getCourse());
                    response.sendRedirect("Pages/home.jsp");
                } else {
                    response.sendRedirect("Pages/login.jsp?erro=2");
                }
            } catch (NoSuchAlgorithmException ex) {
                response.sendRedirect("Pages/login.jsp?erro=3");
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            session.invalidate();
            response.sendRedirect("Pages/login.jsp?erro=1");
        }

    }

    private User getUser(String email) {

        UserDAO usuarioDAO = new UserDAO();
        ResultSet rs = usuarioDAO.findByEmail(email);
        try {
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getInt("role"));
                user.setWallet(rs.getInt("wallet"));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return null;
    }

    private List<Course> getCourse() {

        ArrayList<Course> list = new ArrayList<Course>();
        try {
            CourseDAO courseDao = new CourseDAO();
            ResultSet rs = courseDao.getAllCourses();
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("id"));
                course.setName(rs.getString("name"));
                course.setDescription(rs.getString("description"));
                course.setImagePath(rs.getString("image_path"));
                course.setPrice(rs.getFloat("price"));
                course.setCashbackPercentage(rs.getInt("cashback_percentage"));
                course.setOwner(rs.getInt("owner"));
                list.add(course);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return list;
    }
}
