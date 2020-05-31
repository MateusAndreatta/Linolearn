package DAO;

import Model.User;
import static Util.FormatArgs.convertToQueryArg;
import java.security.NoSuchAlgorithmException;
import Util.HashPassword;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAO extends BaseDAO 
{   
    public UserDAO() 
    {
        this.conexao = Conexao.getInstance();
        this.colunas = "id, first_name, last_name, email, password, role, wallet";
        this.nomeTabela = "user";
    }
    
    public int create(User user) throws SQLException
    {
        try 
        {    
            this.query = String.format(
                    "INSERT INTO %s (%s) VALUES (%s, %s, %s, %s, %s, %s, %s)",
                    this.nomeTabela,
                    colunas,
                    // Valores
                    null,
                    convertToQueryArg(user.getFirstName()),
                    convertToQueryArg(user.getLastName()),
                    convertToQueryArg(user.getEmail()),
                    convertToQueryArg(HashPassword.hashPassword(user.getPassword())),
                    user.getRole(),
                    null
            );
            
            return super.create(this.query);
        } 
        catch (NoSuchAlgorithmException ex) 
        {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    
    public ResultSet findByEmail(String email)
    {
        try 
        {    
            this.query = String.format(
                    "SELECT * FROM %s " +
                    "WHERE email = %s ",
                    this.nomeTabela,
                    // Valores
                    convertToQueryArg(email)
            );
            
            return super.read(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public ResultSet findById(int idUser)
    {
        try 
        {    
            this.query = String.format(
                    "SELECT * FROM %s " +
                    "WHERE id = %s ",
                    this.nomeTabela,
                    // Valores
                    idUser
            );
            
            return super.read(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public int update(User user)
    {
        try 
        {    
            this.query = String.format(
                    "UPDATE %s " +
                    "SET first_name = %s, last_name = %s, email = %s, "
                            + "password = %s, role = %d, wallet = %d " +
                    "WHERE id = %d ",
                    this.nomeTabela,
                    // Valores
                    convertToQueryArg(user.getFirstName()),
                    convertToQueryArg(user.getLastName()),
                    convertToQueryArg(user.getEmail()),
                    convertToQueryArg(HashPassword.hashPassword(user.getPassword())),
                    user.getRole(),
                    user.getWallet(),
                    user.getId()
            );
            
            return super.update(this.query);
        } 
        catch (NoSuchAlgorithmException ex) 
        {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    
    public int delete(User user) 
    {
        try
        {
            this.query = String.format(
                "DELETE FROM %s " +
                "WHERE id = %s ",
                    this.nomeTabela,
                    // Valores
                    user.getId()
            );
            
            return super.delete(this.query);
            
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
}
