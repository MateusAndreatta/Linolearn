package Model;

public class VideoWatched extends BaseModel 
{    
    private int _idUser;
    private int _idVideo;
    private int _courseId;
    private String _finished;

    public VideoWatched() { }

    public VideoWatched(int _id, int _idUser, int _idVideo, int _courseId, 
            String _finished) 
    {
        this._id = _id;
        this._idUser = _idUser;
        this._idVideo = _idVideo;
        this._courseId = _courseId;
        this._finished = _finished;
    }

    public int getId() {
        return _id;
    }

    public void setId(int _id) {
        this._id = _id;
    }

    public int getIdUser() {
        return _idUser;
    }

    public void setIdUser(int _idUser) {
        this._idUser = _idUser;
    }

    public int getIdVideo() {
        return _idVideo;
    }

    public void setIdVideo(int _idVideo) {
        this._idVideo = _idVideo;
    }

    public int getCourseId() {
        return _courseId;
    }

    public void setCourseId(int _courseId) {
        this._courseId = _courseId;
    }

    public String getFinished() {
        return _finished;
    }

    public void setFinished(String _finished) {
        this._finished = _finished;
    }
}
