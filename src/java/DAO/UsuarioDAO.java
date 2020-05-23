package DAO;

import Model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {

    private Conexao conexao;
    private String query;
    private PreparedStatement statement;
    private ResultSet resultSet;

    public UsuarioDAO() {
        conexao = Conexao.getInstance();
    }

    public void inserirUsuario(User usuario){
        try {
//            query = "INSERT INTO usuario(nome,email,senha,idade) VALUES (" +"'"+ usuario.getNome() + "'," + "'"+ usuario.getEmail() + "',"
//                    + "'"+ usuario.getSenha() + "'," + usuario.getIdade() + ")";

            statement = conexao.getConnection().prepareStatement(query);
            statement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet listarUsuario(){
        try {
            query = "SELECT * FROM usuario";

            statement = conexao.getConnection().prepareStatement(query);

            statement.executeQuery();
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultSet;
    }

    public void editar(int id, User usuario){
        try {
//            query = "UPDATE usuario SET nome ='"+ usuario.getNome() + "'," + "email = '" + usuario.getEmail() + "'," +
//            "senha = '" + usuario.getSenha() + "'," + "idade = " + usuario.getIdade() + " WHERE id = " +id;
            statement = conexao.getConnection().prepareStatement(query);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deletar(int id){
        try {
            query = "DELETE FROM usuario WHERE id = " + id;

            statement = conexao.getConnection().prepareStatement(query);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
