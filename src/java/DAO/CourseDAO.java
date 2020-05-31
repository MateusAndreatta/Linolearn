package DAO;

import Model.Course;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class CourseDAO extends BaseDAO
{
    public CourseDAO() 
    {
        this.conexao = Conexao.getInstance();
        this.colunas = "id, name, description, image_path, price, cashback_percentage, owner";
        this.nomeTabela = "course";
    }
    
    public int create(Course course) throws SQLException
    {
        try 
        {    
            this.query = String.format(
                    "INSERT INTO %s(%s) VALUES (%s, %s, %s, %s, %s, %s, %s)",
                    this.nomeTabela,
                    colunas,
                    // Valores
                    null,
                    course.getName(),
                    course.getDescription(),
                    course.getImagePath(),
                    course.getPrice(),
                    course.getCashbackPercentage(),
                    course.getOwner()
            );
            
            return super.create(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    
    public int update(Course course) 
    {
        try 
        {    
            this.query = String.format(
                    "UPDATE %s " +
                    "SET name = %s, description = %s, image_path = %s, price = %s, cashback_percentage = %s " +
                    "WHERE id = %s",
                    this.nomeTabela,
                    // Valores
                    course.getName(),
                    course.getDescription(),
                    course.getImagePath(),
                    course.getPrice(),
                    course.getCashbackPercentage(),
                    course.getId()
            );
            
            return super.update(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public ResultSet read(int idCourse)
    {
        try 
        {    
            this.query = String.format(
                    "SELECT * from %s " +
                    "WHERE id = %s",
                    this.nomeTabela,
                    // Valores
                    idCourse
            );
            
            return super.read(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public int delete(int idUser) 
    {
        try
        {
            this.query = String.format(
                    "DELETE FROM %s " +
                    "WHERE id = %s",
                    this.nomeTabela,
                    // Valores
                    idUser
            );
            
            return super.delete(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }   
}