package Controller;

import DAO.UsuarioDAO;
import Model.User;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
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

public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = autenticar(request.getParameter("email"), request.getParameter("password"));

        if (user != null) {
            session.setAttribute("user", user);
            response.sendRedirect("Pages/home.jsp");
//        request.getRequestDispatcher("Pages/home.jsp").forward(request, response);
        } else {
            session.invalidate();
        }

    }

    private User autenticar(String email, String password) {

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        ResultSet rs = usuarioDAO.findByEmail(email);
        try {
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getInt("role"));
                user.setWallet(rs.getInt("wallet"));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return null;
    }
}
