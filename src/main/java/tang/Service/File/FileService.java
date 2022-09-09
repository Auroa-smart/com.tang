package tang.Service.File;

public interface FileService {
//    读取文件信息
    public String FileRead(String path);

    public void filePathKeep(String filepath, String filetype) throws Exception;

    int getFileCounet() throws Exception;
}
