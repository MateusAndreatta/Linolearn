package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

    private Connection connection;
    private String url = "jdbc:mysql://127.0.0.1:3306/linolearn?useSSL=false";

    public Conexao() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = (Connection) DriverManager.getConnection(url,"root","");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }

    public Connection getConnection(){
        return connection;
    }
}
