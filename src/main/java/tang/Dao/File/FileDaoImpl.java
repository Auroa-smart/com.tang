package tang.Dao.File;

import tang.Entity.File;
import tang.util.BaseDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FileDaoImpl implements FileDao{
        @Override
        public void filePathKeep(Connection con, String filepath,String filetype) throws SQLException {
                PreparedStatement pst = null;
                if(con != null){
                        String sql = "INSERT INTO file VALUES(?,?,?)";
                        //即使是自增的字段sql也需要占位符？
                        Object[] params ={null,filepath,filetype};
                        int i = BaseDao.execute(con,sql,pst,params);
                        if(i==1){
                                System.out.println("filetype成功");
                        }else{
                                System.out.println("失败");
                        }
                        BaseDao.closeResource(null,pst,null);
                }
        }

        @Override
        public List<File> fileRead(Connection con) throws SQLException {
                List<File> filespath = new ArrayList<>();
                PreparedStatement pst = null;
                ResultSet rs = null;

                if(con != null){
                        String sql = "SELECT * FROM file WHERE filetype=?";
                        Object[] params={"文档"};
//                        rs = BaseDao.execute(con,sql,rs,pst ,null);
                        //错误 params = null ???
                        rs = BaseDao.execute(con,sql,rs,pst,params);
                        while(rs.next()){
                                File file = new File();
                                file.setFile_id(rs.getInt("file_id"));
                                file.setFilepath(rs.getString("filepath"));
                                file.setFiletype(rs.getString("filetype"));
                                filespath.add(file);
                        }
                        BaseDao.closeResource(null,pst,rs);
                }
                return filespath;
        }

        @Override
        public int getFileCount(Connection con) throws SQLException {
                int cnt = 0;
//                List<File> fileList = new ArrayList<>();
                PreparedStatement pst = null;
                ResultSet rs = null;
                if(con!=null){
                        String sql = "select count(1) as count from file where filetype=?";
                        Object[] params = {"文档"};
                        rs = BaseDao.execute(con,sql,rs,pst,params);
                        if(rs.next()){
                           cnt = rs.getInt("count");
                        }

//                        while(rs.next()){
//                                File file = new File();
//                                file.setFile_id(rs.getInt("file_id"));
//                                file.setFilepath(rs.getString("filepath"));
//                                file.setFiletype(rs.getString("filetype"));
//                                fileList.add(file);
//                        }
                       BaseDao.closeResource(null,pst,rs);

                }
                return cnt;
        }
}
