package Controller;

import DAO.WalletDAO;
import Model.User;
import Model.Wallet;
import Util.Global;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class WalletController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = Global.getUser(request, response);
        Wallet wallet = getWallet(user.getWallet());
        Global.printRequestParameters(request);
        float valor = Float.parseFloat(request.getParameter("valor"));
        boolean erro = false;
        switch (request.getParameter("action")) {
            case "retirada":
                if (wallet.getAmount() >= valor) {
                    wallet.setAmount(wallet.getAmount() - valor);
                } else {
                    erro = true;
                }
                break;
            case "deposito":
                wallet.setAmount(wallet.getAmount() + valor);
                break;
        }

        WalletDAO walletDAO = new WalletDAO();
        int update = walletDAO.update(wallet);
        if (update == -1) {
            erro = true;
        }

        if (erro) {
            response.sendRedirect("Pages/deposito.jsp?erro=1");
        } else {
            response.sendRedirect("MinhaContaController");
        }
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

    private void retirada() {
    }

    private void deposito(Wallet wallet, float valor) {

    }
}
