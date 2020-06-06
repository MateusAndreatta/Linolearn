package Model;


public class Wallet extends BaseModel 
{
    private int _user;
    private float _amount;
    private float _coin;

    public Wallet() {
    }

    public Wallet(int _id, int _user, float _amount) 
    {
        this._id = _id;
        this._user = _user;
        this._amount = _amount;
        this._coin = 0.0f;
    }

    public float getCoin() {
        return _coin;
    }

    public void setCoin(float _coin) {
        this._coin = _coin;
    }

    public Wallet(int _user, float _amount, float _coin) {
        this._user = _user;
        this._amount = _amount;
        this._coin = _coin;
    }

    public int getId() {
        return _id;
    }

    public void setId(int _id) {
        this._id = _id;
    }

    public int getUser() {
        return _user;
    }

    public void setUser(int _user) {
        this._user = _user;
    }

    public float getAmount() {
        return _amount;
    }

    public void setAmount(float _amount) {
        this._amount = _amount;
    }
}
