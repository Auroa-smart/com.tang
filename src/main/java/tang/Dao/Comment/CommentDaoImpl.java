package tang.Dao.Comment;

import tang.Entity.Comment;
import tang.util.BaseDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDaoImpl implements CommentDao{
    @Override
    public void comment(Connection con,int comment_id, String comment_name, String cotent, int parent_id) throws SQLException {
        PreparedStatement pst = null;
        if(con!=null){
            String sql;
            if(parent_id==0){
                sql ="INSERT INTO firstcomment VALUES(null,?,?,?,?)";
            }else{
                sql ="INSERT INTO secondcomment VALUES(null,?,?,?,?)";
            }

            Object[] params={comment_id, comment_name, cotent,parent_id};

            int i = BaseDao.execute(con,sql,pst,params);
            if(i==1){
                System.out.println("插入成功");
                BaseDao.closeResource(null,pst,null);
            }else{
                System.out.println("插入失败");
            }
        }

    }

    public List<Comment> readFirstComment(Connection con) throws SQLException {
        List<Comment> comments = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs=null;

        if(con!=null){
            String sql = "SELECT * FROM firstcomment";
//            rs = BaseDao.execute(con,sql,rs,pst,null);

            pst = con.prepareStatement(sql);//预处理
            rs= pst.executeQuery();
            while(rs.next()){
                Comment comment =  new Comment();
                comment.setComment_id(rs.getInt("comment_id"));
                comment.setComment_name(rs.getString("comment_name"));
                comment.setContent(rs.getString("content"));
                comment.setParent_id(rs.getInt("parent_id"));
                comments.add(comment);
            }
        }

        BaseDao.closeResource(null,pst,rs);
        return comments;
    }

    @Override
    public List<Comment> readSecondComment(Connection con,int parentId) throws SQLException {
        List<Comment> comments = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs =null;
        if(con!=null){
            String sql = "SELECT * FROM secondcomment where parent_id=?";
            Object[] params={parentId};
//            pst = con.prepareStatement(sql);这种用的是函数
//            rs= pst.executeQuery();

            //如果用jdbc工具类呢
            rs=BaseDao.execute(con,sql,rs,pst,params);
            while(rs.next()){
                Comment comment = new Comment();
                comment.setComment_id(rs.getInt("comment_id"));
                comment.setComment_name(rs.getString("comment_name"));
                comment.setContent(rs.getString("content"));
                comment.setParent_id(rs.getInt("parent_id"));
                comments.add(comment);
            }
        }

        BaseDao.closeResource(null,pst,rs);
        return comments;
    }
}
