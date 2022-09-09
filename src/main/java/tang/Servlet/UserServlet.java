package tang.Servlet;

import tang.Entity.Role;
import tang.Entity.User2;
import tang.Service.Role.RoleService;
import tang.Service.Role.RoleServiceImpl;
import tang.Service.User.UserService;
import tang.Service.User.UserServiceImpl;
import tang.util.Constant;
import tang.util.PageSupport;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //检查是否是管理员
        String method = req.getParameter("method");
        if(method.equals("savepwd")&&method!=null){
            try {
                this.updatePwd(req,resp);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }else if(method.equals("query")&&method!=null){
            try {
                this.query(req,resp);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }else if(method.equals("delete")){
            try {
                this.delete(req,resp);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }else if(method.equals("view")){
            this.userView(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("method");
        if(method.equals("add")){
            try {
                this.addList(req,resp);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }else if(method.equals("pwdmodify")&&method!=null){
            try {
                this.updatePwd(req,resp);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }

    public void query(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        //前端获取数据
        String queryUserName = req.getParameter("queryname");
        String temp = req.getParameter("queryUserRole");
        String pageIndex = req.getParameter("pageIndex");

        int queryUserRole =0;

        //获取用户列表
        UserService userService =new UserServiceImpl();
        //第一次走这个请求，一定是第一页，页面大小固定的
        int pageSize = 5;//可以把这个写到配置文件，方便后期修改
        int currentPageNo = 1;
        if(queryUserName == null){
            queryUserName="";
        }
        if(temp!=null&&!temp.equals("")){
            queryUserRole = Integer.parseInt(temp);//给查询赋值
        }
        if(pageIndex!=null){
            currentPageNo = Integer.parseInt(pageIndex);
        }
        //获取用户的总数(分页：上一页和下一页）

        int totalCount = userService.getCountService(queryUserName,queryUserRole);

        //总页数支持
        PageSupport pageSupport = new PageSupport();
        pageSupport.setCurrentPageNo(currentPageNo);
        pageSupport.setPageSize(pageSize);
        pageSupport.setTotalCount(totalCount);

        int totalPageCount =((int)(totalCount/pageSize))+1;

        //控制首页和尾页

        //如果页面小于1，就显示第一页
        if(totalPageCount<1){
            currentPageNo =1;
        }else if(currentPageNo>totalPageCount){//当前页大于最后一页
            currentPageNo=totalPageCount;
        }

        //获取用户列表展示
        List<User2> userlist = userService.getUser(queryUserName,queryUserRole,currentPageNo,pageSize);
        req.setAttribute("userList",userlist);

        RoleService roleService = new RoleServiceImpl();
        List<Role> rolelist = roleService.getRole();
        //把数据传到前端

        req.setAttribute("roleList",rolelist);
        req.setAttribute("totalCount",totalCount);
        req.setAttribute("currentPageNo",currentPageNo);
        req.setAttribute("totalPageCount",totalPageCount);//最大页数，总共几页
        req.setAttribute("queryUserName",queryUserName);//最大页数，总共几页
        req.setAttribute("queryUserRole",queryUserRole);//最大页数，总共几页

        //返回前端
        req.getRequestDispatcher("/jsp/userList.jsp").forward(req,resp);


    }
    public void addList(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String user_id=req.getParameter("user_id");
        int userId=Integer.parseInt(user_id);
        String userName = req.getParameter("user_name");

        String urole = req.getParameter("user_role");
        int role = Integer.parseInt(urole);

        String userPassword = req.getParameter("password");

        UserService userService1 = new UserServiceImpl();
        int i = userService1.register(userId,userName,userPassword,role);
        if(i==1){
            System.out.println("成功创建用户");
        }
        req.getRequestDispatcher("/jsp/userList.jsp").forward(req,resp);
    }
    public void delete(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        UserService userService =new UserServiceImpl();
        String user_id = req.getParameter("user_id");
        int userId = Integer.parseInt(user_id);
        String userName = req.getParameter("user_name");
        userService.userDelete(userId,userName);
        req.getRequestDispatcher("/jsp/userList.jsp").forward(req,resp);
    }

    protected void updatePwd(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        boolean flag =false;
        String user_id = req.getParameter("user_id");
        int userId = Integer.parseInt(user_id);
        String userName = req.getParameter("user_name");
        String oldPassword =req.getParameter("oldpassword");
        String newPassword =req.getParameter("newpassword");
        //先验证旧密码是否正确
        UserService userService = new UserServiceImpl();
        User2 user = new User2();
        user = userService.login(userId,oldPassword);
        //根据id修改密码
        if(user!=null){
            userService.updatePwd(userId,userName,newPassword);
            User2 usernow = (User2) req.getSession().getAttribute(Constant.USER_SESSION);
            if(usernow.getRole()==1){
                req.getRequestDispatcher("/jsp/home.jsp").forward(req,resp);
            }else{
                req.getRequestDispatcher("/jsp/userList.jsp").forward(req,resp);
            }
        }else{
            System.out.println("修改失败");
        }
    }
    protected void userView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user_id=req.getParameter("user_id");
        int userId=Integer.parseInt(user_id);
        System.out.println(userId);
        UserService userService = new UserServiceImpl();
        User2 user = new User2();
        user = userService.userView(userId);
//        req.setAttribute("user",user);

        req.setAttribute("userId",user.getUser_id());
        req.setAttribute("userName",user.getUser_name());
        req.setAttribute("password",user.getPassword());
        req.setAttribute("role",user.getRole());
        req.getRequestDispatcher("/jsp/userview.jsp").forward(req,resp);
    }

}
