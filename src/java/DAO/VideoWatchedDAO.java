package DAO;

import Model.VideoWatched;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class VideoWatchedDAO extends BaseDAO
{
    public VideoWatchedDAO() 
    {
        this.conexao = Conexao.getInstance();
        this.colunas = "id, id_user, id_video, course_id, finished";
        this.nomeTabela = "video_watched";
    }
    
    public int create(VideoWatched videoWatched) throws SQLException
    {
        try 
        {    
            this.query = String.format(
                    "INSERT INTO %s (%s) VALUES (%s, %s, %s, %s, %s)",
                    this.nomeTabela,
                    colunas,
                    // Valores
                    null,
                    videoWatched.getIdUser(),
                    videoWatched.getIdVideo(),
                    videoWatched.getCourseId(),
                    null
            );
            
            return super.create(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(VideoWatchedDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    
    public ResultSet getAllWatchedVideosByCourseIdAndUserId(int courseId, int idUser)
    {
        try 
        {    
            this.query = String.format(
                    "SELECT * from %s " +
                    "WHERE course_id = %s and id_user = %s ",
                    this.nomeTabela,
                    // Valores
                    courseId,
                    idUser
            );
            
            return super.read(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(VideoWatchedDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
