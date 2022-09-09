package tang.Service.User;

import tang.Entity.User2;

import java.util.List;

public interface UserService {
    //用户登录
    public User2 login(int userid, String upassword);
    int register(int user_id, String user_name, String password, int role) throws Exception;

    boolean updatePwd(int userId, String userName, String newPassword) throws Exception;

    int getCountService(String username, int userRole) throws Exception;

    List<User2> getUser(String username, int userRole, int currentPageNo, int pageSize) throws Exception;

    void userDelete(int userId, String userName) throws Exception;
    //根据id用户所有信息
    User2 userView(int userId);

}
