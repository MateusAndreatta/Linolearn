package Interface;

import java.sql.ResultSet;

public interface BaseDAOActions 
{

    /**
     * Create method with query
     * @param query
     * @return userId
     */
    public int create(String query);
    
    /**
     *
     * @return resultSet
     */
    public ResultSet read(String query);

    /**
     * Update method
     */
    public int update(String query);

    /**
     * Delete Method
     */
    public void delete();
}
