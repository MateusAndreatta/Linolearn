package Controller;

import DAO.CourseDAO;
import DAO.CourseLogTransactionDAO;
import DAO.VideoDAO;
import DAO.VideoWatchedDAO;
import Model.Course;
import Model.User;
import Model.Video;
import Model.VideoWatched;
import Util.Global;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 */
public class CourseController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String parameter = request.getParameter("id");

        HttpSession session = request.getSession();

        User user = Global.getUser(request, response);
        Course course = getCourse(Integer.parseInt(parameter));
        session.setAttribute("course", course);
        session.setAttribute("videos", getVideos(Integer.parseInt(parameter)));
        session.setAttribute("buyed", userHasBuyed(user.getId(), course.getId()));
        session.setAttribute("userGotCashback", userGotCashback(user.getId(), course.getId()));
        session.setAttribute("videosWatched", getVideosWatched(user.getId(), course.getId()));
        response.sendRedirect("Pages/curso.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Course c = new Course();
            CourseDAO cd = new CourseDAO();

            ResultSet rs = cd.findById(Integer.parseInt(request.getParameter("courseId")));

            rs.next();

            c.setId(rs.getInt("id"));
            c.setName(request.getParameter("courseName"));
            c.setDescription(request.getParameter("courseDescription"));
            c.setCashbackPercentage(Integer.parseInt(request.getParameter("courseCashbackPercentage")));
            c.setImagePath(request.getParameter("courseImagePath"));

            int sucesso = cd.update(c);

            if (sucesso == 1) {
                response.sendRedirect("Pages/meusCursos.jsp?sucesso=true");
            }

            response.sendRedirect("Pages/updateCurso.jsp?erro=2");

        } catch (Exception ex) {
            ex.printStackTrace();
        }
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

    private List<Video> getVideos(int id) {
        List<Video> list = new ArrayList();

        try {
            VideoDAO videoDao = new VideoDAO();
            ResultSet rs = videoDao.findAllVideosByCourseId(id);

            while (rs.next()) {
                Video video = new Video();
                video.setId(rs.getInt("id"));
                video.setCourseId(rs.getInt("course_id"));
                video.setName(rs.getString("name"));
                video.setDescription(rs.getString("description"));
                video.setPath(rs.getString("path"));
                list.add(video);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }

    private boolean userGotCashback(int idUser, int idCourse) {

        boolean resgatou = false;

        try {
            CourseLogTransactionDAO courseLog = new CourseLogTransactionDAO();
            ResultSet rs = courseLog.userHasBuyed(idUser, idCourse);

            while (rs.next()) {
                String cashback = rs.getString("amount_cashback");
                if (cashback != null) {
                    resgatou = true;
                }

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return resgatou;
    }

    private boolean userHasBuyed(int idUser, int idCourse) {

        boolean comprou = false;

        try {
            CourseLogTransactionDAO courseLog = new CourseLogTransactionDAO();
            ResultSet rs = courseLog.userHasBuyed(idUser, idCourse);

            while (rs.next()) {
                comprou = true;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return comprou;
    }

    private List<VideoWatched> getVideosWatched(int idUser, int idCourse) {
        List<VideoWatched> list = new ArrayList();

        try {
            VideoWatchedDAO videoDao = new VideoWatchedDAO();
            ResultSet rs = videoDao.getAllWatchedVideosByCourseIdAndUserId(idCourse, idUser);

            while (rs.next()) {
                VideoWatched video = new VideoWatched();
                video.setId(rs.getInt("id"));
                video.setCourseId(rs.getInt("course_id"));
                video.setIdVideo(rs.getInt("id_video"));
                video.setIdUser(rs.getInt("id_user"));
                list.add(video);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return list;
    }
}
