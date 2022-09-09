package tang.Service.User;

import tang.Dao.User.UserDao;
import tang.Dao.User.UserDaoImpl;
import tang.Entity.User2;
import tang.util.BaseDao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class UserServiceImpl implements UserService {
    //业务层都会调用Dao层，所以要引入Dao层
    private UserDao userDao;//???????

    public UserServiceImpl(){
        userDao = new UserDaoImpl();
    }

    public User2 login(int userid, String password) {
        Connection con = null;
        User2 user = null;
        try {
            con = BaseDao.getConnection();
            //给Dao层去执行查找
            user = userDao.getLoginUser(con,userid,password);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(con,null,null);
        }
       return user;
    }//调用这个方法的人就能拿到用户


    public int register(int user_id, String user_name,String password, int role) throws Exception {
        //       User user= new User();
//        user.setuName(uname);
//        user.setuPassword(upassword);
//        user.setucreateTime(ucreatetime);

        Connection con = BaseDao.getConnection();

        int i= userDao.RegisterUser(con,user_id,user_name,password,role);
        System.out.println("ii:"+i);
        BaseDao.closeResource(con,null,null);
        return i;
    }

    public boolean updatePwd(int userId,String userName,String newPassword) throws Exception {
        boolean flag =false;
        Connection con=BaseDao.getConnection();
        if(con != null){
            UserDao userDao1=new UserDaoImpl();
            flag = userDao1.updatePwd(con,userId,userName, newPassword );
            BaseDao.closeResource(con,null,null);
        }
        return flag;
    }

    public int getCountService(String username, int userRole) throws Exception {
        Connection con = BaseDao.getConnection();
        UserDao userDao = new UserDaoImpl();
        int count;
        count=userDao.getUserCount(con,username,userRole);
        BaseDao.closeResource(con,null,null);//总是忘记关闭
        return count;
    }

    public List<User2> getUser(String username, int userRole,int currentPageNo,int pageSize) throws Exception {
        List<User2> users = new ArrayList<>();
        Connection con =BaseDao.getConnection();
        UserDao userDao = new UserDaoImpl();
        users=userDao.getUser(con,username,userRole,currentPageNo,pageSize);
        BaseDao.closeResource(con,null,null);
        return users;
    }

    @Override
    public void userDelete(int userId, String userName) throws Exception {
        Connection con =BaseDao.getConnection();
        UserDao userDao1 = new UserDaoImpl();
        userDao1.userDelete(con,userId,userName);
        BaseDao.closeResource(con,null,null);
    }

    @Override
    public User2 userView(int userId) {
        User2 user = new User2();
        try (Connection con = BaseDao.getConnection()) {
            UserDao userDao = new UserDaoImpl();
            user = userDao.userView(con,userId);
        } catch (Exception e) {
           e.printStackTrace();
        }
        return user;
    }
}
