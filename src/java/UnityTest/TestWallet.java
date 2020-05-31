package UnityTest;

import DAO.UsuarioDAO;
import DAO.WalletDAO;
import Model.User;
import Model.Wallet;
import java.sql.ResultSet;
import java.sql.SQLException;


public class TestWallet 
{
    public static void main(String[] args) throws SQLException 
    {
        User u = null;
        Wallet w = null;
        
        UsuarioDAO ud = new UsuarioDAO();
        WalletDAO wd = new WalletDAO();
              
        ResultSet rs;
        ResultSet rsWall;
        
        rs = ud.findByEmail("charles@linolearn.com");
        
        while (rs.next())
        {
            u = new User(
                    rs.getInt("id"),
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getInt("role"),
                    rs.getInt("wallet")
            );
            
            System.out.println(
                String.format("User [%s] - wallet [%s]",
                    u.getFirstName(), 
                    u.getWallet())
            );
        }
        
        rsWall = wd.read(u.getWallet());
        
        while (rsWall.next())
        {
            w = new Wallet(
                    rsWall.getInt("id"),
                    rsWall.getInt("user"),
                    rsWall.getInt("amount")
            );
            
            System.out.println(
                String.format("Valor na carteira: [%s]", rsWall.getFloat("amount"))
            );
        }
        
        w.setAmount(123.43f);
        
        wd.update(w);
    }
}
