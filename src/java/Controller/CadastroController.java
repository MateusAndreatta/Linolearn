package Controller;

import DAO.UsuarioDAO;
import DAO.WalletDAO;
import Model.User;
import Model.Wallet;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CadastroController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
        request.setCharacterEncoding("UTF-8");
        
        User user = new User(
                request.getParameter("firstname"),
                request.getParameter("lastname"),
                request.getParameter("email"),
                request.getParameter("password"),
                Integer.parseInt(request.getParameter("role"))
        );
        
        Wallet wallet = new Wallet();

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        WalletDAO walletDAO = new WalletDAO();
        
        try 
        {
            
            int idUser = usuarioDAO.create(user);
            user.setId(idUser);
            
            wallet.setUser(idUser);
            
            int idWallet = walletDAO.create(wallet);
            user.setWallet(idWallet);
            
            int success = usuarioDAO.update(user);
            
            if (success > 0) 
            { 
                response.sendRedirect("Pages/login.jsp");
            } 
            else {
                response.sendRedirect("Pages/erro.jsp");
            }
            
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(CadastroController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
