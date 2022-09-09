package tang.Test;

import tang.Dao.File.FileDao;
import tang.Dao.File.FileDaoImpl;
import tang.Entity.*;
import tang.util.BaseDao;

import java.sql.Connection;

public class test1 {

    public static void main(String[] args) throws Exception {
//
//        List<File> fileList = new ArrayList<>();
        FileDao fileDao = new FileDaoImpl();

        Connection con = BaseDao.getConnection();
        System.out.println("count:"+fileDao.getFileCount(con));
        BaseDao.closeResource(con,null,null);
//        fileList = fileDao.fileRead(con);
//        FileService fileService = new FileServiceImpl();
//       for(File file:fileList){
////           String text = fileService.FileRead(file.getFilepath());
////           System.out.println(text);
//           System.out.println(file.getFilepath());
//           System.out.println("-------------------------------------------");
//       }






//
//        UserService userService =new UserServiceImpl();
//        User2 user = userService.userView(1);
//        System.out.println(user.toString());
//        userService.userDelete(11,"ww");
//        List<User2> users = new ArrayList<>();
//        int count = userService.getCountService(null,0);
//
//        System.out.println(count);
//
//        users = userService.getUser(null,0,1,5);
//        for(User2 user:users){
//            System.out.println(user.toString());
//        }
//        System.out.println("********************");
//        RoleService roleService =new RoleServiceImpl();
//        List<Role> roles = new ArrayList<>();
//        roles = roleService.getRole();
//        for(Role r: roles){
//            System.out.println(r.toString());
//        }
//********************************************************
//        CommentService commentService =new CommentServiceImpl();
////
//        List<Comment> firstcomment = new ArrayList<>();
//        firstcomment = commentService.readFirstComment();
        //所有父级评论
//        for(Comment f:firstcomment){
//            System.out.println(f.toString());
//        }

//        for(Comment cs:firstcomment){
//            System.out.println(cs.toString());
//            List<Comment> secondcomment = new ArrayList<>();
//            //根据一级评论id查询子评论
//            secondcomment = commentService.readSecondComment(cs.getComment_id());
//            //输出所有该父级评论的子评论
//            for(Comment c:secondcomment){
//                System.out.println(c.toString());
//            }
//            System.out.println("---------------------------------------");
//        }



    }
}
