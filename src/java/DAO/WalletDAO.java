package DAO;

import Model.Wallet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class WalletDAO extends BaseDAO
{
    public WalletDAO() 
    {
        this.conexao = Conexao.getInstance();
        this.colunas = "id, user, amount";
    }
    
    public int create(Wallet wallet) throws SQLException
    {
        try 
        {    
            this.query = String.format(
                    "INSERT INTO wallet(%s) VALUES (%s, %s, %s)",
                    colunas,
                    null,
                    "'" + wallet.getUser()+ "'",
                    0.00
            );
            
            return super.create(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    
}
