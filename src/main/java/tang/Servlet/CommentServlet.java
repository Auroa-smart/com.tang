package tang.Servlet;

import tang.Entity.Comment;
import tang.Entity.User2;
import tang.Service.Comment.CommentService;
import tang.Service.Comment.CommentServiceImpl;
import tang.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method=req.getParameter("method");
      if(method.equals("readFirstComment")){
          try {
              this.readFirstComment(req,resp);
          } catch (Exception e) {
              throw new RuntimeException(e);
          }
      }else if(method.equals("readSecondComment")) {
          try {
              this.readSecondComment(req,resp);
          } catch (Exception e) {
              throw new RuntimeException(e);
          }
      }else if(method.equals("writeComment")){
            try {
                this.writeComment(req,resp);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
              //写评论：
              //要判断是几级评论
              //根据前端传的评论级数和评论内容


              //因为每次写评论后都要展示到前端，不如直接写在servlet，每次写了之后都直接展示

      }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    protected void writeComment(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        //写评论：
        //要判断是几级评论

        System.out.println("执行嘞commentservlet");
        //根据前端传的评论级数和评论内容
        String content = req.getParameter("content");
        String parentid=req.getParameter("parentid");

        int parent_id = Integer.parseInt(parentid);
        System.out.println(parent_id);

        //session获取当前评论用户的信息
        User2 user =(User2) req.getSession().getAttribute(Constant.USER_SESSION);

       CommentService commentService = new CommentServiceImpl();
       commentService.commentWrite(user.getUser_id(),user.getUser_name(),content,parent_id);

        //返回前端
        req.getRequestDispatcher("/jsp/home.jsp").forward(req,resp);

    }

    protected void readFirstComment(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        CommentService commentService = new CommentServiceImpl();
        List<Comment> firstcommets = new ArrayList<>();
        firstcommets = commentService.readFirstComment();

        //传到前端
        req.setAttribute("firstcomments",firstcommets);

        //返回前端
        req.getRequestDispatcher("/jsp/home.jsp").forward(req,resp);
    }
    protected void readSecondComment(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String parent = req.getParameter("parent");
        int parent_id = Integer.parseInt(parent);

        CommentService commentService = new CommentServiceImpl();

        List<Comment> secondcommets = new ArrayList<>();

        secondcommets =commentService.readSecondComment(parent_id);

        //传到前端
        req.setAttribute("secondcomments",secondcommets);

        //返回前端
        req.getRequestDispatcher("/jsp/home.jsp").forward(req,resp);
    }

}
