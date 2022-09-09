package tang.Service.Comment;

import tang.Dao.Comment.CommentDao;
import tang.Dao.Comment.CommentDaoImpl;
import tang.Entity.Comment;
import tang.util.BaseDao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class CommentServiceImpl implements CommentService{
    @Override
    public boolean commentWrite(int comment_id,String comment_name,String content,int parent_id) throws Exception {
        //评论内容写入数据库

        Connection con = BaseDao.getConnection();
        CommentDao commentDao =new CommentDaoImpl();
        commentDao.comment(con,comment_id,comment_name,content,parent_id);

        BaseDao.closeResource(con,null,null);
        return true;
    }
    public List<Comment> readFirstComment() throws Exception {

        List<Comment> firstcomment = new ArrayList<>();
        Connection con = BaseDao.getConnection();
        CommentDao commentDao = new CommentDaoImpl();
       firstcomment = commentDao.readFirstComment(con);

        BaseDao.closeResource(con,null,null);
        return firstcomment;

    }

    @Override
    public List<Comment> readSecondComment(int parentId) throws Exception {
        //根据父级评论的id找到所有子级评论
        List<Comment> secondcomment = new ArrayList<>();
        Connection con = BaseDao.getConnection();
        CommentDao commentDao = new CommentDaoImpl();
        secondcomment = commentDao.readSecondComment(con,parentId);

        BaseDao.closeResource(con,null,null);
        return secondcomment;
    }
}
