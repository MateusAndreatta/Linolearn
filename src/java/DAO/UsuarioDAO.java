package DAO;

import Model.User;
import java.security.NoSuchAlgorithmException;
import Util.HashPassword;

public class UsuarioDAO extends BaseDAO 
{
    private final String colunas = "id, first_name, last_name, email, password, "
            + "role, wallet";
    
    public UsuarioDAO() 
    {
        this.conexao = Conexao.getInstance();
    }

    public void create(User user) throws NoSuchAlgorithmException
    {
        
        this.query = String.format(
                "INSERT INTO usuario(%s) VALUES (%s, %s, %s, %s, %s, %s, null)",
                colunas,
                null,
                user.getFirstName(),
                user.getLastName(),
                user.getEmail(),
                HashPassword.hashPassword(user.getPassword()),
                user.getRole(),
                null
        );
        
        super.create(query);
    }

    @Override
    public void update() {
        super.update(); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
