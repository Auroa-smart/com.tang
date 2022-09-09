package tang.Entity;

public class File {
    private String filepath;

    private int file_id;

    private String filetype;

    public String getFiletype() {
        return filetype;
    }

    public void setFiletype(String filetype) {
        this.filetype = filetype;
    }

    public int getFile_id() {
        return file_id;
    }

    public void setFile_id(int file_id) {
        this.file_id = file_id;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    @Override
    public String toString() {
        return "File{" +
                "filepath='" + filepath + '\'' +
                ", file_id=" + file_id +
                ", filetype='" + filetype + '\'' +
                '}';
    }
}
