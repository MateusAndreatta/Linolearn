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
public class VideoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Video video = getVideo(Integer.parseInt(id));
        session.setAttribute("video", video);
        String page = "Pages/curso.jsp";
        if (action.equals("edit")) {
            page = "Pages/updateAula.jsp?id=" + video.getCourseId();
        } 
        if(action.equals("watch")) {
            page = "Pages/aula.jsp";
        }
        response.sendRedirect(page);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Global.printRequestParameters(request);
        String action = request.getParameter("action");
        VideoDAO videoDAO = new VideoDAO();
        switch (action) {
            case "cadastro":

                Video v = new Video();
                v.setCourseId(Integer.parseInt(request.getParameter("courseID")));
                v.setDescription(request.getParameter("descricao"));
                v.setName(request.getParameter("nome"));
                v.setPath(request.getParameter("path"));

                try {
                    videoDAO.create(v);
                } catch (SQLException ex) {
                    Logger.getLogger(VideoController.class.getName()).log(Level.SEVERE, null, ex);
                }
//                response.sendRedirect("CourseController?id=" + request.getParameter("courseID"));

                break;
            case "edit":

                Video videoEdit = new Video();
                videoEdit.setCourseId(Integer.parseInt(request.getParameter("courseID")));
                videoEdit.setDescription(request.getParameter("descricao"));
                videoEdit.setName(request.getParameter("nome"));
                videoEdit.setPath(request.getParameter("path"));
                videoEdit.setId(Integer.parseInt(request.getParameter("videoID")));

                videoDAO.update(videoEdit);

                break;
            case "watch":

                String parameter = request.getParameter("videoId");
                VideoWatched videoWatched = new VideoWatched();
                User user = Global.getUser(request, response);
                videoWatched.setIdVideo(Integer.parseInt(parameter));
                videoWatched.setCourseId(Integer.parseInt(request.getParameter("courseID")));
                videoWatched.setIdUser(user.getId());

                VideoWatchedDAO vwdao = new VideoWatchedDAO();
                try {
                    vwdao.create(videoWatched);
                    List<VideoWatched> list = (List<VideoWatched>) session.getAttribute("videosWatched");
                    list.add(videoWatched);
                    session.setAttribute("videosWatched", list);
//                    response.sendRedirect("CourseController?id=" + request.getParameter("courseID"));
                } catch (SQLException ex) {
                    Logger.getLogger(VideoController.class.getName()).log(Level.SEVERE, null, ex);
                }

                break;
        }
        response.sendRedirect("CourseController?id=" + request.getParameter("courseID"));
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
