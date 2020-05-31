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
        this.colunas = "id, buyer, seller, course_id, course_price, cashback_percentage, amount_cashback, payment_status, date";
        this.nomeTabela = "course_log_transaction";
    }
    
    public int create(CourseLogTransaction courseLogTransaction) throws SQLException
    {
        try 
        {    
            this.query = String.format(
                    "INSERT INTO %s (%s) VALUES (%s, %s, %s, %s, %s)",
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
                    courseLogTransaction.getPaymentStatus(),
                    null
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
                    "SELECT * from %s " +
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
    
    public ResultSet getAllSelledCoursesByUserId(int idUser)
    {
        try 
        {    
            this.query = String.format(
                    "SELECT * from %s " +
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
