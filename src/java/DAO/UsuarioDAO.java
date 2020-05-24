package DAO;

import Model.User;
import java.security.NoSuchAlgorithmException;
import Util.HashPassword;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UsuarioDAO extends BaseDAO 
{
    private final String colunas = "first_name, last_name, email, password, "
            + "role, wallet";
    
    public UsuarioDAO() 
    {
        this.conexao = Conexao.getInstance();
    }

    public void create(User user)
    {
        try {
            
            this.query = String.format(
                    "INSERT INTO user(%s) VALUES (%s, %s, %s, %s, %s, null)",
                    colunas,
                    "'" + user.getFirstName() + "'",
                    "'" + user.getLastName() + "'",
                    "'" + user.getEmail() + "'",
                    "'" + HashPassword.hashPassword(user.getPassword()) + "'",
                    "'" + user.getRole() + "'",
                    "'" + null + "'"
            );
            System.out.println(query);
            super.create(query);
            
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update() {
        super.update(); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
