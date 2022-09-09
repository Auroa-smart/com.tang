package tang.Dao.User;

import com.mysql.jdbc.StringUtils;
import tang.Entity.User2;
import tang.util.BaseDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao {
    public User2 getLoginUser(Connection con, int userid,String password) throws SQLException {
        PreparedStatement pst = null;
        ResultSet rs = null;
        User2 user = null;

        if (con != null) {
            String sql = "SELECT * FROM user where user_id=? and password=?";
            Object[] params = {userid,password};

            //通过用户提交的信息查询用户
            //BaseDao查询用户,返回结果集
            rs = BaseDao.execute(con, sql, rs, pst, params);

            if (rs.next()) {
                user = new User2();
                user.setUser_id(rs.getInt("user_id"));
                user.setUser_name(rs.getString("user_name"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getInt("role"));
//                user = new User();
//                user.setuId(rs.getInt("uid"));
//                user.setuName(rs.getString("uname"));
//                user.setuPassword(rs.getString("upassword"));
//                user.setucreateTime(rs.getString("ucreatetime"));
//                System.out.println("找到啦！");
            }
            BaseDao.closeResource(null, pst, rs);
        }
        return user;
    }

    public int RegisterUser(Connection con, int user_id, String user_name, String password, int role) throws SQLException {
        int i = 0;
        PreparedStatement pst = null;
        if (con != null) {
            String sql = "INSERT INTO user VALUES(?,?,?,?)";//id自增时可以直接为null
            Object[] params = {user_id, user_name,password,role};
            i = BaseDao.execute(con, sql, pst, params);

            BaseDao.closeResource(null, pst, null);
        }
        return i;
    }

    public boolean updatePwd(Connection con, int userId, String userName,String newPassword) throws SQLException {
        //根据用户id修改密码
        boolean flag = false;
        if (con != null) {
            PreparedStatement pst = null;
            String sql = "update user set password=? where user_id=? and user_name=?";

            //把密码和用户名封装？
            Object[] params = {newPassword, userId, userName};
            //之前写的是{id，password}???
            int i = BaseDao.execute(con, sql, pst, params);
            BaseDao.closeResource(null,pst,null);

        }
        return flag;
    }

    public int getUserCount(Connection con, String username, int userRole) throws SQLException {
        PreparedStatement pst = null;
        ResultSet rs = null;
        int count = 0;
        if (con != null) {
            StringBuffer sql = new StringBuffer();//?????????????
            sql.append("select count(1) as count from user u, role r where u.role=r.role_id");

            ArrayList<Object> list = new ArrayList<>();
            if (!StringUtils.isNullOrEmpty(username)) {
                sql.append(" and u.user_name like ?");
                list.add("%" + username + "%");//list默认的index为0
            }
            if (userRole > 0) {
                sql.append(" and u.role = ?");
                list.add(userRole);
            }
            //怎么把list转换为数组
            Object[] params = list.toArray();
            rs = BaseDao.execute(con, sql.toString(), rs, pst, params);
            if (rs.next()) {
                count = rs.getInt("count");
            }
            BaseDao.closeResource(null, pst, rs);
        }
        return count;

    }

    @Override
    public List<User2> getUser(Connection con, String username, int userRole,int currentPageNo,int pageSize) throws SQLException {
        List<User2> users = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs= null;
        if(con!=null){
            StringBuffer sql = new StringBuffer();
            sql.append("select u.*,r.rolename as userRoleName from user u, role r where u.role=r.role_id");
            List<Object> list = new ArrayList<>();
            if(!StringUtils.isNullOrEmpty(username)){
                sql.append(" and u.user_name like ?");
                list.add("%"+username+"%");
            }
            if(userRole >0){
                sql.append(" and u.role = ?");
                list.add(userRole);
            }
            sql.append(" order by u.user_id DESC limit ?,?");
            currentPageNo = (currentPageNo -1)*pageSize;
            list.add(currentPageNo);
            list.add(pageSize);

            Object[] params = list.toArray();
            rs = BaseDao.execute(con,sql.toString(),rs,pst,params);
            while(rs.next()){
                User2 user =new User2();
                user.setUser_id(rs.getInt("user_id"));
                user.setUser_name(rs.getString("user_name"));
                user.setPassword(rs.getString("password"));
//                user.setucreateTime(rs.getString("ucreatetime"));
                user.setRole(rs.getInt("role"));
                users.add(user);
            }
        }

        BaseDao.closeResource(null,pst,rs);
        return users;
    }

    @Override
    public void userDelete(Connection con, int userId, String userName) throws SQLException {
        PreparedStatement pst = null;
        if(con!=null){
            String sql ="DELETE FROM user WHERE user_id=? and user_name=?";
            Object[] params={userId,userName};
            BaseDao.execute(con,sql,pst,params);
            BaseDao.closeResource(null,pst,null);
        }
    }

    @Override
    public User2 userView(Connection con, int userId) throws SQLException {
        User2 user = new User2();
        PreparedStatement pst = null;
        ResultSet rs =null;

        if(con!=null){
            String sql="select * from user where user_id=?";
            Object[] params={userId};
            rs = BaseDao.execute(con,sql,rs,pst, params);
            while(rs.next()){
                user.setUser_id(rs.getInt("user_id"));
                user.setUser_name(rs.getString("user_name"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getInt("role"));
            }
        }
        return user;
    }
}
