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
   
    @Override
    public int create(String query) 
    {
        printString(query);
         
        try 
        {
            int id = -1;
            // Definição para retorno do ultimo id criado
            this.statement = conexao.getConnection().prepareStatement(
                    this.query,
                    Statement.RETURN_GENERATED_KEYS
            );
            
            this.statement.executeUpdate(
                    this.query, 
                    Statement.RETURN_GENERATED_KEYS
            );
            
            ResultSet rs = this.statement.getGeneratedKeys();
            
            // Retorno id do último registro criado
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
            
        } 
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return resultSet;
    }

    
    @Override
    public int update(String query) 
    {
        printString(query);
         
        try 
        {
            // Definição para retorno do ultimo id criado
            this.statement = conexao.getConnection().prepareStatement(
                    this.query,
                    Statement.RETURN_GENERATED_KEYS
            );
            
            int update = this.statement.executeUpdate(
                    this.query, 
                    Statement.RETURN_GENERATED_KEYS
            );
            
            // Retorno id do último registro criado
            return update;
        }
        catch (SQLException e) 
        {
            return -1;
        }
    }

    @Override
    public void delete() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    
    private void printString(String query)
    {
        System.out.println("Query executada: " + query);
    }
}
