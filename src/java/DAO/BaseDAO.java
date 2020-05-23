package DAO;

import Interface.BaseDAOActions;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class BaseDAO implements BaseDAOActions
{
    protected Conexao conexao;
    protected String query;
    protected PreparedStatement statement;
    protected ResultSet resultSet;

    @Override
    public void create() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    @Override
    public void create(String query) 
    {
        try 
        {
            statement = conexao.getConnection().prepareStatement(query);
            statement.executeUpdate();
        }
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
    }
    
    @Override
    public ResultSet read() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void update() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void delete() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
