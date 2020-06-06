package Controller;

import DAO.CourseDAO;
import DAO.CourseLogTransactionDAO;
import Model.Course;
import Model.User;
import Util.Constants;
import Util.Global;
import java.io.IOException;
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

/**
 *
 * @author Mateus Andreatta
 */
public class MyCourseController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = Global.getUser(request, response);

        HttpSession session = request.getSession();

        if (Global.checkPermission(user, Constants.Role.PROFESSOR)) {
            getAllCreated(user.getId());
            session.setAttribute("createdCourses", getAllCreated(user.getId()));
        }
        session.setAttribute("buyedCourses", getAllBuyed(user.getId()));
        response.sendRedirect("Pages/meusCursos.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private List<Course> getAllBuyed(int userId) {
        List<Course> list = new ArrayList();
        CourseLogTransactionDAO log = new CourseLogTransactionDAO();
        CourseDAO cdao = new CourseDAO();
        try {
            ResultSet rs = log.getAllBuyedCoursesByUserId(userId);
            while (rs.next()) {
                ResultSet findById = cdao.findById(rs.getInt("course_id"));
                while (findById.next()) {
                    Course c = new Course();
                    c.setCashbackPercentage(findById.getInt("cashback_percentage"));
                    c.setDescription(findById.getString("description"));
                    c.setId(findById.getInt("id"));
                    c.setImagePath(findById.getString("image_path"));
                    c.setName(findById.getString("name"));
                    c.setOwner(findById.getInt("owner"));
                    c.setPrice(findById.getFloat("price"));
                    list.add(c);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(MyCourseController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    private List<Course> getAllCreated(int userId) {
        List<Course> list = new ArrayList();
        CourseDAO cdao = new CourseDAO();

        try {
            ResultSet rs = cdao.getAllCoursesByOwnerID(userId);
            while (rs.next()) {
                Course c = new Course();
                c.setCashbackPercentage(rs.getInt("cashback_percentage"));
                c.setDescription(rs.getString("description"));
                c.setId(rs.getInt("id"));
                c.setImagePath(rs.getString("image_path"));
                c.setName(rs.getString("name"));
                c.setOwner(rs.getInt("owner"));
                c.setPrice(rs.getFloat("price"));
                list.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MyCourseController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
