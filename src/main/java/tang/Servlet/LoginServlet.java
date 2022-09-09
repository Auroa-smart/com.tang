package tang.Servlet;

import tang.Entity.User2;
import tang.Service.User.UserService;
import tang.Service.User.UserServiceImpl;
import tang.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取用户密码
        String user_id =  req.getParameter("user_id");
        int userid=Integer.parseInt(user_id);
        String password = req.getParameter("password");
        //和数据库中的数据对比，调用业务层
        UserService userService = new UserServiceImpl();
        User2 user = userService.login(userid, password);//这里已经把登陆的人给查出来了
        //业务层返回了一个user
        if(user!=null){
            //将用户的信息放到Session中
            req.getSession().setAttribute(Constant.USER_SESSION,user);
            //跳转到内部主页
            String path = req.getContextPath();
            resp.sendRedirect(path+"/jsp/home.jsp");//跳转到主页
        }else{//无法登陆，查无此人
            //转发回登录页面，顺带提示他用户名或者密码错误·
            req.setAttribute("error","用户名或密码错误");
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
