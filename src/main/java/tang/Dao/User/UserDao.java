package tang.Dao.User;

import tang.Entity.User2;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface UserDao {
    //得到登录的用户
     User2 getLoginUser(Connection conn, int userid, String password) throws SQLException;
//     int RegisterUser(Connection con, String uname, String password, String ucreatetime) throws SQLException;
     int RegisterUser(Connection con, int user_id, String user_name, String password, int role) throws SQLException;

     boolean updatePwd(Connection con, int userId, String userName, String newPassword) throws SQLException;

     int getUserCount(Connection con, String username, int userRole) throws SQLException;

     List<User2> getUser(Connection con, String username, int userRole, int currentPageNo, int pageSize)throws SQLException ;

     void userDelete(Connection con, int UserId, String userName) throws SQLException;

     User2 userView(Connection con, int userId) throws SQLException;

}
