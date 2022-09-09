package tang.Dao.File;

import tang.Entity.File;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface FileDao {
    public void filePathKeep(Connection con, String filepath, String filetype) throws SQLException;
    public List<File> fileRead(Connection con) throws SQLException;

    public int getFileCount(Connection con) throws SQLException;
}
