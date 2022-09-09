package tang.Service.Comment;

import tang.Entity.Comment;

import java.util.List;

public interface CommentService {
    public boolean commentWrite(int comment_id, String comment_name, String content, int parent_id) throws Exception;

    List<Comment> readFirstComment() throws Exception;
    List<Comment> readSecondComment(int parentId) throws Exception;
}
