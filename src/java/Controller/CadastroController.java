package Controller;

import DAO.UsuarioDAO;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CadastroController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        System.out.println(request.getParameter("firstname"));
        System.out.println(request.getParameter("lastname"));
        System.out.println(request.getParameter("email"));
        System.out.println(request.getParameter("password"));
        System.out.println(request.getParameter("role"));
        
        User user = new User(null,request.getParameter("firstname"),request.getParameter("lastname"),request.getParameter("email"),request.getParameter("password"),Integer.parseInt(request.getParameter("role")));

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        usuarioDAO.create(user);
        
    }

}
