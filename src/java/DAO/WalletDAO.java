package DAO;

import Model.Wallet;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class WalletDAO extends BaseDAO
{
    public WalletDAO() 
    {
        this.conexao = Conexao.getInstance();
        this.colunas = "id, user, amount";
        this.nomeTabela = "wallet";
    }
    
    public int create(Wallet wallet) throws SQLException
    {
        try 
        {    
            this.query = String.format(
                    "INSERT INTO %s (%s) VALUES (%s, %s, %s)",
                    this.nomeTabela,
                    colunas,
                    // Valores
                    null,
                    wallet.getUser(),
                    0.00f
            );
            
            return super.create(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    
    public int update(Wallet wallet) 
    {
        try 
        {    
            this.query = String.format(
                    "UPDATE %s " +
                    "SET amount = %s " +
                    "WHERE id = %s",
                    this.nomeTabela,
                    // Valores
                    wallet.getAmount(),
                    wallet.getId()
            );
            
            return super.update(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public ResultSet read(int idWallet)
    {
        try 
        {    
            this.query = String.format(
                    "SELECT * from %s " +
                    "WHERE id = %s",
                    this.nomeTabela,
                    // Valores
                    idWallet
            );
            
            return super.read(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
