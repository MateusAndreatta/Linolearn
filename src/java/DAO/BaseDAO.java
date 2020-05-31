package DAO;

import Interface.BaseDAOActions;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class BaseDAO implements BaseDAOActions
{
    protected Conexao conexao;
    protected String query;
    protected PreparedStatement statement;
    protected ResultSet resultSet;
    protected String colunas = null;
    protected String nomeTabela = "";
   
    @Override
    public int create(String query) 
    {
        printString(query);
         
        try 
        {
            int id = -1;

            this.statement = conexao.getConnection().prepareStatement(
                    this.query,
                    Statement.RETURN_GENERATED_KEYS
            );
            
            this.statement.executeUpdate(
                    this.query, 
                    Statement.RETURN_GENERATED_KEYS
            );
            
            ResultSet rs = this.statement.getGeneratedKeys();
            
            if(rs.next())
            {
                id = rs.getInt(1);
                System.out.println(id);
            }
            
            return id;
        }
        catch (SQLException e) 
        {
            return -1;
        }
    }
    
    @Override
    public ResultSet read(String query) 
    {
        printString(query);
         
        try 
        {
            this.statement = conexao.getConnection().prepareStatement(query);

            this.statement.executeQuery();
            
            resultSet = statement.executeQuery();
            
            return resultSet;
        } 
        catch (SQLException e)
        {
            e.printStackTrace();
            return null;
        }
    }
    
    @Override
    public int update(String query) 
    {
        printString(query);
         
        try 
        {
            this.statement = conexao.getConnection().prepareStatement(
                    this.query,
                    Statement.RETURN_GENERATED_KEYS
            );
            
            int update = this.statement.executeUpdate(
                    this.query, 
                    Statement.RETURN_GENERATED_KEYS
            );
            
            return update;
        }
        catch (SQLException e) 
        {
            return -1;
        }
    }

    @Override
    public int delete(String query) 
    {
        printString(query);
         
        try 
        {
            this.statement = conexao.getConnection().prepareStatement(
                    this.query,
                    Statement.RETURN_GENERATED_KEYS
            );
            
            int delete = this.statement.executeUpdate(
                    this.query, 
                    Statement.RETURN_GENERATED_KEYS
            );
            
            return delete;
        }
        catch (SQLException e) 
        {
            return -1;
        }
    }
    
    private void printString(String query)
    {
        System.out.println("Query executada: " + query);
    }
}
