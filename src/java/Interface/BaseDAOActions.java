package Interface;

import java.sql.ResultSet;

public interface BaseDAOActions 
{

    /**
     * Create method
     */
    public void create();

    /**
     * Create method with query
     * @param query
     */
    public void create(String query);
    
    /**
     *
     * @return resultSet
     */
    public ResultSet read(String query);

    /**
     * Update method
     */
    public void update();

    /**
     * Delete Method
     */
    public void delete();
}
