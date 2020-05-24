package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao 
{
    private static Conexao instancia;
    private static Connection conexao;

    final static String URL = "jdbc:mysql://127.0.0.1:3306/linolearn?useSSL=false";
    final static String USER = "root";
    final static String PASSWORD = "";
    private String url = "jdbc:mysql://127.0.0.1:3306/linolearn?useSSL=false";

    private Conexao()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            conexao = (Connection) DriverManager.getConnection(url, "root", "");
        }
        catch (ClassNotFoundException | SQLException e)
        {
            e.printStackTrace();
        }
    }

    public static Conexao getInstance()
    {
        if (instancia == null)
            instancia = new Conexao();

        return instancia;
    }

    public Connection getConnection()
    {
        return conexao;
    }
}
