package Controller;

import DAO.VideoDAO;
import DAO.VideoWatchedDAO;
import Model.User;
import Model.Video;
import Model.VideoWatched;
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
import javax.websocket.Session;

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
        HttpSession session = request.getSession();

        String parameter = request.getParameter("videoId");
        VideoWatched videoWatched = new VideoWatched();
        User user = Global.getUser(request, response);
        videoWatched.setIdVideo(Integer.parseInt(parameter));
        videoWatched.setCourseId(Integer.parseInt(request.getParameter("courseId")));
        videoWatched.setIdUser(user.getId());

        VideoWatchedDAO vwdao = new VideoWatchedDAO();
        try {
            vwdao.create(videoWatched);
            List<VideoWatched> list = (List<VideoWatched>) session.getAttribute("videosWatched");
            list.add(videoWatched);
            session.setAttribute("videosWatched", list);
            response.sendRedirect("Pages/curso.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(VideoController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
