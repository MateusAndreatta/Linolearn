package Controller;

import DAO.VideoDAO;
import Model.Video;
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
 *
 * @author Mateus Andreatta
 */
public class VideoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String parameter = request.getParameter("id");
        HttpSession session = request.getSession();
        session.setAttribute("video", getVideo(Integer.parseInt(parameter)));
        response.sendRedirect("Pages/aula.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private Video getVideo(int id) {
        Video video = new Video();
        try {
            VideoDAO videoDao = new VideoDAO();
            ResultSet rs = videoDao.findById(id);

            while (rs.next()) {
                video.setId(rs.getInt("id"));
                video.setCourseId(rs.getInt("course_id"));
                video.setName(rs.getString("name"));
                video.setDescription(rs.getString("description"));
                video.setPath(rs.getString("path"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return video;
    }
}
