package tang.Servlet;

import tang.Service.User.UserService;
import tang.Service.User.UserServiceImpl;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        System.out.println("进入RegisterServlet");
        //接收数据
        String u_id = req.getParameter("uid");
        int uid=Integer.parseInt(u_id);
        System.out.println(uid);

         String uname =  req.getParameter("uname");
        System.out.println("uname:"+uname);
        String upassword = req.getParameter("upassword");

//        String ucreatetime = req.getParameter("ucreatetime");

        String urole = req.getParameter("urole");
        int role = Integer.parseInt(urole);

        UserService userService = new UserServiceImpl();


        int i = 0;
        try {
            i = userService.register(uid,uname, upassword,role);
            System.out.println("i:"+i);

            if(i!=1){
                System.out.println("插入失败");

            }else{
                System.out.println("插入成功");
//                req.getRequestDispatcher("login.jsp").forward(req,resp);
                String path = req.getContextPath();
                resp.sendRedirect(path+"/login.jsp");//跳转到登录页
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("出错啦");
        }

    }
}
