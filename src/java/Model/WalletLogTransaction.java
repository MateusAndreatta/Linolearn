package Model;


public class WalletLogTransaction 
{
    private int _id;
    private int _idWallet;
    private float _addedAmount;
    private String _date;
    private int _paymentStatus;

    public WalletLogTransaction() { }

    public WalletLogTransaction(int _id, int _idWallet, float _addedAmount, 
            String _date, int _paymentStatus) 
    {
        this._id = _id;
        this._idWallet = _idWallet;
        this._addedAmount = _addedAmount;
        this._date = _date;
        this._paymentStatus = _paymentStatus;
    }

    public int getId() {
        return _id;
    }

    public void setId(int _id) {
        this._id = _id;
    }

    public int getIdWallet() {
        return _idWallet;
    }

    public void setIdWallet(int _idWallet) {
        this._idWallet = _idWallet;
    }

    public float getAddedAmount() {
        return _addedAmount;
    }

    public void setAddedAmount(float _addedAmount) {
        this._addedAmount = _addedAmount;
    }

    public String getDate() {
        return _date;
    }

    public void setDate(String _date) {
        this._date = _date;
    }

    public int getPaymentStatus() {
        return _paymentStatus;
    }

    public void setPaymentStatus(int _paymentStatus) {
        this._paymentStatus = _paymentStatus;
    }   
}
