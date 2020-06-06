package Controller;

import DAO.CourseDAO;
import DAO.CourseLogTransactionDAO;
import DAO.UserDAO;
import DAO.VideoDAO;
import DAO.VideoWatchedDAO;
import DAO.WalletDAO;
import Model.Course;
import Model.CourseLogTransaction;
import Model.User;
import Model.Video;
import Model.VideoWatched;
import Model.Wallet;
import Util.Constants;
import Util.Global;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        session.setAttribute("videosWatched", getVideosWatched(user.getId(), course.getId()));

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

        try {

            request.setCharacterEncoding("UTF-8");

            User user = Global.getUser(request, response);
            WalletDAO walletDAO = new WalletDAO();
            Wallet wallet = new Wallet();

            ResultSet rs = walletDAO.findById(user.getWallet());

            rs.next();

            float valorPrecoCurso = 0.0f;
            float valorNaCarteira = 0.0f;
            float valorComCoin = 0.0f;
            float valorRestante = 0.0f;
            int cashback = 0;
            float valorRetorno = 0;

            valorNaCarteira = rs.getFloat("amount");
            valorComCoin = rs.getFloat("coin");
            valorPrecoCurso = Float.parseFloat(request.getParameter("coursePrice"));

            cashback = Integer.parseInt(request.getParameter("coursePercentage"));

            valorRetorno = valorPrecoCurso / 100 * cashback;

            if ((valorNaCarteira + valorComCoin) >= valorPrecoCurso) {
                valorRestante = valorComCoin - valorPrecoCurso;

                if (valorRestante < 0) {
                    valorNaCarteira += valorRestante;
                    valorComCoin = 0;
                } else {
                    valorComCoin -= valorPrecoCurso;
                    valorNaCarteira += valorRetorno;
                }

                wallet.setCoin(valorComCoin);
                wallet.setAmount(valorNaCarteira);
                wallet.setId(user.getWallet());
                wallet.setUser(user.getId());

                walletDAO.update(wallet);

                CourseLogTransactionDAO log = new CourseLogTransactionDAO();
                CourseLogTransaction cl = new CourseLogTransaction();

                cl.setBuyer(user.getId());
                cl.setSeller(Integer.parseInt(request.getParameter("courseOwner")));
                cl.setCourseId(Integer.parseInt(request.getParameter("courseId")));
                cl.setCoursePrice(valorPrecoCurso);
                cl.setCashbackPercentage(cashback);
                cl.setAmountCashback(valorRetorno);
                cl.setPaymentStatus(Constants.PaymentStatus.FINALIZADO);

                log.create(cl);

                rs = walletDAO.findByUserId(Integer.parseInt(request.getParameter("courseOwner")));

                rs.next();

                wallet.setAmount(rs.getFloat("amount") + valorPrecoCurso);
                wallet.setCoin(rs.getFloat("coin"));
                wallet.setId(rs.getInt("id"));
                wallet.setUser(rs.getInt("user"));

                walletDAO.update(wallet);

                response.sendRedirect("MyCourseController");

            } else {
                response.sendRedirect("Pages/curso.jsp?erro=2");
            }

        } catch (IOException | NumberFormatException | SQLException e) {
            response.sendRedirect("Pages/curso.jsp?erro=1");
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
