package Model;

/**
 *
 * @author Charlie
 */
public class Video {
    
    private int _id;
    private int _courseId;
    private String _name;
    private String _description;
    private String _path;

    public Video() { }

    public Video(int _id, int _courseId, String _name, 
            String _description, String _path) 
    {
        this._id = _id;
        this._courseId = _courseId;
        this._name = _name;
        this._description = _description;
        this._path = _path;
    }

    public int getId() {
        return _id;
    }

    public void setId(int _id) {
        this._id = _id;
    }

    public int getCourseId() {
        return _courseId;
    }

    public void setCourseId(int _courseId) {
        this._courseId = _courseId;
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

    public String getPath() {
        return _path;
    }

    public void setPath(String _path) {
        this._path = _path;
    }
}
