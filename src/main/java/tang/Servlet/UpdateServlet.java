package tang.Servlet;

import tang.Service.User.UserService;
import tang.Service.User.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //接收用户名和密码
        //获取用户密码
        String uid = req.getParameter("uid");
        String upassword = req.getParameter("upassword");
        boolean flag;
        UserService userService = new UserServiceImpl();
//        try {
//            flag = userService.updatePwd(uid, upassword);
//            if (flag) {
//                String path = req.getContextPath();
//                resp.sendRedirect(path + "/login.jsp");//跳转到登录页
//            } else {
//                String path = req.getContextPath();
//                resp.sendRedirect(path + "/error.jsp");//跳转到登录页
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    }
}
