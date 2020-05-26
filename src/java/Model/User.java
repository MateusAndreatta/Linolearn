package Model;

public class User extends BaseModel 
{
    private String _firstName;
    private String _lastName;
    private String _email;
    private String _password;
    private int _role;
    private int _wallet;
    
    public User() {}
    
    public User(String firstName, String lastName, 
            String email, String password, int role) 
    {
        this._firstName = firstName;
        this._lastName = lastName;
        this._email = email;
        this._password = password;
        this._role = role;
    }
    
    public User(int id, String firstName, String lastName, 
            String email, String password, int role) 
    {
        this._id = id;
        this._firstName = firstName;
        this._lastName = lastName;
        this._email = email;
        this._password = password;
        this._role = role;
    }
    
    public User(int id, String firstName, String lastName, 
            String email, String password, int role, int wallet) 
    {
        this._id = id;
        this._firstName = firstName;
        this._lastName = lastName;
        this._email = email;
        this._password = password;
        this._role = role;
        this._wallet = wallet;
    }
    
    public int getId() {
        return _id;
    }

    public void setId(int _id) {
        this._id = _id;
    }

    public String getFirstName() {
        return _firstName;
    }

    public void setFirstName(String _firstName) {
        this._firstName = _firstName;
    }

    public String getLastName() {
        return _lastName;
    }

    public void setLastName(String _lastName) {
        this._lastName = _lastName;
    }

    public String getEmail() {
        return _email;
    }

    public void setEmail(String _email) {
        this._email = _email;
    }

    public String getPassword() {
        return _password;
    }

    public void setPassword(String _password) {
        this._password = _password;
    }

    public int getRole() {
        return _role;
    }

    public void setRole(int _role) {
        this._role = _role;
    }  

    public int getWallet() {
        return _wallet;
    }

    public void setWallet(int _wallet) {
        this._wallet = _wallet;
    }
    
}
