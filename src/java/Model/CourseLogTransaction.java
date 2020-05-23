package Model;

public class CourseLogTransaction extends BaseModel 
{
    private int _buyer;
    private int _seller;
    private int _courseId;
    private float _coursePrice;
    private int _cashbackPercentage;
    private int _amountCashback;
    private int _paymentStatus;
    private String _date;

    public CourseLogTransaction() { }

    public CourseLogTransaction(int _id, int _buyer, int _seller, int _courseId, 
            float _coursePrice, int _cashbackPercentage, int _amountCashback, 
            int _paymentStatus, String _date) 
    {
        this._id = _id;
        this._buyer = _buyer;
        this._seller = _seller;
        this._courseId = _courseId;
        this._coursePrice = _coursePrice;
        this._cashbackPercentage = _cashbackPercentage;
        this._amountCashback = _amountCashback;
        this._paymentStatus = _paymentStatus;
        this._date = _date;
    }

    public int getId() {
        return _id;
    }

    public void setId(int _id) {
        this._id = _id;
    }

    public int getBuyer() {
        return _buyer;
    }

    public void setBuyer(int _buyer) {
        this._buyer = _buyer;
    }

    public int getSeller() {
        return _seller;
    }

    public void setSeller(int _seller) {
        this._seller = _seller;
    }

    public int getCourseId() {
        return _courseId;
    }

    public void setCourseId(int _courseId) {
        this._courseId = _courseId;
    }

    public float getCoursePrice() {
        return _coursePrice;
    }

    public void setCoursePrice(float _coursePrice) {
        this._coursePrice = _coursePrice;
    }

    public int getCashbackPercentage() {
        return _cashbackPercentage;
    }

    public void setCashbackPercentage(int _cashbackPercentage) {
        this._cashbackPercentage = _cashbackPercentage;
    }

    public int getAmountCashback() {
        return _amountCashback;
    }

    public void setAmountCashback(int _amountCashback) {
        this._amountCashback = _amountCashback;
    }

    public int getPaymentStatus() {
        return _paymentStatus;
    }

    public void setPaymentStatus(int _paymentStatus) {
        this._paymentStatus = _paymentStatus;
    }

    public String getDate() {
        return _date;
    }

    public void setDate(String _date) {
        this._date = _date;
    }
}
