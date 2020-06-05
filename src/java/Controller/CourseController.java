package Controller;

import DAO.CourseDAO;
import Model.Course;
import Model.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mateus Andreatta
 */
public class CourseController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String parameter = request.getParameter("id");
        System.out.println(parameter);

        HttpSession session = request.getSession();
        session.setAttribute("course", getCourse(Integer.parseInt(parameter)));

        //manda o curso, porem mantem a url errada e isso causa outros erros
//        request.setAttribute("course", getCourse(Integer.parseInt(parameter)));
//        request.getRequestDispatcher("Pages/curso.jsp").forward(request, response);

//        
        //vai com a url certa, mas nao consegue mandar o curso
        response.sendRedirect("Pages/curso.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private Course getCourse(int id) {
        Course course = new Course();
        try {
            CourseDAO courseDao = new CourseDAO();
            ResultSet rs = courseDao.findById(id);

            while (rs.next()) {
                course.setId(rs.getInt("id"));
                course.setName(rs.getString("name"));
                course.setDescription(rs.getString("description"));
                course.setImagePath(rs.getString("image_path"));
                course.setPrice(rs.getFloat("price"));
                course.setCashbackPercentage(rs.getInt("cashback_percentage"));
                course.setOwner(rs.getInt("owner"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return course;
    }

}
