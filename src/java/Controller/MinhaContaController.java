package Controller;

import DAO.UserDAO;
import DAO.WalletDAO;
import Model.User;
import Model.Wallet;
import Util.Global;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class MinhaContaController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = Global.getUser(request, response);
        session.setAttribute("wallet", getWallet(user.getWallet()));
        response.sendRedirect("Pages/minhaConta.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        User user = Global.getUser(request, response);
        user.setFirstName(request.getParameter("nome"));
        user.setLastName(request.getParameter("sobrenome"));
        user.setEmail(request.getParameter("email"));

        UserDAO userDAO = new UserDAO();
        userDAO.update(user);
        session.setAttribute("user", user);
        response.sendRedirect("MinhaContaController");
    }

    private Wallet getWallet(int idWallet) {
        Wallet wallet = new Wallet();
        WalletDAO walletDAO = new WalletDAO();

        try {
            ResultSet rs = walletDAO.findById(idWallet);
            rs.next();
            wallet.setAmount(rs.getFloat("amount"));
            wallet.setCoin(rs.getFloat("coin"));
            wallet.setId(rs.getInt("id"));
            wallet.setUser(rs.getInt("user"));
        } catch (SQLException ex) {
            Logger.getLogger(MinhaContaController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return wallet;
    }

}
