package DAO;

import Model.Video;
import static Util.FormatArgs.convertToQueryArg;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class VideoDAO extends BaseDAO
{
    public VideoDAO() 
    {
        this.conexao = Conexao.getInstance();
        this.colunas = "id, course_id, name, description, path";
        this.nomeTabela = "video";
    }
    
    public int create(Video video) throws SQLException
    {
        try 
        {    
            this.query = String.format(
                    "INSERT INTO %s (%s) VALUES (%s, %s, %s, %s, %s)",
                    this.nomeTabela,
                    colunas,
                    // Valores
                    null,
                    video.getCourseId(),
                    convertToQueryArg(video.getName()),
                    convertToQueryArg(video.getDescription()),
                    convertToQueryArg(video.getPath())
            );
            
            return super.create(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(VideoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    
    public ResultSet findById(int idVideo)
    {
        try 
        {    
            this.query = String.format(
                    "SELECT * from %s " +
                    "WHERE id = %s",
                    this.nomeTabela,
                    // Valores
                    idVideo
            );
            
            return super.read(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(VideoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public ResultSet findAllVideosByCourseId(int courseId)
    {
        try 
        {    
            this.query = String.format(
                    "SELECT * from %s " +
                    "WHERE course_id = %s",
                    this.nomeTabela,
                    // Valores
                    courseId
            );
            
            return super.read(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(VideoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public int update(Video video) 
    {
        try 
        {    
            this.query = String.format(
                    "UPDATE %s " +
                    "SET name = %s, description = %s, path = %s " +
                    "WHERE id = %s",
                    this.nomeTabela,
                    // Valores
                    convertToQueryArg(video.getName()),
                    convertToQueryArg(video.getDescription()),
                    convertToQueryArg(video.getPath()),
                    video.getId()
            );
            
            return super.update(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(VideoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    
    public int delete(Video video) 
    {
        try
        {
            this.query = String.format(
                    "DELETE FROM %s " +
                    "WHERE id = %s",
                    this.nomeTabela,
                    // Valores
                    video.getId()
            );
            
            return super.delete(this.query);
            
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(VideoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    
    public int deleteAllFromSameCourseByCourseId(int courseId) 
    {
        try
        {
            this.query = String.format(
                    "DELETE FROM %s " +
                    "WHERE course_id = %s",
                    this.nomeTabela,
                    // Valores
                    courseId
            );
            
            return super.delete(this.query);
            
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(VideoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
}
