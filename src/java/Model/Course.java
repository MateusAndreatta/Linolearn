package Model;

public class Course {
    
    private int _id;
    private String _name;
    private String _description;
    private String _imagePath;
    private float _price;
    private int _cashbackPercentage;
    private int _owner;

    public Course() {
    }

    public Course(int _id, String _name, String _description, String _imagePath, Float _price, int _cashbackPercentage, int _owner) {
        this._id = _id;
        this._name = _name;
        this._description = _description;
        this._imagePath = _imagePath;
        this._price = _price;
        this._cashbackPercentage = _cashbackPercentage;
        this._owner = _owner;
    }

    public int getId() {
        return _id;
    }

    public void setId(int _id) {
        this._id = _id;
    }

    public String getName() {
        return _name;
    }

    public void setName(String _name) {
        this._name = _name;
    }

    public String getDescription() {
        return _description;
    }

    public void setDescription(String _description) {
        this._description = _description;
    }

    public String getImagePath() {
        return _imagePath;
    }

    public void setImagePath(String _imagePath) {
        this._imagePath = _imagePath;
    }

    public Float getPrice() {
        return _price;
    }

    public void setPrice(Float _price) {
        this._price = _price;
    }

    public int getCashbackPercentage() {
        return _cashbackPercentage;
    }

    public void setCashbackPercentage(int _cashbackPercentage) {
        this._cashbackPercentage = _cashbackPercentage;
    }

    public int getOwner() {
        return _owner;
    }

    public void setOwner(int _owner) {
        this._owner = _owner;
    }

    
}
