package tang.Dao.Comment;

import tang.Entity.Comment;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface CommentDao {
    void comment(Connection con, int comment_id, String comment_name, String cotent, int parent_id) throws SQLException;

    List<Comment> readFirstComment(Connection con) throws SQLException;
    List<Comment> readSecondComment(Connection con, int parentId) throws SQLException;
}
