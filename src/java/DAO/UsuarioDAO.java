package DAO;

import Model.User;
import java.security.NoSuchAlgorithmException;
import Util.HashPassword;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UsuarioDAO extends BaseDAO 
{   
    public UsuarioDAO() 
    {
        this.conexao = Conexao.getInstance();
        this.colunas = "id, first_name, last_name, email, password, role, wallet";
    }
    
    public int create(User user) throws SQLException
    {
        try 
        {    
            this.query = String.format(
                    "INSERT INTO user(%s) VALUES (%s, %s, %s, %s, %s, %s, %s)",
                    colunas,
                    null,
                    "'" + user.getFirstName() + "'",
                    "'" + user.getLastName() + "'",
                    "'" + user.getEmail() + "'",
                    "'" + HashPassword.hashPassword(user.getPassword()) + "'",
                    user.getRole(),
                    null
            );
            
            return super.create(this.query);
        } 
        catch (NoSuchAlgorithmException ex) 
        {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    
    public int update(User user)
    {
        try 
        {    
            this.query = String.format(
                    "UPDATE user " +
                    "SET first_name=%s, " +
                        "last_name=%s, " +
                        "email=%s, " +
                        "password=%s, " +
                        "role=%d, " +
                        "wallet=%d " +
                    "WHERE id=%d",
                    "'" + user.getFirstName() + "'",
                    "'" + user.getLastName() + "'",
                    "'" + user.getEmail() + "'",
                    "'" + HashPassword.hashPassword(user.getPassword()) + "'",
                    user.getRole(),
                    user.getWallet(),
                    user.getId()
            );
            
            return super.update(this.query);
        } 
        catch (NoSuchAlgorithmException ex) 
        {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
        
    }
}
