package Controller;

import DAO.VideoDAO;
import Model.Video;
import Util.Global;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mateus Andreatta
 */
public class CadastroAulaController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Global.printRequestParameters(request);
        Video v = new Video();
        v.setCourseId(Integer.parseInt(request.getParameter("courseID")));
        v.setDescription(request.getParameter("descricao"));
        v.setName(request.getParameter("nome"));
        v.setPath(request.getParameter("path"));
        
        VideoDAO videoDAO = new VideoDAO();
        try {
            videoDAO.create(v);
        } catch (SQLException ex) {
            Logger.getLogger(CadastroAulaController.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("CourseController?id="+request.getParameter("courseID"));
    }

}
