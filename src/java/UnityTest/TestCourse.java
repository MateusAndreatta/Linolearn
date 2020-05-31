package UnityTest;

import DAO.CourseDAO;
import DAO.UsuarioDAO;
import DAO.WalletDAO;
import Model.Course;
import Model.User;
import Model.Wallet;
import java.sql.ResultSet;
import java.sql.SQLException;


public class TestCourse 
{
    public static void main(String[] args) throws SQLException 
    {
        Course c = new Course();
        
        c.setName("Curso Teste");
        c.setDescription("Curso criado pela interface de teste unitário manual");
        c.setImagePath("123123.jpg");
        c.setPrice(19.99f);
        c.setCashbackPercentage(10);
        c.setOwner(43);
        
        CourseDAO cd = new CourseDAO();
        
        c.setId(cd.create(c));
        
        ResultSet rs = cd.read(c.getId());
                 
        while (rs.next())
        {
            System.out.println(
                String.format("Course [%s] - Description [%s]",
                    c.getName(), 
                    c.getDescription())
            );
        }
        
        
        c.setName("Curso com nome alterado");
        c.setDescription("Curso com descricao alterada");
        c.setImagePath("22222222222222222.jpg");
        c.setPrice(49.99f);
        c.setCashbackPercentage(50);
        c.setOwner(1);
        
        cd.update(c);
        
        rs = cd.read(c.getId());
                 
        while (rs.next())
        {
            System.out.println(
                String.format("Att: Course [%s] - Description [%s]",
                    c.getName(), 
                    c.getDescription())
            );
        }
        
        // Delete
        
    }
}
