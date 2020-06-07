package DAO;

import Model.CourseLogTransaction;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class CourseLogTransactionDAO extends BaseDAO
{
    public CourseLogTransactionDAO() 
    {
        this.conexao = Conexao.getInstance();
        this.colunas = "id, buyer, seller, course_id, course_price, cashback_percentage, amount_cashback, payment_status";
        this.nomeTabela = "course_log_transaction";
    }
    
    public int create(CourseLogTransaction courseLogTransaction) throws SQLException
    {
        try 
        {    
            this.query = String.format(
                    "INSERT INTO %s (%s) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)",
                    this.nomeTabela,
                    colunas,
                    // Valores
                    null,
                    courseLogTransaction.getBuyer(),
                    courseLogTransaction.getSeller(),
                    courseLogTransaction.getCourseId(),
                    courseLogTransaction.getCoursePrice(),
                    courseLogTransaction.getCashbackPercentage(),
                    courseLogTransaction.getAmountCashback(),
                    courseLogTransaction.getPaymentStatus()
            );
            
            return super.create(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(CourseLogTransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    
    public ResultSet getAllBuyedCoursesByUserId(int idUser)
    {
        try 
        {    
            this.query = String.format(
                    "SELECT * FROM %s " +
                    "WHERE buyer = %s",
                    this.nomeTabela,
                    // Valores
                    idUser
            );
            
            return super.read(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(CourseLogTransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public ResultSet userHasBuyed(int idUser, int courseId)
    {
        try 
        {    
            this.query = String.format(
                    "SELECT * FROM %s " +
                    "WHERE buyer = %s " +
                    "AND course_id = %s ",
                    
                    this.nomeTabela,
                    // Valores
                    idUser,
                    courseId
            );
            
            return super.read(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(CourseLogTransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public ResultSet getCashbackFromUserAndCourse(int idUser, int courseId)
    {
        try 
        {    
            this.query = String.format(
                    "SELECT * FROM %s " +
                    "WHERE buyer = %s " +
                    "AND course_id = %s " +
                    "ORDER BY date DESC",
                    
                    this.nomeTabela,
                    // Valores
                    idUser,
                    courseId
            );
            
            return super.read(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(CourseLogTransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public ResultSet getAllSelledCoursesByUserId(int idUser)
    {
        try 
        {    
            this.query = String.format(
                    "SELECT * FROM %s " +
                    "WHERE seller = %s",
                    this.nomeTabela,
                    // Valores
                    idUser
            );
            
            return super.read(this.query);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(CourseLogTransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
}
