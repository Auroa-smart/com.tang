package tang.util;

import tang.Entity.User2;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

//操作数据库的公共类
public class BaseDao {
    private static final String driver;
    private static final String url;
    private static final String username;
    private static final String password;

    //静态代码块，类加载的时候就初始化了
    static {
        Properties properties = new Properties();
        //通过类加载器读取对应的资源
        InputStream is =
                 BaseDao.class.getClassLoader().getResourceAsStream("db.properties");
        try {
            properties.load(is);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //这里没问题啊！
        driver = properties.getProperty("driver");
        url = properties.getProperty("url");
        username = properties.getProperty("username");
        password = properties.getProperty("password");
    }
    //获取数据库的连接
    public static Connection getConnection() throws Exception {
        Connection con = null;
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, username, password);

            Statement stm = con.createStatement();
//            String sql = "SELECT * FROM student";
//            String sql="SELECT * FROM comment";
            String sql = "SELECT * FROM user";
            ResultSet rs = stm.executeQuery(sql);
//            while(rs.next()){
//                Student student = new Student();
//                student.setsId(rs.getString("sid"));
//                student.setsName(rs.getString("name"));
//                student.setsSex(rs.getString("sex"));
//                student.setsPhone(rs.getString("phone"));
//            }
//            while(rs.next()){
//                Comment comment = new Comment();
//                comment.setComment_id(rs.getInt("comment_id"));
//                comment.setComment_name(rs.getString("comment_name"));
//                comment.setContent(rs.getString("content"));
//                comment.setParent_id(rs.getString("parent_id"));
//            }

            while (rs.next()) {
                User2 user = new User2();
                user.setUser_id(rs.getInt("user_id"));
                user.setUser_name(rs.getString("user_name"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getInt("role"));
            }
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }

        return con;
    }
    //编写查询公共类
    public static ResultSet execute(Connection con, String sql,ResultSet rs,PreparedStatement pst, Object[] params) throws SQLException {
          //预编译的sql
        pst = con.prepareStatement(sql);//不是已经预处理了？

         for(int i = 0; i < params.length; i++){
             //setObject，占位符从1开始，但是数组从0开始的
             pst.setObject(i+1,params[i]);
         }
          rs = pst.executeQuery();//这里错了！！加了sql
           return rs;
    }//rs，pst都在参数里面更好关闭

    //查找所有学生信息
//    public static ResultSet execute(Connection con, String sql,ResultSet rs,PreparedStatement pst) throws SQLException {
//        pst = con.prepareStatement(sql);//不是已经预处理了？
//        rs = pst.executeQuery();//这里错了！！加了sql
//        System.out.println("找到啦o");
//        return rs;
//    }
    //增删改公共类方法
    public static int execute(Connection con, String sql,PreparedStatement pst, Object[] params) throws SQLException {
        pst = con.prepareStatement(sql);

        for(int i = 0; i < params.length; i++){////这是在干嘛？？？
            //setObject，占位符从1开始，但是数组从0开始的
            pst.setObject(i+1,params[i]);
        }
        int update = pst.executeUpdate();
        return update;
    }
    public static ResultSet execute(Connection con,String sql,PreparedStatement pst,ResultSet rs) throws SQLException {
        pst = con.prepareStatement(sql);
        rs = pst.executeQuery();
        return rs;
    }

    //释放资源
    public static boolean closeResource(Connection con,PreparedStatement pst,ResultSet rs)  {
        boolean flag=true;
        if(rs!=null){
            try {
                rs.close();
                rs = null;
                //GC回收
            } catch (SQLException e) {
                e.printStackTrace();
                flag=false;
            }
        }
        if(pst!=null){
            try {
                pst.close();
                pst=null;
                //GC回收
            } catch (SQLException e) {
                e.printStackTrace();
                flag=false;
            }
        }
        if(con!=null){
            try {
                con.close();
                con=null;
                //GC回收
            } catch (SQLException e) {
               e.printStackTrace();
               flag =false;
            }
        }
        return flag;
    }
}
