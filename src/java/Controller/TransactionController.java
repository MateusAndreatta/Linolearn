package Controller;

import DAO.CourseLogTransactionDAO;
import DAO.WalletDAO;
import Model.CourseLogTransaction;
import Model.User;
import Model.Wallet;
import Util.Constants;
import Util.Global;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 */
public class TransactionController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            request.setCharacterEncoding("UTF-8");

            User user = Global.getUser(request, response);

            switch (Integer.parseInt(request.getParameter("action"))) {
                case 0:
                    comprarCurso(user, request, response);
                    break;
                case 1:
                    ResgatarCashback(user, request, response);
            }

        } catch (IOException | NumberFormatException | SQLException e) {
            response.sendRedirect("Pages/curso.jsp?erro=1");
        }
    }

    private void ResgatarCashback(User user, HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        WalletDAO walletDAO = new WalletDAO();
        Wallet wallet = new Wallet();
        CourseLogTransaction courseLogTransaction = new CourseLogTransaction();

        CourseLogTransactionDAO log = new CourseLogTransactionDAO();

        ResultSet rs = walletDAO.findById(user.getWallet());
        ResultSet rsLog = log.getCashbackFromUserAndCourse(user.getId(), Integer.parseInt(request.getParameter("courseId")));

        rs.next();
        rsLog.next();

        float valorRetorno = 0;
        float cashback = 0;
        float valorPrecoCurso = 0;

        cashback = rsLog.getInt("cashback_percentage");
        valorPrecoCurso = rsLog.getFloat("course_price");
        
        valorRetorno = valorPrecoCurso / 100 * cashback;

        courseLogTransaction.setAmountCashback(valorRetorno);
        courseLogTransaction.setBuyer(rsLog.getInt("buyer"));
        courseLogTransaction.setCashbackPercentage(rsLog.getInt("cashback_percentage"));
        courseLogTransaction.setCourseId(rsLog.getInt("course_id"));
        courseLogTransaction.setCoursePrice(rsLog.getFloat("course_price"));
        courseLogTransaction.setDate(rsLog.getString("date"));
        courseLogTransaction.setId(rsLog.getInt("id"));
        courseLogTransaction.setPaymentStatus(rsLog.getInt("payment_status"));
        courseLogTransaction.setSeller(rsLog.getInt("seller"));

        wallet.setAmount(rs.getFloat("amount"));
        wallet.setCoin(rs.getFloat("coin") + valorRetorno);
        wallet.setId(rs.getInt("id"));
        wallet.setUser(rs.getInt("user"));

        log.update(courseLogTransaction);
        walletDAO.update(wallet);

        response.sendRedirect("MyCourseController");

    }

    private void comprarCurso(User user, HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        WalletDAO walletDAO = new WalletDAO();
        Wallet wallet = new Wallet();

        ResultSet rs = walletDAO.findById(user.getWallet());

        rs.next();

        float valorPrecoCurso = 0.0f;
        float valorNaCarteira = 0.0f;
        float valorComCoin = 0.0f;
        float valorRestante = 0.0f;
        int cashback = 0;

        valorNaCarteira = rs.getFloat("amount");
        valorComCoin = rs.getFloat("coin");
        valorPrecoCurso = Float.parseFloat(request.getParameter("coursePrice"));

        cashback = Integer.parseInt(request.getParameter("coursePercentage"));


        if ((valorNaCarteira + valorComCoin) >= valorPrecoCurso) {
            valorRestante = valorComCoin - valorPrecoCurso;

            if (valorRestante < 0) {
                valorNaCarteira += valorRestante;
                valorComCoin = 0;

            } else {
                valorComCoin -= valorPrecoCurso;
                //valorNaCarteira += valorRetorno;
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
    }
}
