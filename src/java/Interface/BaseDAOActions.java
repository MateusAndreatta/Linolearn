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
     * @param query
     * @return resultSet
     */
    public ResultSet read(String query);

    /**
     * Update method
     * @param query
     * @return 
     */
    public int update(String query);

    /**
     * Delete Method
     * @param query
     * @return 
     */
    public int delete(String query);
}
